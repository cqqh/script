<?php

include 'WechatService.class.php';

//define your token
define("TOKEN", "XXXX");
define("APPID", "XXXX");
define("APPSECRET", "XXXX");
define("ENCODINGAESKEY", "XXXX");

$options = array(
    'token'         => TOKEN, //token
    'appid'         => APPID,
    'appsecret'     => APPSECRET,
    'encodingaeskey'=> ENCODINGAESKEY //填写加密用的EncodingAESKey，如接口为明文模式可忽略
);

//读取 缓存文件 ,取出 access_token
$access_token = json_decode(file_get_contents('./token.json'));

$Wechat = new WechatService($options);
$res = $Wechat->checkAccessToken($access_token->token);
var_dump($res);
if(!$res){
    $time = $_SERVER['REQUEST_TIME'];
    $access_token = $Wechat->getAccessToken();
    $cache = array(
        'token' => $access_token->access_token,
        'expires' => $time + $access_token->expires_in
    );
    
    //token 写入缓存文件
    file_put_contents('./token.json', json_encode($cache));
}
/////////////////
$info = $Wechat->getUserInfo('oeXWpt8vqWXJx_NUgSLejHNj50DY');
