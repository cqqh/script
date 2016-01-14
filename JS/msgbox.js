/**
 * 对话框
 * @param {type} opt
 * @returns {msgBox}
 * @author cqqh
 */

var msgBox = function(opt){
    var self = this;
    this.title = opt.title || 'title';
    this.content = opt.content || 'load...';
    this.width = opt.width || 300;
    this.height = opt.height || 180; //弃用
    this.isMask = opt.isMask || false;
    this.ok = opt.ok || false;

    this.dom = document.createElement('div');
    this.dom.style.position = 'absolute';
    this.dom.style.top = '0px';
    this.dom.style.left = '0px';

    //遮罩层
    if (this.isMask) {
        this.mask = '<div style="position: fixed;top: 0;left: 0;width: 100%;height: 100%;z-index: 100;background: #000;opacity: 0.5;filter: alpha(opacity=50);"></div>';
        this.dom.innerHTML = this.mask;
    }
    //
    if (typeof this.content == 'object') {
        this.content = this.content.html();
    }

    this.init();

    document.addEventListener('touchmove', touchmove);

    //监听窗口重设
    $(window).resize(function(){
        self._resize();
    });
}

msgBox.prototype = {
    init: function () {
        this.getWindowSize();
        var posWidth = this.windowWidth / 2 - this.width / 2 + 'px',
            posHeight = this.windowHeight / 2 - this.height / 2 + 'px',
            dom = this.dom,
            innerDiv,
            html = '';

        innerDiv = document.createElement('div');
        innerDiv.style.position = 'fixed';
        innerDiv.style.zIndex = '200';
        innerDiv.style.left = posWidth;
        innerDiv.style.top  = posHeight;
        innerDiv.style.width = this.width+'px';
        innerDiv.className = 'prompt_box px';

        //html+= '<span class="close" style="position: absolute;padding: 2px; top: 0; right: 2px; cursor: pointer;">X</span>';
        html+= '<div class="t" style="height:auto; padding: 0 15px 15px 15px;"><p>'+this.title+'</p><p>'+this.content+'</p></div>';
        //html+= '<input type="button" class="btn form-control btnn hiwrap" value="确定">';

        //按钮组
        var btn = document.createElement('input');
        btn.type = 'button';
        btn.className = 'btn form-control btnn hiwrap';
        btn.value = '确定';
        innerDiv.innerHTML = html;
        innerDiv.appendChild(btn);

        btn.onclick = function () {
            $(dom).remove();
            document.removeEventListener("touchmove", touchmove);
        };

        //有回调按钮
        if(this.ok){
            btn.style.width = '50%';
            var okBtn = btn.cloneNode(true);
            btn.style.borderRight = '1px solid #9e9e9e';
            okBtn.onclick = this.ok;

            btn.value= '取消';
            innerDiv.appendChild(okBtn);
        }

        dom.appendChild(innerDiv);
        document.body.appendChild(dom);
    },
    getWindowSize: function () {
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
    close: function () {
        this.dom.remove();
    },
    _resize: function() {
        this.getWindowSize();
        var posWidth  = this.windowWidth / 2 - this.width / 2 + 'px',
            posHeight = this.windowHeight / 2 - this.height / 2 + 'px';

        this.dom.getElementsByClassName('prompt_box')[0].style.left = posWidth;
        this.dom.getElementsByClassName('prompt_box')[0].style.top  = posHeight;
    }
};

var d1 = new msgBox({
    content:'<div><input type="tel" placeholder="输入手机号"/></div><div><input type="button" value="取消" onclick="d1.close()" /> <input type="submit" value="提交" /></div>'
});