<?php
/**
 * php抓取cnzz统计信息
 * 需要在 站点设置 开启查看密码
 */

//开启后的url
//$url = 'http://new.cnzz.com/v1/login.php?t=login&siteid=1253619063';
$url = 'http://new.cnzz.com/v1/login.php?t=login&siteid=站点ID';

$post = [
    'password' => '查看密码'
];

$html = http_request($url, true, $post);
preg_match('/location\: (http.*?)\s/s', $html, $url);
$html = http_request($url[1]);
$html = http_request('http://tongji.cnzz.com/main.php?c=site&a=overview&ajax=module%3Dsummary&siteid=站点ID&_='.time());
$data = json_decode($html, true);

//今日数据
var_dump($data['data']['summary']['items'][0]);
/**
array(15) {
  ["pv"]=>
  string(3) "321"
  ["newpv"]=>
  string(1) "0"
  ["ip"]=>
  string(3) "245"
  ["uv"]=>
  string(3) "236"
  ["newuv"]=>
  string(3) "203"
  ["session"]=>
  string(3) "278"
  ["sessionpass"]=>
  string(2) "16"
  ["stime"]=>
  string(4) "3276"
  ["outpv"]=>
  string(3) "262"
  ["rateuv"]=>
  string(2) "26"
  ["averageupv"]=>
  string(4) "1.36"
  ["rateuvpro"]=>
  string(6) "11.02%"
  ["averageuvrate"]=>
  string(4) "1.18"
  ["averagepv"]=>
  string(4) "1.15"
  ["averagestime"]=>
  string(9) "3分24秒"
}
 */
//汇总数据
var_dump($data);


function http_request($URI, $isHearder = false, $post = false)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $URI);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_HEADER, $isHearder);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36');
    curl_setopt($ch, CURLOPT_COOKIEFILE, dirname(__FILE__)."/cnzz.cookie");
    curl_setopt($ch, CURLOPT_COOKIEJAR, dirname(__FILE__)."/cnzz.cookie");

    if(strpos($URI, 'https') === 0){
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
    }

    if($post){
        curl_setopt ($ch, CURLOPT_POST, 1);
        curl_setopt ($ch, CURLOPT_POSTFIELDS, $post);
    }

    $result = curl_exec($ch);
    curl_close($ch);
    return $result;
}