<?php

interface UserInterface
{
    function getUser( $u='', $uid=0 ){
    }

    function updateUser( $user=array(), $info=array() ){
    }

    function addUser( $info=array() ){
    }
}
