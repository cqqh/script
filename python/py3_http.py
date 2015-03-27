import urllib.request
import http.cookiejar

def make_cookie(name, value):
    return http.cookiejar.Cookie(
        version=0,
        name=name,
        value=value,
        port=None,
        port_specified=False,
        domain=".sogou.com",
        domain_specified=True,
        domain_initial_dot=False,
        path="/",
        path_specified=True,
        secure=False,
        expires=None,
        discard=False,
        comment=None,
        comment_url=None,
        rest=None
    )

def get_cookie():
    cj = http.cookiejar.CookieJar()
    opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))
    fp = opener.open("http://weixin.sogou.com/gzhjs?openid=oIWsFt3
                     hEHhTj8zKvrACLhaCO1m4")

    rs = fp.read(1000)
    rs = rs.decode("UTF8")
    fp.close()
    print(rs)

while 1:
#cookie
    cj = http.cookiejar.CookieJar()
    #cj.set_cookie(make_cookie("SUV", "001D3BBF775689914F844775C55D8795"))
    cj.set_cookie(make_cookie("SUV", "ffffffffffffffffaa"))
    cj.set_cookie(make_cookie("SNUID", "73BF9A770C091E323A11A81E0DE70163"))

    opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))
    #while 1:
    #fp = urllib.request.urlopen("http://weixin.sogou.com/gzhjs?openid=oIWsFt3hEHhTj8zKvrACLhaCO1m4&repp=1")
    fp = opener.open("http://weixin.sogou.com/gzhjs?openid=oIWsFt3hEHhTj8zKvrACLhaCO1m4")

    rs = fp.read(1000)
    #rs = rs.decode("UTF8")
    fp.close()
    print(rs)



