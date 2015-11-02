#coding=utf-8
import MySQLdb
import sys

order_id = 10
con = None
try:
    #连接mysql的方法：connect('ip','user','password','dbname')
    con = MySQLdb.connect('localhost', 'root','root', 'menu', charset="utf8");
    #所有的查询，都在连接con的一个模块cursor上面运行的
    cur = con.cursor()
    #所有菜品
    res = cur.execute("SELECT * FROM `dr_dish`")
    dish_res = cur.fetchmany(res)
    
    res = cur.execute("SELECT * FROM `dr_order_dish` WHERE order_id = %s",(order_id))
    order_res = cur.fetchmany(res)

finally:
    if con:
        #无论如何，连接记得关闭
        con.close()
#info = cur.fetchmany(res)
dish = {}
for ii in dish_res:
    dish[ii[0]] = ii[2]


for ii in order_res:
    #dish[ii[0]] = ii[2]
    #print dish[ii[2]]
    #print ii[3]
    print len(dish[ii[2]])
    tmp = "%s * %s" %(dish[ii[2]], ii[3])
    print tmp

#print dish
