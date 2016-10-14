<?php

define('AUTH_COOKIE','connected_logged_user');
define('AUTH_COOKIE_TIME', 60 * 60 * 2 );


function get_home_url(){
    return 'http://localhost/connected/';
}

function set_logged_user( $user ){
    if( is_null(get_logged_user()) )
        setcookie(AUTH_COOKIE, json_encode( $user ), time() + AUTH_COOKIE_TIME, "/");
}

function get_logged_user(){
    $response = null;
    if ( isset( $_COOKIE[AUTH_COOKIE] ) )
        $response = $_COOKIE[AUTH_COOKIE];
    return $response;
}

function close_session(){
    if( !is_null(get_logged_user()) )
        setcookie(AUTH_COOKIE, null, -1, '/');
}