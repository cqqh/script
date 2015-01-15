/**
 * 对话框
 * @param {type} opt
 * @returns {msgBox}
 * @author cqqh
 */

var msgBox = function(opt){
    this.title = opt.title || '';
    this.content = opt.content || 'load...';
    this.width = opt.width || 300;
    this.height = opt.height || 180;
    this.isMask = opt.isMask || false;

    this.dom = document.createElement('div');
    this.dom.style.position = 'absolute';
    this.dom.style.top      = '0px';
    this.dom.style.left     = '0px';

    //遮罩层
    if(this.isMask){
        this.mask = '<div style="position: fixed;top: 0;left: 0;width: 100%;height: 100%;z-index: 1000;background: #000;opacity: 0.5;filter: alpha(opacity=50);"></div>';
        this.dom.innerHTML = this.mask;
    }
    //
    if(typeof this.content == 'object'){
        this.content = this.content.html();
    }

    this.init();
}

msgBox.prototype = {
    init:function(){
        this.getWindowSize();
        var posWidth = this.windowWidth/2 - this.width/2 + 'px',
            posHeight= this.windowHeight/2 - this.height/2 + 'px',
            dom = this.dom,
            html = '';
        html+= '<div style="border:1px solid #eee;z-index:9999;padding:3px;border-radius:5px;background: #fafafa;position: fixed;left:'+posWidth+';top:'+posHeight+';width:'+this.width+'px;height:'+this.height+'px">';
        html+= '<span class="close" style="position: absolute;padding: 2px; top: 0; right: 2px; cursor: pointer;">X</span>';
        html+= '<div class="title" style="text-align: center;padding: 5px;height: 20px;"><h3>'+this.title+'</h3></div>';
        html+= '<div>'+this.content+'</div>';
        html+= '</div>';
        dom.innerHTML += html;

        document.body.appendChild(this.dom);
        dom.getElementsByClassName('close')[0].onclick = function(){
            dom.remove();
        };
    },
    getWindowSize:function(){
        // 获取窗口宽度
        if (window.innerWidth)
            this.windowWidth = window.innerWidth;
        else if ((document.body) && (document.body.clientWidth))
            this.windowWidth = document.body.clientWidth;
        // 获取窗口高度
        if (window.innerHeight)
            this.windowHeight = window.innerHeight;
        else if ((document.body) && (document.body.clientHeight))
            this.windowHeight = document.body.clientHeight;
        return this;
    },
    close:function(){
        this.dom.remove();
    }
}

//var d1 = new msgBox({
//    content:'<div><input type="tel" placeholder="输入手机号"/></div><div><input type="button" value="取消" onclick="d1.close()" /> <input type="submit" value="提交" /></div>'
//});