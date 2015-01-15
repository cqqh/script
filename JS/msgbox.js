var msgBox = function(opt){
    this.title = opt.title || '';
    this.content = opt.content || 'load...';
    this.width = opt.width || 300;
    this.height = opt.height || 180;
    
    this.dom = document.createElement('div');
    this.dom.className      = 'mask';
    this.dom.style.position = 'fixed';
    this.dom.style.top      = '0px';
    this.dom.style.left     = '0px';
    this.dom.style.width    = '100%';
    this.dom.style.height   = '100%';
    this.dom.style.zIndex   = 1000;
    this.dom.style.backgroundColor = 'rgba(0,0,0,0.5)';

    this.init();
}

msgBox.prototype = {
    init:function(){
        this.getWindowSize();
        var posWidth = this.windowWidth/2 - this.width/2 + 'px',
            posHeight= this.windowHeight/2 - this.height/2 + 'px',
            html = '';
        html+= '<div style="padding: 5px;background: #fafafa;position: absolute;left:'+posWidth+';top:'+posHeight+';width:'+this.width+'px;height:'+this.height+'px">';
        html+= '<div><h3>'+this.title+'</h3></div>';
        html+= '<div>'+this.content+'</div>';
        html+= '</div>';
        this.dom.innerHTML = html;

        document.getElementsByTagName('body')[0].appendChild(this.dom);
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