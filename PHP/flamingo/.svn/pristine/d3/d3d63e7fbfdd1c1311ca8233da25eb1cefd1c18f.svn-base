<?php
/*
 * 用户BBS类 增改查
 * author: huasong
 * 获取小组列表相关函数
 * TODO 各个缓存分开存储一下 1.小组 2.帖子 3.评论 4.用户是否点赞过某帖子(这个量级比较大)
 * */

//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/UserBbs.php";

class UserBbsList extends UserBbs
{
    /*
     * 小组信息分类排行
     *
     * */
    function getFSortList( $type='banner', $begin=0, $count=30, $platform='' ){
        $this->redis->use_redis( 'gpbbs' );
        $key = "FSL_{$type}_{$begin}_{$count}_{$platform}";//缓存
        if( $cached = $this->redis->redis->get($key) ){
            return json_decode( $cached, true );
        }

        $this->db->use_db( 'gpbbs' );
        if( $type=='banner' ){
            $tb = 'f_banner_list';
        }
        elseif( $type=='recommend' ){
            $tb = 'f_recommend_list';
        }
        elseif( $type=='game' ){
            $tb = 'f_game_list';
        }
        elseif( $type=='interest' ){
            $tb = 'f_interest_list';
        }
        else{
            //@file_put_contents( '/tmp/abcd.log', $type." e \n", FILE_APPEND );
            return false;
        }
        if( $platform ){
            $where = "platform='{$platform}'";
        }
        else{
            $where = "";
        }

        $count = $count + $begin;
        //此处排序起始值为 -1时，有些问题
        $fid_list = $this->db->select( $tb, '*', $where, 'sort DESC', "{$begin}, {$count}" );

        if( $fid_list ){
            $finfo_list = array();
            foreach( $fid_list as $k => $v ){
                $finfo[0] = $this->getFOneinfo( $v['fid'] );
                //banner大图
                if( isset($v['img_url']) && $v['img_url'] ){
                    $finfo[0]['img_url'] = $v['img_url'];
                }
                $finfo_list[] = $finfo[0];
            }
        }

        if( ! $finfo_list ) $finfo_list = array();
        $this->redis->redis->set( $key, json_encode($finfo_list), 600 );

        return $finfo_list;
    }

    /*
     * 获取单个小组的信息
     *
     * 内里的两个函数都有cached这里不做缓存
     * */
    function getFOneinfo($fid){
        $finfo = $this->getFinfoList( "id='{$fid}' AND f_status=1", 'id DESC', 1 );
        if( empty($finfo) ) return false;
        $finfo[0]['has_others'] = 0;
        //是否有新闻攻略视频的入口
        //$has_news = $this->checkHasNews( $finfo[0]['f_name'] );
        if( ! empty($has_news) ){
            $finfo[0]['has_others'] = 1;
        }
        return $finfo[0];

    }

    /*
     * 检测是否有新闻攻略视频
     * */
    function checkHasNews($game_name){
        $this->redis->use_redis( 'gpbbs' );
        $key = "GN_HAS_NEWS_{$game_name}";//缓存
        if( $cached = $this->redis->redis->get($key) ){
            return json_decode( $cached, true );
        }

        $this->db->use_db( 'guopan' );
        $data = $this->db->select( 'guopan_fid_game_map', 'ID', "Name LIKE '{$game_name}'", '', 1 );

        if( ! $data ) $data = array();
        if($data) $this->redis->redis->set( $key, json_encode($data), 3600 );//一小时

        return $data;
    }

    /*
     * 获取用户已加入小组的帖子信息流
     * $direction 方向 0是取新的 1是取旧的
     * //这个经常变化得从底层直接获取数据
     * */
    function getStreamPostsList( $fid_arr=array(), $begin_timestamp=0, $count=30, $direction=0 ){
        if( ! is_array($fid_arr) || empty($fid_arr) ) return false;
        if( $direction==0 ){
            $and_where = "t_ding_lasttime>'{$begin_timestamp}'";
        }
        else{
            $and_where = "t_ding_lasttime<'{$begin_timestamp}'";
        }
        $t_arr = $t_addtime_arr = array();

        //先从缓冲区提取数据
        $t_arr[] = $this->getStreamListFromRedis($fid_arr, $begin_timestamp, $count, $direction);
        if( count($t_arr) == $count ){
           return $t_arr;
        }
        $t_arr = array();//清空数组
		$this->redis->use_redis('gpbbs');
		foreach( $fid_arr as $k => $fid ){
            $fid_tinfo_list = $this->getTinfoList( $fid, $and_where, 't_ding_lasttime DESC', $count );
            if( ! $fid_tinfo_list ) continue;
            foreach( $fid_tinfo_list as $kt => $tinfo ){
                $t_arr[] = $tinfo;
                $t_addtime_arr[] = $tinfo['t_ding_lasttime'];
            }
        }
        if( $t_arr && $t_addtime_arr ){
            $a = array_multisort( $t_addtime_arr, SORT_DESC, $t_arr );
            if( count($t_arr) > $count ){
                $t_arr = array_slice( $t_arr, 0, $count );
            }
        }

        return $t_arr;
    }

    /* 获取小组信息流
     *
     *
     * */
    function getFinfoStreamPostsList( $fid_arr=array(), $begin_timestamp=0, $count=30, $direction=0 ){
        if( ! is_array($fid_arr) || empty($fid_arr) ) return false;
        if( $direction==0 ){
            $and_where = "t_ding_lasttime>'{$begin_timestamp}'";
        }
        else{
            $and_where = "t_ding_lasttime<'{$begin_timestamp}'";
        }
        $and_where .= " AND t_top=0"; //小组信息获取非置顶的帖子
        $t_arr = $t_addtime_arr = array();

        //小组信息流获取置顶帖
        $top_t_list = array();
        if($begin_timestamp == 0 && $direction == 0){
            $top_t_list = $this->getFinfoTopTinfoList( $fid_arr[0], '', 'addtime DESC', '' );
        }

		foreach( $fid_arr as $k => $fid ){
            $fid_tinfo_list = $this->getTinfoList( $fid, $and_where, 't_ding_lasttime DESC', $count );
            if( ! $fid_tinfo_list ) continue;
            foreach( $fid_tinfo_list as $kt => $tinfo ){
                $t_arr[] = $tinfo;
                $t_addtime_arr[] = $tinfo['t_ding_lasttime'];
            }
        }
        if( $t_arr && $t_addtime_arr ){
            $a = array_multisort( $t_addtime_arr, SORT_DESC, $t_arr );
            if( count($t_arr) > $count ){
                $t_arr = array_slice( $t_arr, 0, $count );
            }
        }
        
        return array_merge($top_t_list, $t_arr);
    }
	
    /*
     * 获取推荐内容信息流
     * $direction 方向 0是取新的 1是取旧的
     * */
    function getRecomendPostsList( $count=30 ){
        $this->redis->use_redis( 'gpbbs' );
        $key = "TRL_{$count}";//缓存
        if( $cached = $this->redis->redis->get($key) ){
            return unserialize( $cached );
        }

        $this->db->use_db('gpbbs');
        $t_arr = array();
        $begin_limit = 0;
        $end_limit = $count;
        do{
            $tid_list = $this->db->select( 't_recomend_list', '*', '', 'sort DESC', "{$begin_limit}, {$end_limit}" );
            if( $tid_list ){
                foreach( $tid_list as $k => $v ){
                    $tinfo = $this->getTinfo( $v['fid'], $v['tid'], 'id DESC', 1 );
                    if(!empty($tinfo)){
                        $t_arr[] = $tinfo;
                    }
                    if(count($t_arr) == $count){
                        break;
                    }
                }
            }          
            $begin_limit = $end_limit;
            $end_limit = $end_limit + 10;//补足
        }while($tid_list && count($t_arr) < $count);
        $this->redis->redis->set( $key, serialize($t_arr), 600 );

        return $t_arr;
    }

    /*
     * 获取用户发的帖子列表
     * $direction 方向 0是取新的 1是取旧的
     * //较少用到且重复性不强所以不加缓存 
     * */
    function getMyPostsList( $uex='aa', $uin, $begin_timestamp=0, $count=30, $direction=0, $fid=0 , $and_where=' AND t_status=1'){
        if( empty($uin) ) return false;
        if( $direction==0 ){
            $and_where .= " AND addtime>'{$begin_timestamp}'";
        }
        else{
            $and_where .= " AND addtime<'{$begin_timestamp}'";
        }
        if( $fid ){//指定单个fid
            $and_where .= " AND fid='{$fid}'";
        }
        $this->db->use_db('gpbbs');

        $tid_arr = $this->db->select( "u_t_{$uex}", '*', "uin='{$uin}' {$and_where}", 'addtime DESC',$count);
        if( empty($tid_arr) ) return false;
        $t_arr = array();


        foreach( $tid_arr as $k => $v ){
            $_t = $this->getTinfo( $v['fid'], $v['tid'], 'id DESC', 1 , ' AND t_status=1');
            if( empty($_t) ) continue;
            $t_arr[] = $_t;
            if(count($t_arr) == $count){
                break;
            }
        }

        return $t_arr;
    }

    /*
     * 获取用户评论过的 帖子列表
     * $direction 方向 0是取新的 1是取旧的
     * //较少用到且重复性不强所以不加缓存 
     *  按帖子添加时间返回，  获取更多的时候，客户端会传 帖子的创建时间
     *
     *  已弃用
     *
     *
     * */
    function getMyCommentsList( $ex='aa', $uin, $begin_timestamp=0, $count=30, $direction=0, $fid=0, $and_where=' AND c_status=1' ){
        if( empty($uin) ) return false;
        if( $direction==0 ){
            $and_where .= " AND t_addtime>'{$begin_timestamp}'";
        }
        else{
            $and_where .= " AND t_addtime<'{$begin_timestamp}'";
        }
        if( $fid ){//指定单个fid
            $and_where .= " AND fid='{$fid}'";
        }
        $this->db->use_db('gpbbs');

       // $tid_arr = $this->db->select( "u_c_{$ex}", '*', "uin='{$uin}' {$and_where}", 't_addtime DESC', $count );
        $sql = "select * from u_c_{$ex} where uin='{$uin}' {$and_where} group by tid order by t_addtime DESC limit {$count}";
        $tid_arr = $this->db->query($sql);


        if( empty($tid_arr) ) return false;
        $t_arr = array();
        foreach( $tid_arr as $k => $v ){
            $_t = $this->getTinfo( $v['fid'], $v['tid'], 'id DESC', 1 , 'AND t_status=1');
            $t_arr[] = $_t;
            
        //    $t_addtime_arr[] = $_t['t_addtime'];
        }
        //sql语句中已排序
       // array_multisort( $t_addtime_arr, SORT_DESC, $t_arr );

        return $t_arr;
    }


    /*
     * 我回复的帖子
     * 返回我评论/回复过的帖子列表(删除的帖子也能返回)
     *
     * */

    function getMyCommentsTinfoList( $uex='aa', $uin, $begin_timestamp=0, $count=30, $direction=0, $fid=0, $where=' AND c_t_status=1' ){
        if( empty($uin) ) return false;
        if( $direction==0 ){
            $and_where = $where . " AND t_addtime>'{$begin_timestamp}'";
        }
        else{
            $and_where = $where . " AND t_addtime<'{$begin_timestamp}'";
        }
        if( $fid ){//指定单个fid
            $and_where .= " AND fid='{$fid}'";
        }
        $this->db->use_db('gpbbs');

        $counts = $count;
        $t_arr = array();
        //自评后删帖会导致返回数量不足
        $a = 0;
        do{
            $a++;
            $tid_arr = array();
            $sql = "select * from u_c_t_{$uex} where uid='{$uin}' {$and_where} order by t_addtime DESC limit {$counts}";
            $tid_arr = $this->db->query($sql);

            if( !empty($tid_arr) ){
                foreach( $tid_arr as $k => $v ){
                    $_t = $this->getTinfo( $v['fid'], $v['tid'], 'id DESC', 1, '');//删除的帖也返回
                    if( $uin == $_t['t_create_uin'] && $_t['t_status'] == 0 ){//自己评论自己的帖，帖删除后，不返回(此处会导致数量不足)

                    }else{
                        $t_arr[] = $_t;
                    }
                    if($count == count($t_arr)) break;
                }
            
                $num = count($t_arr) - 1;
                $and_where = $where . " AND t_addtime<'{$t_arr[$num]['t_addtime']}'";
                if( $fid ){//指定单个fid
                    $and_where .= " AND fid='{$fid}'";
                }
                $counts = $count;
            }
            if($a == 2){//防止自评后删帖，导致u_c_t_xx中有数据而不符合返回条件，导致死循环获取
                break;
            }
        }while( ($tid_arr && (count($t_arr) < $count)) );

        return $t_arr;
    }


    /*
     * 检查一个用户是否已对某帖子点赞
     * 点赞/取消点赞 都要更新缓存
     * */
    function checkUserTDianzan( $uin=33, $fid=1, $tid=3, $t_dianzan_uin_ex='aa' ){
        if( empty($uin) || empty($fid) || empty($tid) || empty($t_dianzan_uin_ex) ) return false;

        $this->redis->use_redis( 'gpbbs' );
        $key = "UTDZ_{$uin}_{$fid}_{$tid}";//缓存
        if( $cached = $this->redis->redis->get($key) ){
            return json_decode( $cached, true );
        }

        $this->db->use_db('gpbbs');
        $data = $this->db->select( "t_dianzan_uin_{$t_dianzan_uin_ex}", '*', "fid='{$fid}' AND tid='{$tid}' AND uin='{$uin}' AND status='1'", '', 1 );

        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 84600*7 );
        
        return $data;
    }

    /*
     * 检查一个用户是否已加入某个小组
     * 退出 要更新缓存
     * */
    function checkUserFIn( $uin=33, $fid=1, $f_ex='aa' ){
        if( empty($uin) || empty($fid) || empty($f_ex) ) return false;

        $this->redis->use_redis( 'gpbbs' );
        $key = "UFIN_{$uin}_{$fid}";//缓存
        if( $cached = $this->redis->redis->get($key) ){
            return json_decode( $cached, true );
        }

        $this->db->use_db('gpbbs');
        $data = $this->db->select( "f_uin_{$f_ex}", '*', "fid='{$fid}' AND uin='{$uin}' AND status='1'", '', 1 );

        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 84600*7 );
        
        return $data;
    }

    /*
     * 我加入的小组
     * 内里的函数有cached这里不做缓存
     * */
    function getMyFList( $fid_list , $begin=0 , $count=30){
        if( !is_array($fid_list) || empty($fid_list) ) return false;
        $finfo_list = array();
        $fid_list = array_reverse($fid_list);//需求倒序返回
        $fid_list = array_slice($fid_list, $begin, $count, true);
        foreach( $fid_list as $k => $v ){
            $finfo[0] = $this->getFOneinfo( $v );
            $finfo_list[] = $finfo[0];
        }

        return $finfo_list;
    }

    /*
     * 获取明细信息
     * */
    function getUserReplyInfo( $fid, $tid, $cid ){
        if( empty($fid) || empty($tid) ) return false;
        $res_info = array();
        $tinfo = $this->getTinfo( $fid, $tid );
        if( $tinfo ){
            $res_info['tinfo'] = $tinfo;
        }
        if( $cid ){
            $cinfo = $this->getCommentList( $fid, $tid, 1, 0, "AND c_status=1 AND id='{$cid}'" );
            if( $cinfo ){
                $res_info['cinfo'] = $cinfo[0];
            }
        }

        return $res_info;
    }

	/*
	 * 在redis中获取信息流
	 * */	
	function getStreamListFromRedis($fid_arr, $begin_time=0,$count=20,$direction=0){
        //清楚旧数据
        $nowTime = time();
        $t_arr = $t_ding_lasttime_arr = array();
		$this->redis->use_redis('gpbbs');
        foreach( $fid_arr as $k => $fid ){
            if($direction == 0)//获取新的数据 高->低
            {
                $tinfos =  $this->redis->redis->zrevrangebyscore("TS_{$fid}", $nowTime, $begin_time, array('limit'=>array(0,$count)));
               //  print_r($tinfos);
            }else{//获取旧的数据高->低
                $tinfos =  $this->redis->redis->zrevrangebyscore("TS_{$fid}", "'('.{$begin_time}", 0, array('limit'=>array(0,$count)));
            }
            if( !$tinfos ) continue;
            foreach( $tinfos as $kt => $tinfo ){
                $tie = unserialize($tinfo);
                $t_arr[] = $tie;
                $t_ding_lasttime_arr[] = $tie['t_ding_lasttime'];
            }
        }
        if( $t_arr && $t_ding_lasttime_arr ){
            array_multisort( $t_ding_lasttime_arr, SORT_DESC, $t_arr );
            if(count($t_arr) < $count) return $t_arr;//数据不够
            if( count($t_arr) > $count ){
                $t_arr = array_slice( $t_arr, 0, $count );
            }   
        }
        return $t_arr;
	}

	/*
	 *获取参与活动的帖子(跟帖)
	 *
	 * */
	function getPersonActivityPost($uin,$count=256){
		if(empty($uin)) return false;
		require_once SYSDIR_UTILS. "/ActivityBbsList.php";
		$activitydb = new ActivityBbsList();
		$activitydb->db->use_db('gpbbs');
      
/*
		$ainfoList = $activitydb->getAinfoList(0, '', '', '256', 0, 0);
		$atinfos_arr = $atinfos_addtime = array();
		foreach($ainfoList as $afid){
			$result = $activitydb->getATinfoList($afid['id'], "AND at_create_uin={$uin}", 'at_addtime DESC', $count, 0);

            if(!$result) continue;
            foreach($result as $v){
				$atinfos_arr[] = $v;
				$atinfos_addtime[] = $v['at_addtime'];
			}
		}
		array_multisort($atinfos_addtime, SORT_DESC, $atinfos_arr);

        if(count($atinfos_arr > $count)){
			$at_arr = array_slice($atinfos_arr, 0, 5);
		}
 */
        //获取最新的5个活动跟帖 
		$result = $activitydb->getATinfoList( 0, " AND at_create_uin={$uin}", 'at_addtime DESC', $count, 0);
		return $result;
	}



	/*
	 * 获取个人页面的数据
	 * 用户数据变化时,需要清缓存 UC_{$sb_uin}
	 * */
	function getPersonPageData($sb_uin, $uex, $uin=0 ,$arr_fid=array()){
		if(empty($sb_uin) || empty($uex)) return false;
        $keys = "UC_{$sb_uin}";
        $this->redis->use_redis('gpbbs');

        if($this->redis->redis->keys($keys)){
            return unserialize($this->redis->redis->get($keys)); 
        }
        $statistic_uex = "uex_bbs_statistic_{$uex}";
		$statinfo = array( 0=>'' );
        
		if($arr_fid){
			$statinfo[0] = $this->getMyFList($arr_fid);
		}
		$this->db->use_db('gpbbs');
		$statinfo[1] = $this->db->select($statistic_uex, '*', "uid={$sb_uin}", '', 1);
        $statinfo[2] = $this->getPersonActivityPost($sb_uin, 5);
        $this->redis->redis->set($keys, serialize($statinfo), 600);


        return $statinfo;
	}
    
    /* 获取回收站中的帖子
     * 内层已加缓存
     * 
     * */
    function getTrashTinfoList($Trash){
        if( empty($Trash['fid']) || empty($Trash['sb_uin']) ) return false;
        if($Trash['direction'] == 0){//新
            $and_where = "addtime > 0 ";
        }else{
            $and_where = "addtime < {$Trash['begin_timestamp']} ";
        }
        $and_where .= ' AND type=0 ';

        $tinfo_arr = array();
        //a.查t_manager_del_log表
        $t_maninfos = $this->getManagerDelTinfoList($Trash['fid'], $and_where, 'addtime DESC', $Trash['count']);
        if($t_maninfos){
            array_reverse($t_maninfos);
            foreach($t_maninfos as $v){
                $tinfo = $this->getTinfo($v['fid'], $v['tid'], 'id DESC', 1, '');//删除的帖也查找
                if($tinfo){
                    $tinfo_arr[] = $tinfo; 
                    $num = count($tinfo_arr) - 1;
                    $tinfo_arr[$num]['reason'] = $t_maninfos[$num]['reason'];//管理员删帖原因 
                    $tinfo_arr[$num]['man_uin'] = $t_maninfos[$num]['uid'];//删帖管理员
                }
            }
        }else{
            return true;
        }

        return $tinfo_arr;
    }
    


}

?>
