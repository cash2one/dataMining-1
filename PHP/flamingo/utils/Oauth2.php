<?php
/*
 * oauth2 授权认证类
 * @author wanghan
 * @version 1.0 2013-03-13
 */

/**
 * access token 有效期  默认3600秒
 */
define("OAUTH2_DEFAULT_ACCESS_TOKEN_LIFETIME", 3600);

/**
 * authorization code 有效期
 */
define("OAUTH2_DEFAULT_AUTH_CODE_LIFETIME", 30);

/**
 * 默认授权权限
 */
define("OAUTH2_DEFAULT_SCOPE", 'basic');

/**
 * 无效的access token 状态码
 */
define("OAUTH2_INVALID_ACCESS_TOKEN_STATUS", 0);

/**
 * 有效的access token 状态码
 */
define("OAUTH2_VALID_ACCESS_TOKEN_STATUS", 1);


//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/DB.php";

class Oauth2 {
	
	private $db;
	
	/**
	 * 构造函数
	 */
	public function __construct(){        
        $this->db = new DB();
    }
    /**
     * 析构函数
     */
    public function __destruct(){
    	
    }
    
    /**
     * 生成Authorize Code
     * @param int $client_id 
     * @param string $redirect_uri
     * @param string $scope
     */
	public function createAuthCode( $uid, $app_id, $scope = NULL) {		
	    $code = $this->generateAuthCode();
	    	    
	   	$expires = OAUTH2_DEFAULT_AUTH_CODE_LIFETIME;
	   	if($this->setAuthCode($uid, $code, $app_id, $expires, $scope)){
	   		return $code;
	   	} else {
	   		return false;
	   	}
  	}
	
  	/**
  	 * 生成唯一的auth Code
  	 */
  	protected function generateAuthCode() {
   		return md5(base64_encode(pack('N6', mt_rand(), mt_rand(), mt_rand(), mt_rand(), mt_rand(), uniqid())));
  	}
  	
	/**
	 * 
	 * 保存 auth Code 
	 * @param string $code
	 * @param int $client_id
	 * @param string $redirect_uri
	 * @param int $expires
	 * @param string $scope 授权类型
	 */
  	protected function setAuthCode($uid, $auth_code, $app_id, $expires, $scope = NULL) {
  		
  		$insert_data = array();
  		$time = time();
  		$insert_data['uid'] 				= $uid;
  		$insert_data['app_id'] 			= $app_id;
  		$insert_data['auth_code'] 			= $auth_code;
  		$insert_data['auth_gener_time'] 	= $time;
  		$insert_data['auth_expire_time'] 	= $time + $expires;
  		
  		$this->db->use_db('write');
  		$result = $this->db->insert('auth_code', $insert_data);
  		
  		if(!$result) {
  			return false;
  		} else {
  			return true;
  		}	
  	}
  	
  	/**
  	 * 创建accessToken
  	 * @param string $auth_code	用户传过来的auth_code
  	 * @param string $scope 访问范围
  	 * @return array 
  	 */
	public function createAccessToken($auth_code, $scope = NULL) {
		
	    $access_token = $this->generateAccessToken();
	    $access_refresh_token = $this->generateAccessToken();
	    $scope = $scope ? $scope : OAUTH2_DEFAULT_SCOPE;
	    $expires = OAUTH2_DEFAULT_ACCESS_TOKEN_LIFETIME;
	    
		$token = array(
	      "access_token" => $access_token,
	      "expires_in" => $expires,
	      "scope" => $scope,
		  "refresh_token" => $access_refresh_token
	    );
	    
	    $auth_code_row = $this->getAuthCode($auth_code);
	    
	    //事务处理 先禁用以前的token 再插入新的token
	    $this->db->use_db('write');
	    $this->db->db->autocommit(FALSE);
	    
	    //invalid 以前的access token
		$sql = 'UPDATE access_tokens SET access_status='.OAUTH2_INVALID_ACCESS_TOKEN_STATUS.' WHERE app_id='.$auth_code_row['app_id'].' AND uid='.$auth_code_row['uid'].' AND access_status='.OAUTH2_VALID_ACCESS_TOKEN_STATUS;
  		$invaid_result = $this->db->query($sql);

  		
  		//保存accessToken到数据表
	    
		$insert_data = array();		
		$time = time();
		$insert_data['auth_id'] = $auth_code_row['auth_id'];
		$insert_data['access_token'] = $access_token;
		$insert_data['access_gener_time'] = $time;
		$insert_data['access_expire_time'] = $time + $expires;
		$insert_data['access_refresh_token'] = $access_refresh_token;
		$insert_data['access_scope'] = $scope;
		$insert_data['access_status'] = OAUTH2_VALID_ACCESS_TOKEN_STATUS;
		$insert_data['access_refresh_time'] = 0;
		$insert_data['access_parent_id'] = 0;
		$insert_data['app_id']=$auth_code_row['app_id'];
		$insert_data['uid'] = $auth_code_row['uid'];
		
		$insert_result = $this->db->insert('access_tokens', $insert_data);
		
		if( ! $invaid_result || ! $insert_result || ! $this->db->db->commit() ){
                $this->db->db->rollback();
                $this->db->db->autocommit(TRUE);
                return false;
        }
        
        //正常返回token信息
        $this->db->db->autocommit(TRUE);
		return $token;	    
  }
  
  /**
   * 生成唯一accessToken
   */
	protected function generateAccessToken() {
	  	return md5(base64_encode(pack('N6', mt_rand(), mt_rand(), mt_rand(), mt_rand(), mt_rand(), uniqid())));  	
	}
	
	/**
	 * 保存accesToken
	 */
	protected function setAccessToken($auth_id, $access_token, $access_refresh_token, $expires, $scope = NULL, $access_status=1, $access_refresh_time=0, $access_parent_id=0) {
		
		$insert_data = array();
		
		$time = time();
		$insert_data['auth_id'] = $auth_id;
		$insert_data['access_token'] = $access_token;
		$insert_data['access_gener_time'] = $time;
		$insert_data['access_expire_time'] = $time + $expires;
		$insert_data['access_refresh_token'] = $access_refresh_token;
		$insert_data['access_scope'] = $scope;
		$insert_data['access_status'] = $access_status;
		$insert_data['access_refresh_time'] = $access_refresh_time;
		$insert_data['access_parent_id'] = $access_parent_id;
		
		$this->db->use_db('write');
		$result = $this->db->insert('access_tokens', $insert_data);
		
		if(!$result) {
			return false;
		} else {
			return true;
		}
  	}
  	
  	/**
  	 * 刷新accessToken
  	 * @param string $access_refresh_token
  	 */
  	public function refreshAccessToken($access_refresh_token, $scope) {
  		
  		//获取原来的accessToken  		
  		$sql = 'SELECT * FROM access_tokens WHERE access_refresh_token="'.$access_refresh_token.'" ORDER BY access_id DESC LIMIT 1';
  		
  		$old_access_token_rs = $this->db->query($sql);
  		if(count($old_access_token_rs)>0) {
  			$old_access_token = $old_access_token_rs[0];
  		} else {
  			//refresh code 不存在
  			$errorno = 10012;
			$this->errorJsonResponse($errorno);
  		}
  		
  		//验证refresh code 是否过期
  		if($old_access_token['access_status']==0 || time() > $old_access_token['access_expire_time']) {
  			$errorno = 10013;
			$this->errorJsonResponse($errorno);
  		}
  		
  		//事务处理
	    $this->db->use_db('write');
	    $this->db->db->autocommit(FALSE);
	    
	    //更新旧的tokens
		$update_data = array();
		$time = time();
		$update_data['access_status'] = OAUTH2_INVALID_ACCESS_TOKEN_STATUS;
		$update_data['access_refresh_time'] = $time;
		
		$where = 'access_id='.$old_access_token['access_id'];
		$update_result = $this->db->update('access_tokens', $update_data, $where);
		
		//生成新的tokens		
		$new_access_token = $this->generateAccessToken();
		$new_access_refresh_token = $this->generateAccessToken();		
		$scope = $scope ? $scope : OAUTH2_DEFAULT_SCOPE;
	    $expires = OAUTH2_DEFAULT_ACCESS_TOKEN_LIFETIME;
	    
		$token = array(
	      "access_token" => $new_access_token,
	      "expires_in" => $expires,
	      "scope" => $scope,
		  "refresh_token" => $access_refresh_token
	    );
	    
	    $auth_id = $old_access_token['auth_id']; 
	    $access_status = OAUTH2_VALID_ACCESS_TOKEN_STATUS;
	    $access_refresh_time = 0;
	    $access_parent_id = $old_access_token['access_id'];
		
	    //保存新的accessToken到数据表
		$insert_data = array();		
		$time = time();
		$insert_data['auth_id'] = $auth_id;
		$insert_data['access_token'] = $new_access_token;
		$insert_data['access_gener_time'] = $time;
		$insert_data['access_expire_time'] = $time + $expires;
		$insert_data['access_refresh_token'] = $new_access_refresh_token;
		$insert_data['access_scope'] = $scope;
		$insert_data['access_status'] = $access_status;
		$insert_data['access_refresh_time'] = $access_refresh_time;
		$insert_data['access_parent_id'] = $access_parent_id;
		$insert_data['app_id']=$old_access_token['app_id'];
		$insert_data['uid'] = $old_access_token['uid'];
		
		$insert_result = $this->db->insert('access_tokens', $insert_data);
		
		if( ! $update_result || ! $insert_result || ! $this->db->db->commit() ){
                $this->db->db->rollback();
                $this->db->db->autocommit(TRUE);
                $errorno = 10014;
				$this->errorJsonResponse($errorno);
        }
        
        //正常返回token信息
        $this->db->db->autocommit(TRUE);
		return $token;
  	}
  	
  	/**
  	 * 验证App账户
  	 * @param int $app_id
  	 * @param string $app_secret
  	 */
  	public function checkAppAccount($app_id, $app_secret) {
  		$sql = 'SELECT COUNT(*) num FROM app WHERE app_id="'.$app_id.'" AND app_secret="'.$app_secret.'"';
  		$this->db->use_db('read');
  		$checkRows = $this->db->query($sql);
  		if(is_array($checkRows) && $checkRows[0]['num']>0) {
			return true;  			
  		} else {
  			return false;
  		}
  	}
  	
	/**
  	 * 验证App是否存在
  	 * @param int $app_id
  	 * @param string $app_secret
  	 */
  	public function isExistAppAccount($app_id) {
  		$sql = 'SELECT COUNT(*) num FROM app WHERE app_id="'.$app_id.'"';
  		$this->db->use_db('read');
  		$checkRows = $this->db->query($sql);
  		if(is_array($checkRows) && $checkRows[0]['num']>0) {
			return true;  			
  		} else {
  			return false;
  		}
  	}
  	
  	
  	
  	/**
  	 * 出错返回
  	 * @param int $http_status_code
  	 * @param int $errorno
  	 * @param string $error_description
  	 * @param string $error_uri
  	 */
  	public function errorJsonResponse($errorno, $error_description = NULL, $error_uri = NULL) {
  		 $result['errno'] = $errorno;
	     if ($error_description)
	      $result["error_description"] = $error_description;
	
	    if ($error_uri)
	      $result["error_uri"] = $error_uri; 

	    header("Content-Type: application/json");
    	header("Cache-Control: no-store");
    	
    	echo json_encode($result);
    	exit;
  	}
  	
  	/**
  	 * 获取auth code记录
  	 * @param string $auth_code
  	 * @param int $app_id
  	 */
  	public function getAuthCode($auth_code,$app_id=0) {
  		$where='';
  		$where .= 'WHERE auth_code="'.$auth_code.'"';
  		if($app_id>0) {
  			$where .= ' AND app_id='.intval($app_id);
  		}
  		$this->db->use_db('read');
  		$sql = "SELECT auth_id,auth_expire_time,uid,app_id FROM auth_code ".$where.' LIMIT 1'; 
  		$results = $this->db->query($sql);
  		
  		if(count($results) > 0 ) {
  			return $results[0];
  		} else {
  			return false;
  		}
  	}
  	
  	
  	/**
  	 * 获取 access token 记录
  	 * @param string $access_token
  	 */
  	public function getAccessToken($access_token) {
  		
  		$sql = 'SELECT * FROM access_tokens WHERE access_token="'.$access_token.'" LIMIT 1';
  		$this->db->use_db('read');
  		$results = $this->db->query($sql);
  		
  		if(count($results) > 0) {
  			return $results[0];
  		} else {
  			return false;
  		}  		
  	}
  	
  	/**
  	 * 验证access token 是否合法 
  	 * @param string $access_token
  	 */
  	public function verifyAccessToken($access_token) { 
  		
	  	//参数验证
		if(!$access_token) {
			$errorno = 10001;
			$this->errorJsonResponse($errorno);
		}
		
		//加载 access Token 记录
		$access_token_row = $this->getAccessToken($access_token);
		
		//记录不存在
		if(!$access_token_row) {
			$errorno = 10010;
			$this->errorJsonResponse($errorno);
		}
		
		//access token  已过期
		if($access_token_row['access_status'] == 0 || time() > $access_token_row['access_expire_time']) {
			$errorno = 10011;
			$this->errorJsonResponse($errorno);
		}

		return TRUE;
  	}
  	
  	/**
  	 * 禁用用户的accessToken
  	 * @param int $app_id
  	 * @param int $user_id
  	 */
  	public function invalidAccessToken($app_id,$user_id) {
  		$sql = 'UPDATE access_tokens SET access_status='.OAUTH2_INVALID_ACCESS_TOKEN_STATUS.' WHERE app_id="'.$app_id.'" AND uid="'.$user_id.'" AND access_status='.OAUTH2_VALID_ACCESS_TOKEN_STATUS;
  		$this->db->use_db('write');  		
  		if($this->db->query($sql)) {
  			return true;
  		} else {
  			return false;
  		}
  	}
  	
  	/**
  	 * 获取token信息
  	 * @param int $app_id
  	 * @param int $uid
  	 */
  	public function getAccessTokenInfo($app_id,$uid) {
  		$this->db->use_db('read');
  		$where = 'app_id="'.$app_id.'" AND uid="'.$uid.'" AND access_status=1';
  		$results = $this->db->select('access_tokens','access_status,access_expire_time,uid,app_id',$where,' access_id DESC',1);
  		if(count($results)>0) {
  			return $results[0];
  		} else {
  			return false;
  		}
  	}

}