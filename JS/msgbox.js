var msgBox = function(opt){
    this.title = opt.title || '提示';
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
    
    var posWidth = document.body.clientWidth/2 - this.width/2 + 'px',
        posHeight= document.body.clientHeight/2 - this.height/2 + 'px',
        html = '';
    html+= '<div style="background: #fafafa;position: absolute;left:'+posWidth+';top:'+posHeight+';">';
    html+= '<div>'+this.content+'</div>';
    html+= '</div>';
    this.dom.innerHTML = html;
    
    document.getElementsByTagName('body')[0].appendChild(this.dom);
}