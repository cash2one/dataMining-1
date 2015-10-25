#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
import MySQLdb
import MySQLdb.cursors
def connAndDo(fun):
    connect = MySQLdb.connect(host="223.4.155.152",db="ibbd2_daily",port=3306,charset="utf8",user="ibbd",passwd="spider")
    cursor = connect.cursor()
    fun(cursor)
    connect.commit()
    cursor.close()
    connect.close()
        
def execute_keywordly(cursor,sql,debug=False):
    cursor.execute("select distinct keyword from ibbd2_daily.keyword")
    keywords = [ i[0].encode('utf-8') for i in cursor.fetchall()]
    for i,keyword in enumerate(keywords):
        print "正在执行",keyword,"   ",1+i,"   还有",len(keywords)-i-1,'个'
        tmp = sql.format(keyword)
        #print tmp
        if not debug:
            cursor.execute(tmp)
    
def insert_keyword_daily_status(cursor):
        sql = """
            INSERT INTO ibbd2_daily.keyword_daily_status
                    (
                    SELECT T3.id,T1.keyword,T2.date_of,SUM(T2.volume),
                                SUM(T2.trade_num),SUM(T2.sales),SUM(buyer_num),
                                T2.population_tsmp
                            FROM (SELECT keyword,item_id FROM ibbd2.top_cat_items
                                        WHERE keyword='{}') T1,
                                        ibbd2.top_item2 T2,
                                        ibbd2_daily.keyword T3
                    WHERE T1.item_id = T2.item_id
                    AND T1.keyword = T3.keyword
                    GROUP BY T2.date_of
                    )
                    """
        execute_keywordly(cursor,sql)

def insert_keywrod_province_status(cursor):       
    sql = """
         insert into ibbd2_daily.ststc_keyword_province_status
         (select id,keyword,date_of,province,volume,trade_num,sales,now()
             from
             (select T1.id,T2.keyword,T2.date_of,
                      case
                            when T2.province like '%未知%' then '未知'
                            when T2.province like '%上海%' then '上海'
                            when T2.province like '%云南%' then '云南'
                            when T2.province like '%内蒙古%' then '内蒙古'
                            when T2.province like '%北京%' then '北京'
                            when T2.province like '%台湾%' then '台湾'
                            when T2.province like '%吉林%' then '吉林'
                            when T2.province like '%四川%' then '四川'
                            when T2.province like '%天津%' then '天津'
                            when T2.province like '%宁夏%' then '宁夏'
                            when T2.province like '%安徽%' then '安徽'
                            when T2.province like '%山东%' then '山东'
                            when T2.province like '%山西%' then '山西'
                            when T2.province like '%广东%' then '广东'
                            when T2.province like '%广西%' then '广西'
                            when T2.province like '%新疆%' then '新疆'
                            when T2.province like '%江苏%' then '江苏'
                            when T2.province like '%江西%' then '江西'
                            when T2.province like '%河北%' then '河北'
                            when T2.province like ' ?河南%' then '河南'
                            when T2.province like '%浙江%' then '浙江'
                            when T2.province like '%海南%' then '海南'
                            when T2.province like '%湖北%' then '湖北'
                            when T2.province like '%湖南%' then '湖南'
                            when T2.province like '%澳门%' then '澳门'
                            when T2.province like '%甘肃%' then '甘肃'
                            when T2.province like '%福建%' then '福建'
                            when T2.province like '%西藏%' then '西藏'
                            when T2.province like '%贵州%' then '贵州'
                            when T2.province like '%辽宁%' then '辽宁'
                            when T2.province like '%重庆%' then '重庆'
                            when T2.province like '%陕西%' then '陕西'
                            when T2.province like '%青海%' then '青海'
                            when T2.province like '%香港%' then '香港'
                            when T2.province like '%黑龙江%' then '黑龙江'
                            else '未知'
                      end province,
                     sum(T2.volume) volume,sum(T2.trade_num) trade_num,sum(T2.sales) sales
              from ibbd2_daily.keyword T1, 
                      ibbd2.ststc_cat_shop_sales_detail T2 
              where T1.keyword=T2.keyword and T2.keyword='{}' 
              group by date_of,T2.province) tmp
              group by date_of,province);
    """
    execute_keywordly(cursor,sql)
    
def insert_keyword_price_volume(cursor):    
    sql = """
        INSERT INTO ibbd2_daily.ststc_keyword_price_volume
          (
          SELECT T3.id,T1.keyword,T2.date_of,ROUND(T2.avg_deal_price), SUM(T2.volume),NOW()
                FROM
                (SELECT keyword,item_id FROM ibbd2.top_cat_items T
                    WHERE T.keyword='{}') T1
                , ibbd2.top_item2 T2
                , ibbd2_daily.keyword T3
                WHERE T1.item_id = T2.item_id
                AND T3.keyword = T1.keyword
                AND T2.item_id IS NOT NULL
                GROUP BY T2.date_of,ROUND(T2.avg_deal_price)
            );
    """
    execute_keywordly(cursor,sql,debug=False)
if __name__ == '__main__':
    for i in ['未知','上海','云南','内蒙古','北京','台湾','吉林','四川','天津','宁夏','安徽','山东','山西','广东','广西','新疆','江苏','江西','河北',' 河南','浙江','海南','湖北','湖南','澳门','甘肃','福建','西藏','贵州','辽宁','重庆','陕西','青海','香港','黑龙江']:
        print "when T3.location2 like '%" + i + "%' then '"+i+"'"
#    connAndDo(insert_keywrod_province_status)
