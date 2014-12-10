<?php
/**
 * 读取文件最后N行 - like tail
 * @version 0.1
 * @author cqqh
 * @date 2014-12-10
 */

function tail($filename, $n = 10){
    $file = fopen($filename,'r');
    fseek($file, $n*1024*-1,SEEK_END);
    while ($line = fgets($file)){
        $lines[] = trim($line);
    }
    return array_slice($lines, -$n);
}

//echo json_encode(tail('log.txt'));