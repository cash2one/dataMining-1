<?php
/*
 * 用户BBS类 增改查
 * author: huasong
 * 获取活动列表相关函数
 * */

//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/ActivityBbs.php";

class ActivityBbsList extends ActivityBbs
{
	
    /*
     * 最新活动列表
     * */
    function getNewActivityList( $fid=0, $count=30, $begin_timestamp=0, $direction=0 ){
		$this->db->use_db( 'gpbbs' );
	    return $this->getAinfoList( $fid, '', 'a_addtime DESC', $count, $begin_timestamp, $direction );
    }
	
	/*
     * 最热活动列表
     * */
    function getHotestActivityList( $fid=0, $count=30, $begin_timestamp=0, $direction=0 ){
		$this->db->use_db( 'gpbbs' );
		return $this->getAinfoList( $fid, '', 'a_t_count DESC', $count, $begin_timestamp, $direction );
    }
	
	/*
     * 推荐活动列表
     * */
    function getRecommendActivityList( $fid=0, $count=30, $begin_timestamp=0, $direction=0 ){
        //a:recommend表 b:ainfo表
		if($direction == 0){
            $where = "b.a_addtime>'{$begin_timestamp}'";
        }else{
            $where = "b.a_addtime<'{$begin_timestamp}'";
        }
		if($fid) $where .= " AND b.fid={$fid}";
        $orderby = 'a.sort DESC';
        
        $this->redis->use_redis( 'gpbbs' );
        $key = "AL_".str_replace( array("'", '"', '=', ' ', '.'), array('', '', '', '', ''), "{$fid}_{$where}_{$orderby}{$count}" );
        if( $cached = json_decode($this->redis->redis->get($key), true) ){
            return $cached;
        }

		$sql = "select b.*,a.sort from a_recommend_list as a left join ainfo as b on a.afid=b.id where b.a_status=1 AND {$where} order by {$orderby} limit 0,{$count}";
		$this->db->use_db( 'gpbbs' );
		$data = $this->db->query( $sql );
        
        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 84600*7 );

        return $data;
    }
	
	/*
     * 小组正在进行的活动
     * */
    function getGroupIngActivityList( $fid=0, $count=30, $begin_timestamp=0, $direction=0 ){
		$time = time();
		$where = " AND a_starttime<={$time} AND a_endtime>={$time}";
        if($fid) $where .= " AND fid={$fid}";
		$this->db->use_db( 'gpbbs' );
		return $this->getAinfoList( $fid, $where, 'a_addtime DESC', $count, $begin_timestamp, $direction );
    }
	
	/*
     * 小组历史活动
     * */
    function getGroupHistoryActivityList( $fid=0, $count=30, $begin_timestamp=0, $direction=0 ){
		$time = time();
		$where = " AND a_endtime<={$time}";
        if($fid) $where .= " AND fid={$fid}";
		$this->db->use_db( 'gpbbs' );
		return $this->getAinfoList( $fid, $where, 'a_addtime DESC', $count, $begin_timestamp, $direction );
    }
	
	/*
     * 我的活动 关注的
     * */
    function getMyActivityList( $fid=0, $uin="", $count=30, $begin_timestamp=0, $direction=0 , $and_where=' AND status=1'){
		if( empty($uin) ) return false;
        $this->db->use_db( 'gpbbs' );
    /*连表比较伤性能，故改之
        //a:ainfo表 b:a_uin表
        $where = "b.uin={$uin}";
        if($direction == 0){
            $where .= " AND a.a_addtime>'{$begin_timestamp}'";
        }else{
            $where .= " AND a.a_addtime<'{$begin_timestamp}'";
        }
		if($fid) $where .= " AND a.fid={$fid}";
        $orderby = 'a.id DESC';

        $this->redis->use_redis( 'gpbbs' );
        $key = "AUL_".str_replace( array("'", '"', '=', ' ', '.'), array('', '', '', '', ''), "{$uin}_{$fid}_{$where}_{$orderby}{$count}" );
        if( $cached = json_decode($this->redis->redis->get($key), true) ){
            return $cached;
        }

        $sql = "select a.* from ainfo as a right join a_uin as b on a.id=b.afid where a.a_status=1 AND b.status=1 AND {$where} order by {$orderby} limit 0,{$count}";
		$data = $this->db->query( $sql );
        if( ! $data ) $data = array();
     */
        if($direction == 0){
            $and_where .= " AND a_addtime>'{$begin_timestamp}'";
        }else{
            $and_where .= " AND a_addtime<'{$begin_timestamp}'";
        }
        if($fid){

        }
        $orderby = 'a_addtime DESC';
        $this->redis->use_redis('gpbbs');
        $key = "AUL_".str_replace( array("'", '"', '=', ' ', '.'), array('', '', '', '', ''), "{$uin}_{$fid}_{$and_where}_{$orderby}{$count}" );
        if( $cached = json_decode($this->redis->redis->get($key), true) ){
            return $cached;
        }

        $ainfos = array();
        $a_u_infos = $this->db->select('a_uin', '*', " uin='{$uin}'  AND status=1", "updatetime DESC", $count);

        if($a_u_infos){
            foreach($a_u_infos as $a_u_info){
                $ainfo = $this->getAinfo($a_u_info['afid'], " AND a_status=1 ");
                if($ainfo){
                    $ainfos[] = $ainfo[0];
                }
            }
        }

        $this->redis->redis->set( $key, json_encode($data), 84600*7 );

        return $ainfos;
    }

	/*
	 * 获取我的参与的活动照片
	 * */
     function getMyATPhoto($uin, $begin_time=0, $direction=0, $count=30){
		if(empty($uin)) return false;
        if($direction == 0){          
            $where = "at_addtime>{$begin_time}";
        }else{
            $where = "at_addtime<={$begin_time}";                                                                                            
        }
        $where = $where." AND at_create_uin={$uin} AND at_status=1";
		return $this->getATPhoto($where, 'at_addtime DESC', $count);  
	 }	

    /*
     * 获取明细信息
     * */
    function getAUserReplyInfo( $atid, $acid ){
        if( empty($atid) ) return false;
        $res_info = array();
        $tinfo = $this->getATinfo( $atid );
        if( $tinfo ){
            $res_info['tinfo'] = $tinfo[0];
        }
        if( $acid ){
            $cinfo = $this->getATCommentList( $atid, "AND id='{$acid}'", '', 1 );
            if( $cinfo ){
                $res_info['cinfo'] = $cinfo[0];
            }
        }

        return $res_info;
    }

    /*
     * 检查一个用户是否已对某帖子点赞
     * 点赞/取消点赞 都要更新缓存
     * */
    function checkUserATDianzan( $uin, $atid, $at_dianzan_uin_ex='aa' ){
        if( empty($uin) || empty($atid) || empty($at_dianzan_uin_ex) ) return false;

        $this->redis->use_redis( 'gpbbs' );
        $key = "UATDZ_{$uin}_{$atid}";//缓存
        if( $cached = json_decode($this->redis->redis->get($key), true) ){
            return $cached;
        }

        $this->db->use_db('gpbbs');
        $data = $this->db->select( "at_dianzan_uin_{$at_dianzan_uin_ex}", '*', "atid='{$atid}' AND uin='{$uin}' AND status='1'", '', 1 );

        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 84600*7 );
        return $data;
    }

    /*
     * 检查一个用户是否已关注某个活动
     * 退出 要更新缓存
     * */
    function checkUserAIn( $uin=33, $afid=1 ){
        if( empty($uin) || empty($afid) ) return false;
        $this->redis->use_redis( 'gpbbs' );
        $key = "UAIN_{$uin}_{$afid}";//缓存
        if( $cached = json_decode($this->redis->redis->get($key), true ) ){
            return $cached;
        }

        $this->db->use_db('gpbbs');
        $data = $this->db->select( "a_uin", '*', "afid='{$afid}' AND uin='{$uin}' AND status=1", '', 1 );

        if( ! $data ) $data = array();
        $this->redis->redis->set( $key, json_encode($data), 84600*7 );
        
        return $data;
    }

    /*
     * 更新用户关注的活动数量记录
     * 1.在a_uin表中活动用户关注活动的数量，存到ues_bbs_statistic_xx表中
     *
     */
    function updateUserATCount($uin, $uex, $afid, $action=0){
        if(empty($uin) || empty($uex) || empty($afid)) return false;
        $this->db->use_db( 'gpbbs' );
 
        $sql = "select uin , count(uin) from a_uin where uin={$uin} AND status=1";
        $a_uinfo = $this->db->query($sql);
        $statistic_uex = "uex_bbs_statistic_{$uex}";
        if($a_uinfo){
            $sql = "insert into {$statistic_uex}(uid, activity_count) values({$uin}, {$a_uinfo[0]['count(uin)']}) on duplicate key update activity_count={$a_uinfo[0]['count(uin)']}";
            $result = $this->db->query($sql);
        }
        //清除用户个人数据缓存
        $keys = "UC_{$uin}";
        $this->redis->use_redis('gpbbs');
        $key = $this->redis->redis->keys($keys);
        if($result && $key){
            $this->redis->redis->delete($keys);
        }
        return $result;
    }
	
	/*
	 * 更新用户活动照片数量
	 * */
	function updateUserATPicCount($uin, $uex, $counts=1, $action=0){
        if(empty($uin) || empty($uex)) return false;
        $statistic_uex = "uex_bbs_statistic_{$uex}";
		if($action == 0){//增加
			$set = "picture_count=picture_count+{$counts}";
		}else{
			$set = "picture_count=picture_count-{$counts}";
		}
		$this->db->use_db('gpbbs');
		$sql = "insert into {$statistic_uex}(uid, picture_count) values({$uin}, {$counts}) on duplicate key update {$set}";
		$result = $this->db->query($sql);
        //清除用户个人数据缓存
        $keys = "UC_{$uin}";
        $this->redis->use_redis('gpbbs');
        $key = $this->redis->redis->keys($keys);
        if($result && $key){
            $this->redis->redis->delete($keys);
        }
        return $result;
	}

}
?>
