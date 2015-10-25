<?php
$master_ip_arr = array( '23.239.30.135', '128.199.111.50' );//达拉斯 新加坡
exec( "mysql -uroot -p`cat /data/save/mysql_root` -e'slave stop;'", $out0 );
exec( "mysql -uroot -p`cat /data/save/mysql_root` -e'show slave status\G;'", $out1 );
//var_dump( $out1 );
//Master_Host: 23.239.30.135
//Master_Log_File: mysql-bin.001533
//Read_Master_Log_Pos: 544330
if( is_array($out1) && count($out1)==41 ){
    $Master_Host_str = $out1[2];
    //$Master_Log_File_str = $out1[6];
    //$Read_Master_Log_Pos_str = $out1[7];
    $ip = trim( str_replace( 'Master_Host:', '', $Master_Host_str ) );
    $store_file = "./{$ip}.status";
    if( file_exists( $store_file ) ){
        $status_arr = unserialize( file_get_contents( $store_file ) );
        $status_arr[] = $out1;
        if( count($status_arr)==300 ){//保存300个
            $status_arr = array_shift( $status_arr );
        }
    }
    else{
        $status_arr[] = $out1;
    }
    @file_put_contents( $store_file, serialize( $status_arr) );
    //another one 
    $change2ip = $ip == $master_ip_arr[0] ? $master_ip_arr[1] : $master_ip_arr[0];
    $change2ip_last_status_file = "./{$change2ip}.status";
    if( file_exists( $change2ip_last_status_file ) ){
        $status_arr = unserialize( file_get_contents( $change2ip_last_status_file ) );
        $last_status = $status_arr[(count($status_arr)-1)];
        $Master_Log_File = trim( str_replace( 'Master_Log_File:', '', $last_status[6] ) );
        $Read_Master_Log_Pos = trim( str_replace( 'Read_Master_Log_Pos:', '', $last_status[7] ) );
        $sql = "CHANGE MASTER TO MASTER_HOST='{$change2ip}', MASTER_USER='hwslave', MASTER_PASSWORD='hwslave123@', MASTER_LOG_FILE='{$Master_Log_File}', MASTER_LOG_POS={$Read_Master_Log_Pos};";
        echo $sql,"\n";
        exec( "mysql -uroot -p`cat /data/save/mysql_root` -e\"{$sql}\"", $out2 );
        print_r( $out2 );
        exec( "mysql -uroot -p`cat /data/save/mysql_root` -e'slave start;'", $out3 );
        print_r( $out3 );
    }
    else{
        echo $change2ip," status log file not exists.\n";
    }
}
