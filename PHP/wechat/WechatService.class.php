<?php

/**
 * 微信公众号
 * @author cqqh
 */


class WechatService
{
    public $access_token;

    private $_token;
    private $_appid;
    private $_appsecret;
    private $_encodingaeskey;

    public function __construct($options){
        $this->_token = isset($options['token'])?$options['token']:'';
        $this->_encodingaeskey = isset($options['encodingaeskey'])?$options['encodingaeskey']:'';
        $this->_appid = isset($options['appid'])?$options['appid']:'';
        $this->_appsecret = isset($options['appsecret'])?$options['appsecret']:'';
    }

    /**
     * GET 请求
     * @param string $url
     */
    private function _http_get($url){
        $oCurl = curl_init();
        if(stripos($url,"https://")!==FALSE){
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
        }
        curl_setopt($oCurl, CURLOPT_URL, $url);
        curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
        $sContent = curl_exec($oCurl);
        $aStatus = curl_getinfo($oCurl);
        curl_close($oCurl);
        if(intval($aStatus["http_code"])==200){
            return $sContent;
        }else{
            return false;
        }
    }
    /**
     * POST 请求
     * @param string $url
     * @param array $param
     * @param boolean $post_file 是否文件上传
     * @return string content
     */
    private function _http_post($url,$param,$post_file=false){
        $oCurl = curl_init();
        if(stripos($url,"https://")!==FALSE){
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
        }
        if (is_string($param) || $post_file) {
            $strPOST = $param;
        } else {
            $aPOST = array();
            foreach($param as $key=>$val){
                $aPOST[] = $key."=".urlencode($val);
            }
            $strPOST =  join("&", $aPOST);
        }
        curl_setopt($oCurl, CURLOPT_URL, $url);
        curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt($oCurl, CURLOPT_POST,true);
        curl_setopt($oCurl, CURLOPT_POSTFIELDS,$strPOST);
        $sContent = curl_exec($oCurl);
        $aStatus = curl_getinfo($oCurl);
        curl_close($oCurl);
        if(intval($aStatus["http_code"])==200){
            return $sContent;
        }else{
            return false;
        }
    }

    //验证AccessToken 利用 获取服务器IP地址接口
    public function checkAccessToken($access_token){
        $url = "https://api.weixin.qq.com/cgi-bin/getcallbackip?access_token=".$access_token;
        $res = json_decode($this->_http_get($url));
        if($res->ip_list){
            $this->access_token = $access_token;
            return true;
        } else {
            return false;
        }
    }

    //获取 access_token
    public function getAccessToken(){
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".APPID."&secret=".APPSECRET;
        $res = json_decode($this->_http_get($url));
        $this->access_token = $res->access_token;
        return $res;
    }

    //获取用户信息
    public function getUserInfo($openid){
        $url = 'https://api.weixin.qq.com/cgi-bin/user/info?access_token='.$this->access_token.'&openid='.$openid.'&lang=zh_CN';
        $res = json_decode($this->_http_get($url));
        return $res;
    }

    //获取用户列表
    public function getUserList($next_openid = ''){
        $url = 'https://api.weixin.qq.com/cgi-bin/user/get?access_token='.$this->access_token.'&next_openid='.$next_openid;
        $res = json_decode($this->_http_get($url));
        return $res;
    }
}
