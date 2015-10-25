<?php
/*
 * 支付处理类
 * @author wanghan
 * @version 1.0 2013-03-13
 */
//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/DB.php";
/**
 * 支付状态  未支付
 */
define("PAY_STATUS_UNPAY", 1);

/**
 * 支付状态  支付成功
 */
define("PAY_STATUS_SUCCESS", 2);

/**
 * 支付状态  支付完成
 */
define("PAY_STATUS_FINISHED", 3);


/**
 * 通知游戏服状态:没成功
 */
define("PAY_NOTICE_STATUS_UNSUCCESS", 0);

/**
 * 通知游戏服状态：成功
 */
define("PAY_NOTICE_STATUS_SUCCESS", 1);

/**
 * 通知游戏服最大次数
 */
define("PAY_NOTICE_MAX_TIMES", 8);



class Pay {
	
	private $db;

	private $log_notice_fail_file;
	/**
	 * 构造函数
	 */
	public function __construct(){        
        $this->db = new DB();
        $this->log_notice_fail_file = SYSDIR_ROOT.'/alipay/log/notice_fail.log';
    }
    /**
     * 析构函数
     */
    public function __destruct(){
    	
    }
	
    /**
     * 生成订单
     */
    public function createOrder($uid, $area_id, $pay_type, $pay_money, $gold_type, $gold_num='', $gold_name='', $expand_info='') {
    	$pay_order_id = $this->genOrderId();

    	$insert_data = array();
    	$insert_data['uid'] = $uid;
    	$insert_data['area_id'] = $area_id;
    	$insert_data['pay_type'] = $pay_type;
    	$insert_data['pay_order_id'] = $pay_order_id;
    	$insert_data['pay_money'] = $pay_money;
    	$insert_data['pay_gener_time'] = time();
    	$insert_data['pay_status'] = PAY_STATUS_UNPAY;
    	$insert_data['pay_finish_time'] = 0;
    	$insert_data['pay_notice_status'] = PAY_NOTICE_STATUS_UNSUCCESS;
    	$insert_data['pay_notice_times'] = 0;
    	$insert_data['pay_notice_last_time'] = 0;
    	$insert_data['gold_type'] = $gold_type;
    	$insert_data['gold_name'] = $gold_name;
    	$insert_data['gold_num'] = $gold_num;
    	$insert_data['expand_info'] = $expand_info;
    	
    	//订单写入数据库
    	$this->db->use_db('write');
		$result = $this->db->insert('payment', $insert_data);
		
		if(!$result) {
			return false;
		} else {
			return $insert_data;
		}
    	
    }
    
    /**
     * 检测区号是否存在
     * @param int $area_id 区ID
     */
    public function checkAreaId($area_id) {
    	$sql = 'SELECT COUNT(*) num FROM garea WHERE area_id="'.$area_id.'"';;
  		$this->db->use_db('read');
  		$checkRows = $this->db->query($sql);
  		if(is_array($checkRows) && $checkRows[0]['num']>0) {
			return true;  			
  		} else {
  			return false;
  		}
    }
    
    
    /**
     * 获取订单信息
     * @param string $condition
     */
    public function getOrderByOrderId($pay_order_id) {
    	if(!$pay_order_id) {
    		return false;
    	}
    	$sql = 'SELECT * FROM payment WHERE pay_order_id="'.$pay_order_id.'"';
    	$this->db->use_db('read');
    	$results = $this->db->query($sql);
    	if(count($results>0)){
    		return $results[0];
    	} else {
    		return false;
    	}
    }
    
    /**
     * 更改订单状态
     * @param string $pay_order_id
     * @param int $pay_status
     */
    public function updatePayStatus($pay_order_id,$pay_status) {

    	$update_data = array();
    	$update_data['pay_status'] = $pay_status;
    	
    	//如果支付完成 更新pay_finish_time
    	if($pay_status == PAY_STATUS_FINISHED) {
    		$update_data['pay_finish_time'] = time();
    	}
    	$where = ' pay_order_id="'.$pay_order_id.'"';
    	$this->db->use_db('write');
    	if($this->db->update('payment', $update_data, $where)){
    		return true;
    	} else {
    		return false;
    	}
    }
    
    /**
     * 通知游戏服
     * @param string $pay_order_id
     */
    public function noticeGameServer($pay_order_id) {
    	 $orderInfo = $this->getOrderByOrderId($pay_order_id);
    	 //记录不存在
    	 if(!$orderInfo) {
    	 	return false;
    	 }

    	 //已通知成功
    	 if($orderInfo['pay_notice_status'] == PAY_NOTICE_STATUS_SUCCESS) {
    	 	return false;
    	 }
    	 
    	 //已超过最大通知次数
    	 if($orderInfo['pay_notice_times'] >= PAY_NOTICE_MAX_TIMES) {
    	 	return false;
    	 }
    	 
    	 //组装参数请求 curl 请求 
    	 //获取区服信息
    	 $area_info = $this->getGameAreaInfo($orderInfo['area_id']);
    	 if($area_info) {
    	 	//参数
    	 	$params = array();
    	 	$params['uid'] = $orderInfo['uid'];
    	 	$params['pay_order_id'] = $orderInfo['pay_order_id'];
    	 	$params['pay_money'] = $orderInfo['pay_money'];
    	 	$params['gold_type'] = $orderInfo['gold_type'];
    	 	$params['gold_name'] = $orderInfo['gold_name'];
    	 	$params['gold_num'] = $orderInfo['gold_num'];

    	 	$params = $this->paraFilter($params);
    	 	$params = $this->argSort($params);
    	 	
    	 	$sign = $this->genSign($params, $area_info['area_key']);
    	 	$params['sign'] = $sign;
    	 	
    	 	$notice_result = makeRequest($area_info['area_pay_notice_url'],$params,'GET');
    	 	//验证请求是否成功
    	 	
    	 	$notice_status = $notice_result['result'];
    	 	
    	 	if(PAY_NOTICE_STATUS_SUCCESS == $notice_status) {
	    	 	//通知成功 更新的订单信息
	    	 	$update_data = array(
	    	 		'pay_notice_status' => PAY_NOTICE_STATUS_SUCCESS,
	    	 		'pay_notice_times' => $orderInfo['pay_notice_times'] +1,
	    	 		'pay_notice_last_time' => time()
	    	 	);
	
	    	 	$this->updateNoticeStatus($pay_order_id, $update_data);
	    	 	
	    	} else {
	    	 	//通知未成功 更新的订单信息
	    	 	$update_data = array(
	    	 		'pay_notice_status' => PAY_NOTICE_STATUS_UNSUCCESS,
	    	 		'pay_notice_times' => $orderInfo['pay_notice_times'] +1,
	    	 		'pay_notice_last_time' => time()
	    	 	);
	
	    	 	$this->updateNoticeStatus($pay_order_id, $update_data);
	    	 	
	    	 	//打log记录通知失败信息
	    	 	@$this->errorRecord($this->log_notice_fail_file, $area_info['area_pay_notice_url'], '通知失败' ,$params);
	    	 	
	    	 	return false;
	    	}
	    	    	 	
    	 } else {
    	 	return false;
    	 }    	 
    }
    
    
	/**
     * 更改通知游戏区服状态
     * @param string $pay_order_id
     * @param int $pay_status
     */
    public function updateNoticeStatus($pay_order_id,$data) {
    	$update_data = array();
    	$update_data = $data;
    	$where = ' pay_order_id="'.$pay_order_id.'"';
    	$this->db->use_db('write');
    	if($this->db->update('payment', $update_data, $where)){
    		return false;
    	} else {
    		return true;
    	}
    }
    
    public function getGameAreaInfo($area_id) {
    	if(!$area_id) {
    		return false;
    	}
    	$sql = 'SELECT * FROM garea WHERE area_id="'.$area_id.'"';
    	$this->db->use_db('read');
    	$results = $this->db->query($sql);
    	if(count($results>0)){
    		return $results[0];
    	} else {
    		return false;
    	}
    }

    /**
     * 生成唯一订单号
     */
	protected function genOrderId() {
		return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
	}
	
	/**
	 * 把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串
	 * @param $para 需要拼接的数组
	 * return 拼接完成以后的字符串
	 */
	protected function createLinkstring($para) {
		$arg  = "";
		while (list ($key, $val) = each ($para)) {
			$arg.=$key."=".$val."&";
		}
		//去掉最后一个&字符
		$arg = substr($arg,0,count($arg)-2);
		
		//如果存在转义字符，那么去掉转义
		if(get_magic_quotes_gpc()){$arg = stripslashes($arg);}
		
		return $arg;
	}
	
	/**
	 * 把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串，并对字符串做urlencode编码
	 * @param $para 需要拼接的数组
	 * return 拼接完成以后的字符串
	 */
	protected function createLinkstringUrlencode($para) {
		$arg  = "";
		while (list ($key, $val) = each ($para)) {
			$arg.=$key."=".urlencode($val)."&";
		}
		//去掉最后一个&字符
		$arg = substr($arg,0,count($arg)-2);
		
		//如果存在转义字符，那么去掉转义
		if(get_magic_quotes_gpc()){$arg = stripslashes($arg);}
		
		return $arg;
	}
	/**
	 * 除去数组中的空值和签名参数
	 * @param $para 签名参数组
	 * return 去掉空值与签名参数后的新签名参数组
	 */
	protected function paraFilter($para) {
		$para_filter = array();
		while (list ($key, $val) = each ($para)) {
			if($key == "sign" || $key == "sign_type" || $val == "")continue;
			else	$para_filter[$key] = $para[$key];
		}
		return $para_filter;
	}
	/**
	 * 对数组排序
	 * @param $para 排序前的数组
	 * return 排序后的数组
	 */
	protected function argSort($para) {
		ksort($para);
		reset($para);
		return $para;
	}
	
	/**
	 * 生成签名
	 * @param  array $params 参数数组
	 * @param  密钥
	 */
	
	private function genSign($params,$key) {
    	$linkString = $this->createLinkstring($params);
    	$linkString .='&key='.$key;
    	return md5($linkString);
	}
	
	/**
	 * 写错误日志
	 * @param string $file 日志文件路径
	 * @param string $request_url 请求的url
	 * @param string $error 错误说明 
	 * @param string $params 额外参数
	 */
	public function errorRecord($file_path,$request_url,$error,$params=array()) {
		$params_string = $this->createLinkstring($params);
		$error = "[".date('Y-m-d H:i:s')."]\n"."url=$request_url \n"."params:$params_string \n".$error."\n";
		@file_put_contents($file_path,$error,FILE_APPEND);
		return true;
	}
	
	/**
	 * 取出通知失败的订单列表
	 */
	public function getNoticeFailOrders() {
		$sql = 'SELECT * FROM payment WHERE pay_notice_status=0 AND pay_notice_times<'.PAY_NOTICE_MAX_TIMES;
		$this->db->use_db('read');
		return $this->db->query($sql);
	}
} 