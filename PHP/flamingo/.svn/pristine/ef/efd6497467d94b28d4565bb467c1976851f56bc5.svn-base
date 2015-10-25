<?php
/*
 * 果盘与游戏关系处理
 * author: huasong
 * XXBBSGameCenter.proto
 *
 * */

//配置文件
require_once dirname(dirname(__FILE__)) . "/include/config.php";
require_once SYSDIR_UTILS. "/DB.php";
require_once SYSDIR_UTILS. "/REDIS.php";

class UserBbs2Game
{
    /* */
    public $db;
    public $redis;

    function __construct(){
        $this->redis = new myRedis();
        $this->redis->use_redis( 'gpbbs' );
        $this->db = new DB();

    }
    function __destruct(){
    }

    /*
     * 获取一个小组对应的游戏信息
     *
     * */
    function getF2Game( $fid=1, $platform='android' ){
        if( empty($fid) || empty($platform) ) return false;
        $this->db->use_db( 'gpbbs' );
        $f_app = $this->db->select( 'f_gpapp', '*', "fid='{$fid}'", '', 1 );
        if( empty($f_app) ) return false;
        $id = $platform=='android' ? $f_app[0]['android_app_id'] : $f_app[0]['ios_app_id'];
        return $this->getAppInfo( $platform, $id );
    }

    /*
     * 获取Guopan的app信息
     * */
    function getAppInfo( $platform='android', $app_id=1 ){
        if( empty($app_id) || empty($platform) ) return false;
        $this->db->use_db( 'guopan' );
        $app_info = $this->db->select( "{$platform}_gp_game_list", '*', "id='{$app_id}'", '', 1 );
        if( empty($app_info) ) return false;
        if( $app_info[0]['FileID'] ){
            $app_info[0]['app_file'] = $this->getAppFileInfo( $platform, $app_info[0]['FileID'] );
        }
        if( $app_info[0]['Thumbnail'] ){
            $app_info[0]['thumb_file'] = $this->getAppImgInfo( $platform, $app_info[0]['Thumbnail'] );
        }
        if( $app_info[0]['Images'] ){
            $img_arr = explode( ',', $app_info[0]['Images'] );
            foreach( $img_arr as $file_id ){
                $file_info = $this->getAppImgInfo( $platform, $file_id );
                if( $file_info ){
                    $app_info[0]['pic_file'][] = $file_info;
                }
            }
        }
        return $app_info[0];
    }

    /*
     * 获取Guopan的app FILE信息
     * */
    function getAppFileInfo( $platform='android', $file_id=1 ){
        if( empty($file_id) || empty($platform) ) return false;
        $this->db->use_db( 'guopan' );
        return $this->db->select( "{$platform}_gp_app_file_list", '*', "id='{$file_id}'", '', 1 );
    }

    /*
     * 获取Guopan的app IMG 信息
     * */
    function getAppImgInfo( $platform='android', $file_id=1 ){
        if( empty($file_id) || empty($platform) ) return false;
        $this->db->use_db( 'guopan' );
        return $this->db->select( "{$platform}_gp_picture_file_list", '*', "id='{$file_id}'", '', 1 );
    }

    /*
     * 获取一个包名对应的一个小组ID
     *
     * */
    function getPkg2F( $pkg='com.locojoy.immt_a_chs', $platform='android', $name='刀塔传奇' ){
        if( empty($pkg) || empty($platform) ) return false;
        $this->db->use_db( 'guopan' );
        $app_info = $this->db->select( "{$platform}_gp_game_list", '*', "Package='{$pkg}' OR Name LIKE '{$name}'", '', 1 );
        if( empty($app_info) ) return false;
        $info = array();
        $info['app_name'] = $app_info[0]['Name'];
        $info['pkg_name'] = $app_info[0]['Package'];
        $this->db->use_db( 'gpbbs' );
        $fid = $this->db->select( 'f_gpapp', '*', "{$platform}_app_id='{$app_info[0]['ID']}'", '', 1 );
        if( $fid ){
            $info['fid'] = $fid[0]['fid'];
        }
        return $info;
    }

}
