<?php

//获取所有节点树形数据
function getNodeTree(){
    $result = $this->where(array('status' => 1))->order('level_ asc,sort desc')->select();
    foreach($result as $node){
        $nodes[$node['pid']][] = $node;
    }
    $res = _getChildren($nodes, 0);
    return $res;
}
//递归 返回子节点数据
function _getChildren($nodes, $pid = 0){
    if($nodes[$pid]){
        foreach($nodes[$pid] as $key=>$data){
            $res[$key] = $data;
            $res[$key]['children'] = $this->_getChildren($nodes,$data['id']);
        }
    }
    return $res;
}