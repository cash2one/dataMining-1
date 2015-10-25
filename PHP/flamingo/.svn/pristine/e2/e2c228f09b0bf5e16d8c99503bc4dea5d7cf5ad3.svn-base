<?php

if(!defined("SYSDIR_ROOT"))
    define("SYSDIR_ROOT", dirname(dirname(__FILE__)) );
if(!defined("SYSDIR_INCLUDE"))
    define("SYSDIR_INCLUDE", SYSDIR_ROOT . "/include" );
if(!defined("SYSDIR_UTILS"))
    define("SYSDIR_UTILS", SYSDIR_ROOT . "/utils" );
if(!defined("SYSDIR_API"))
    define("SYSDIR_API",   SYSDIR_ROOT . "/api" );
if(!defined("SYSDIR_CACHE"))
    define("SYSDIR_CACHE",   SYSDIR_ROOT . "/cache" );

if(!defined("INCLUDE_SMARTY_INIT_PHP_FILE"))
{
    define("INCLUDE_SMARTY_INIT_PHP_FILE", TRUE );

    if(!defined("INCLUDE_CONFIG_PHP_FILE"))
    {
        define("INCLUDE_CONFIG_PHP_FILE", TRUE );
        include SYSDIR_INCLUDE . '/config.php';
    }

    include SYSDIR_INCLUDE . '/smarty/Smarty.class.php';
    $smarty = new Smarty;
    $smarty->template_dir = SYSDIR_ROOT . '/templates';
    $smarty->config_dir   = SYSDIR_ROOT . '/templates/configs';
    $smarty->compile_dir  = SYSDIR_ROOT . '/cache/tpl_compile';
    $smarty->cache_dir    = SYSDIR_ROOT . '/cache/tpl_cache';

    //左右边界符,默认为{},但实际应用当中容易与JavaScript相冲突,所以设成<{}>
    $smarty->left_delimiter = "<{"; 
    $smarty->right_delimiter = "}>";

    //$smarty->compile_check = true;
    //$smarty->debugging = false;
    //$smarty->caching = 1;
    //$smarty->cache_lifetime = 60;

    $smarty->assign("current_time", strftime ("%Y-%m-%d %H:%M:%S"));
    $smarty->assign("URL_SELF", $_SERVER['PHP_SELF']);

}
?>
