#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
'''
    对网站url进行请求，获取时间并记录
'''
import os
import urllib2
import urllib
import datetime
import time
import json
import random

def getAjaxUrl(path='/root/workspace/tbi/ibbd/templates'):
    """
        从文件中挖出ajax的url
    """
    ret = list()
    if isinstance(path,list):
        for p in path:
            ret = list()
            ret = ret + _getAjaxUrl(p)
    else:
        ret = _getAjaxUrl(path)
    return set(ret)

def _getAjaxUrl(path='/root/workspace/tbi/ibbd/templates'):
    ret = []
    lines = os.popen("grep -r '$.get(' "+path).read().split('\n')
    ret = ret + _getUrlFromLine(lines)
    return ret

def _getUrlFromLine(lines):
    ret = list()
    for l in lines:
        tem = l.split("'") #以单引号 ' 为分割符
        if len(tem)<3 :
            tem = l.split('"') #以双引号 " 为分割符
        if len(tem)==3:
            ret.append(tem[1])
    return ret

def getParam():
    """
        获取测试url时所需要的模拟参数
    """
    data = {}
    data.update(keyword='四物汤',
                        region = '全国',
                        brand = '全部',
                        count = 10,
                        brand2 =2,
                        keyword2 = 2,
                        region2 = 2,
                        chartType = 'line',
                        tradeType = 'volume',
                        myshop = '******',
                        compareName = '',
                        page = 1,
                        pageCount =1,
                        pageSize = 1)
    
    n = datetime.datetime.now()
    yesterday = (n - datetime.timedelta(days=1)).strftime('%Y/%m/%d')
    oneweekbefore = (n - datetime.timedelta(days=8)).strftime('%Y/%m/%d')
    
    '''测试1月份的'''
    yesterday = '2013/01/02'
    oneweekbefore = '2013/01/16'
    
    data.update(fromdate = oneweekbefore,
                        fromDate = oneweekbefore,
                        toDate = yesterday,
                        todate = yesterday)
    return data
    
def getUrlTime(longQueryTime=0, logFile="./timeresult.log"):
    '''
        对URL进行请求，计算时间，保存在日志文件中
        ＠param long_query_time:只有大于该秒数的记录会纳入计算
    '''
    urls = getAjaxUrl(path=['/root/workspace/tbi/ibbd/templates','/root/workspace/tbi/ibbd/static/js'])
    urls = [url for url in urls if url.startswith('/ajax/industry')]
#    urls = ['/ajax/customer/tradeperiod/chart/data']
#    urls=['/ajax/industry/pricingindex/priceinterval/get']
#    urls = ['/ajax/industry/product/rising/table']
    website = 'http://localhost:8007'

    '''以用户登录获取环境'''
    cookies = urllib2.HTTPCookieProcessor()
    opener = urllib2.build_opener(cookies)
    f = opener.open(website+'/ajax/user/login?user_email=hope@ibbd.net&password=passwd',data=json.dumps({'user_email':'hope@ibbd.net','password':'passwd'})).read()
    '''获取用户关键词'''
    keywords = getKeywordsFromFile()
    tmp = []
    for i in range(300):
        tmp.append(random.choice(keywords))
    keywords = tmp

    result = {}
    for i in urls:
        result[i] = []

    keywordsLen = len(keywords)
    for keyword in keywords:
        keywordsLen = keywordsLen - 1
        print '关键词为',keyword,'  还有'+str(keywordsLen)+'个'
        data = getParam()
        data.update(keyword=keyword)
        data = urllib.urlencode(data)
        for url in urls:
            print '正在查取:',url
            try:
                '''
                    将测试两次，如果第一次时间比第二次时间要长很多，说明第一次是未
                    预热的情况，记录该时间
                '''
                t = time.time()
                response = opener.open(website+url+'?' + data)
                interval = time.time() - t
                
                t = time.time()
                response = opener.open(website+url+'?' + data)
                hotInterval = time.time() - t
                
                if interval > longQueryTime and interval-hotInterval>1:
                    print interval,website+url+'?' + data
                    result[url].append(interval)
            except  Exception,e :
                print 'error:',e
                print 'url:',website+url+'?' + data
                pass
    tmp = []
    for i in result:
        if result[i] :
            tmp.append((i,len(result[i]), sum(result[i])/len(result[i]), sum(result[i])))
    result = tmp
    print result
    result = sorted(result,key=lambda x:x[3],reverse=True)
    f = open(logFile,'w')
    for i in result:
        f.write(i[0]+':'+ str(i[1])+ ':'+str(i[2]) +':'+str(i[1]*i[2])+'\n')
    f.close()

def loadLog(log = './timeresult.log'):    
    lines = open(log).readlines()
    data = []
    for line in lines:
        d = line[:-1].split(':')
        data.append((d[0],int(d[1]),int(float(d[1])*float(d[2]))))
    data = sorted(data,key=lambda x:x[1],reverse=True)
    return data[:10]

def getKeywordsFromFile(file="./keywords.data"):
    words = open(file).read().split('\n')
    return words

if __name__ =='__main__':
    getUrlTime(logFile="./log/1.time.log")
    
    
'''
/ajax/industry/product/rising/table:15:1.97271931966:29.5907897949
[('/ajax/industry/product/rising/table', 25, 9.212035264968872, 230.3008816242218)]

('/ajax/industry/product/rising/table', 36, 156)
('/ajax/industry/pricingindex/priceinterval/get', 10, 36)
('/ajax/industry/overview/catreporter/get', 6, 28)
('/ajax/industry/pricingindex/compare/table', 6, 28)
('/ajax/industry/shopdist/dist/table', 5, 41)
('/ajax/industry/overview/cathotshop/get', 5, 20)
('/ajax/industry/shopdist/dist/map', 5, 18)
('/ajax/industry/shopdist/credit/pie', 4, 21)
('/ajax/industry/saleindex/index/line', 4, 18)
('/ajax/industry/overview/rank/items', 4, 16)

| Innodb_buffer_pool_read_requests      | 3292658938 |
| Innodb_buffer_pool_reads              | 11669344   |

| Innodb_buffer_pool_read_requests      | 3292721858 |
| Innodb_buffer_pool_reads              | 11669359   |

| Innodb_buffer_pool_read_requests      | 3293547781 |
| Innodb_buffer_pool_reads              | 11672490   |

 Innodb_buffer_pool_read_requests      | 3293586108 |
| Innodb_buffer_pool_reads              | 11672490   |

led射灯
LED灯
led灯具
交通信号灯
吊灯
吸顶灯
壁灯
家装主材
护眼灯
水晶灯
节能灯
花洒
蜡烛灯
角阀
面盆龙头
香薰灯
乳胶床垫
儿童书桌
儿童家具套装
儿童床垫
儿童沙发
儿童电脑椅
实木 餐桌
实木床
家居
布艺沙发
席梦思床垫
床上用品
床单
床品四件套
折叠床
折叠沙发
松木床
椰棕床垫
海绵床垫
田园椅
被套
酒店床上用品
隔尿床垫
餐桌椅
高低床
九洲鹿家纺
博洋家纺
家纺
富安娜家纺
床品套件
梦洁家纺
水星家纺
罗莱家纺
蚕丝被
仿真花
创意格子
地毯
墙贴
抱枕
摆件
栅栏套装
椅垫
玻璃花瓶
玻璃贴
瓷砖贴
装饰
陶瓷
陶瓷花瓶
隔板
家居布艺
窗帘
戒烟
戒烟产品
戒烟糖
戒烟贴
按摩棒
电子烟
肩颈乐
TCL 冰箱
TCL 洗衣机
TCL 电视
TCL 空调
健康秤
冰激凌机
冰箱
创维 电视
剃须刀
取暖器
吸尘器
吹风机
吹风机 冷暖风
吹风机 包邮
吹风机 大功率
吹风机 超静音
咖啡机
复读机
大家电
干衣机
暖脚器
格力 空调
榨汁机
油烟机
洗衣机
海尔 洗衣机
消毒柜
点读机
点读笔
热水器
煮蛋器
燃气灶
燃气热水器
电压力锅
电子词典
电热水器
电热水器储水式
电热水瓶
电视机
空调
空调扇
美的热水器
老人收音机
足浴木桶
足浴盆
转页扇
酸奶机
面包机
飞利浦
饮水机
投影仪
数位板 绘画板
热敏打印机
移动电源
移动硬盘500G
色带芯
路由器
针式打印机
iphone 5 电信版
TCL 手机
中兴 电信
华为 电信
小米 电信
礼品老人手机
老人手机
蓝牙耳机
笔记本电脑
DOTA 外设
ipad配件
iphone4s手机壳
iphone配件
三星配件
充电宝
游戏耳机
游戏键盘
游戏鼠标
鼠标
不锈钢杯
个性DIY
十字绣
压感笔
口语陪练
台历
图书 教辅
外教
情侣杯
数码油画
无框画
本本控
杯盖
母亲节礼品
淘宝网拍
玩具
相册制作
纪念册
纪念杯
羽毛球拍
韩国文具
马克杯
魔术杯
乐器
吉他
小提琴
宠物食品
冲茶器
咖啡壶
汤锅
炒锅
筷子
蒸锅
保温杯
地垫
垃圾桶
平板拖把
挂式收纳
收纳盒
收纳袋
旋转拖把
枕头
泡脚粉
洗浴木桶
玻璃茶具
遮物帘
飘逸杯
人体润滑剂
女性自慰器
安全套
男性自慰器
跳蛋
abc卫生巾
卫生巾套装
卫生护理液
日夜用卫生巾
棉柔护垫
茶具
陶瓷摆件
内裤
女士内裤
情趣内衣
文胸
文胸套装
无钢圈文胸
珊瑚绒家居服
运动文胸
隐形文胸
jcrew 原单
ROYALCAT  皮草
ROYALCAT  羽绒服
动漫卫衣
北欧  羽绒服
哈伦裤
女士羊毛衫
女式保暖内衣
女式羊绒衫
女式职业装
女式西装
女款马甲
女童连衣裙
女装
女装  衬衣
女装  连衣裙
女装 2013春夏装
女装 T恤
女装 半身裙 短裙
女装 原单剪标
女装 开衫
女装 打底衫
女装 打底裤
女装 棉衣
女装 棉袜
女装 毛衣
女装 牛仔裤
女装 皮衣
女装 羊绒大衣
女装 羽绒服
女装 衬衣
女装 衬衫
女装 西装
女装 运动服
女装 连衣裙
女装 针织衫
女装 风衣
女装棉衣
女装牛仔裤
家居服
尼克服
微喇裤
情侣长袖t恤 韩版
束身衣
束身裤
梦特娇羊绒衫
毛呢外套
瘦腿袜
真丝连衣裙
睡眠袜
羊毛线
羊绒线
羽绒服
羽绒皮衣
西装
连衣裙
连裤袜
酒店工作服
铅笔裤
长袖卫衣
长袖风衣
长裙 夏
静脉曲张
静脉曲张瘦腿裤
韩国代购 棉衣
韩国代购 毛衣
韩国代购 针织衫
韩版亲子装全家装
韩版卫衣
棉麻围巾
真丝围巾
羊毛围巾
羊绒围巾
韩版围巾
JEEP
保暖内衣
男士保暖内衣
男士大衣
男士打底内衣
男士条绒裤
男士棉衣
男士羊绒衫
男士羽绒服
男士衬衫
男士马夹
男式职业装
男生休闲裤
男装
男装 牛仔裤
男装夹克
男装牛仔裤
男装皮衣
皮毛一体皮衣
韩国代购 连衣裙
亲子装
儿童保暖内衣
儿童卫衣
儿童背心马甲
女童打底裤
女童棉衣
童鞋 女 真皮 单鞋
童鞋 雪地靴 女
景区门票
奶粉
羊奶粉
吸奶器
暖奶器
宝宝面霜
牛初乳
痱子粉
BB霜
产检裤
哺乳服
婴儿包屁衣
婴儿奶瓶
婴儿床
婴儿推车
婴儿棉服
婴儿毛毯
婴儿洗发露
婴儿洗衣液
婴儿润肤霜
婴儿游泳池
婴儿爽身粉
婴儿理发器
婴儿睡袋
婴儿磨牙棒
婴儿衣服
婴儿连体衣
婴儿餐具
孕妇背心
孕妇连衣裙
宝宝围嘴
托腹裤
母婴
母婴产品
母婴服饰
母婴用品
爬行毯
益生菌
纸尿裤
电动车
后备箱垫
学步车
尾喉改装
擦车巾
方向盘套 
汽车坐垫
汽车安全座椅
汽车座套
汽车挂饰
汽车方向盘套
汽车脚垫
汽车香水
福克斯 改装
科鲁兹 改装
落地灯
车衣
车贴
车载充电器
车载香水
门槛条
防尘罩
汽车竹炭包
儿童手表
光动能手表
女士手表
情侣手表
机械手表
男士手表
运动手表
翡翠
佛珠
和田玉饰品
情侣对戒
水晶手镯
珍珠耳饰
珍珠项链
纯银戒指
纯银手链
纯银耳饰
纯银脚链
纯银项链
翡翠手链
翡翠手镯
翡翠项链
金镶玉
钻石吊坠
钻石戒指
钻石耳钉
RMK
化妆水
指甲油
橄榄油
欧珀莱 乳液
洗面奶
爽肤水
玻尿酸原液
眼霜
祛痘产品
补水霜
资生堂 乳液
隔离防晒霜
雅诗兰黛 乳液
面膜
首饰盒
香薰精油
高丝 乳液
DHC 乳液
FANCL 乳液
Lancome 乳液
OLAY 乳液
丹姿 乳液
安娜苏
资生堂
雅诗兰黛
香水
高丝
假睫毛
化妆品
护手霜
纯天然手工皂
丰胸精油
丰臀精油
乳液
浴盐
浴足剂
瘦身精油
美足胶
美颈霜
身体乳
隆鼻修复精油
DHA
卵巢保养精油
卵巢保养胶囊
叶酸
叶黄素软胶囊
四物汤
四物饮
固元膏
土蜂蜜 纯天然
大豆异黄酮
天然维生素
左旋肉碱胶囊
心脑血管保健品
排毒养颜
木耳
枇杷蜜 纯天然
果蔬机
榛蘑
正品 bsn蛋白粉5磅 BSN6重矩阵蛋白粉 增肌【送宝莱肌酸和摇杯】
氨基酸
洋槐蜜 纯天然
瘦腿霜
瘦身咖啡
瘦身梅
益生菌粉
维生素复合片
胶原蛋白口服液
胶原蛋白粉
胶原蛋白肽
胶原蛋白饮
酵素
酵素原液
龙眼蜜 成熟蜜
核桃
榛子
橙子
澳门特产 杏仁饼
澳门特产 老婆饼
澳门特产 蛋卷
澳门特产 酥糖
澳门特产礼盒
碧根果
红枣
脐橙
乌龙茶
冻顶乌龙
凤凰单枞
单枞茶
大红袍
大红袍茶
大麦茶
大麦茶 烘焙型
姜茶
安化黑茶
普洱茶
杜仲茶
正山小种
水果茶
滇红
牛蒡茶
玫瑰花茶 
番石榴茶
碧螺春
祁门红茶
竹叶青茶
红茶
绿茶
花草茶
苦荞茶
菊花茶
西湖龙井
铁观音
铁观音茶
高山茶
黄山毛峰
龙井茶
美国大杏仁
伏特加
力娇酒
威士忌
干邑白兰地
洋酒
白葡萄酒
白酒
红葡萄酒
红酒
醒酒片
香槟
黄酒
五香牛肉干
台湾休闲零食
喜糖盒
喜糖袋
山核桃
山椒凤爪
开心果
拉鸭舌
有机米粉
松子
果汁软糖
核桃仁
玉米肽
磨牙饼
糖盒
纸皮核桃
罗汉果
舟山特产
葛根粉 野生
葡萄籽
蜂蜜
辣鸭掌
辣鸭翅
辣鸭脖
辣鸭舌
陈皮
食品
饼干
麻辣牛肉干
网络电话卡
vps
交换机
企业邮箱
国内空间
国内虚拟主机
域名
外教一对一
无线路由器
服务器托管
网卡
网站空间
英语视频
防火墙
香港主机
香港云主机
香港虚拟主机
休闲跑步鞋
死飞
涉水鞋
登山鞋
双肩包
不锈钢运动水壶
分体泳衣
山地车
户外睡袋
护腕
护腰带
旅游保温壶
泳帽
泳镜
运动玩具
野营工具
快干运动裤
比基尼泳衣
瑜伽服装
运动棉衣
运动连衣裙
运动风衣
连体泳衣
速干衣
安踏休闲鞋
安踏跑步鞋
阿迪达斯 男式鞋
高帮帆布鞋
单肩包
单肩斜跨包
女士 银行卡包
手包 女款
手提包
斜挎包
斜跨包
水桶包
流苏包
牛皮女包 手提
真皮女包
韩国 创意包夹
马毛包
中筒靴
商务休闲皮鞋
商务正装皮鞋
女士增高鞋
女装 皮草
女靴
女鞋
女鞋 踝靴
情侣帆布鞋 韩版
手工编织凉鞋
松糕鞋
板鞋
棉皮鞋
浅口帆布鞋
真皮 女鞋 休闲
短靴
童鞋 女 运动鞋 秋
长靴
雪地靴
马丁靴
高筒靴
高跟凉鞋
万向轮旅行箱
拉杆箱
旅行箱
登山包
登机箱
箱包
男包
迷彩包
男士增高鞋
男靴
男鞋
女式手套
机车手套
水晶手链
流行饰品
海关锁
珍珠吊坠
珍珠手链
珍珠毛衣链
男式手套
皮带
紫水晶手链
韩国 创意配件
项链
香薰炉
黑曜石手链

SELECT cast(t2.avg_deal_price AS signed), cast(SUM(t2.volume) AS signed) 
FROM ibbd2.top_item2 t2,ibbd2.top_cat_items t1 
 
WHERE t1.item_id = t2.item_id 
AND t2.date_of BETWEEN '2012-11-25' AND '2012-12-10' 
AND t1.keyword='海关锁' AND t2.item_id IS NOT NULL 
GROUP BY cast(t2.avg_deal_price AS signed) 
ORDER BY cast(t2.avg_deal_price AS signed);


 SELECT          SUM(T2.hour_0),         SUM(T2.hour_1),         SUM(T2.hour_2),         SUM(T2.hour_3),         SUM(T2.hour_4),         SUM(T2.hour_5),         SUM(T2.hour_6),         SUM(T2.hour_7),         SUM(T2.hour_8),         SUM(T2.hour_9),         SUM(T2.hour_10),         SUM(T2.hour_11),         SUM(T2.hour_12),         SUM(T2.hour_13),         SUM(T2.hour_14),         SUM(T2.hour_15),         SUM(T2.hour_16),         SUM(T2.hour_17),         SUM(T2.hour_18),         SUM(T2.hour_19),         SUM(T2.hour_20),         SUM(T2.hour_21),         SUM(T2.hour_22),         SUM(T2.hour_23)         FROM ibbd2.top_cat_search_result T1         LEFT JOIN ibbd2.top_item_tradingtime T2         ON T1.item_id = T2.item_id         AND T2.date_of BETWEEN '2013-02-19 00:00:00' AND '2013-02-25 00:00:00'         
 WHERE T1.keyword='珍珠毛衣链';

CREATE TABLE `top_item_tradingtime_partition2` (
  `item_id` varchar(20) NOT NULL DEFAULT '' COMMENT '商品ID',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `hour_0` int(11) NOT NULL DEFAULT '0' COMMENT '0时销量',
  `hour_1` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_2` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_3` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_4` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_5` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_6` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_7` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_8` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_9` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_10` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_11` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_12` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_13` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_14` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_15` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_16` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_17` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_18` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_19` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_20` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_21` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_22` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_23` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`item_id`,`date_of`),
  KEY `item_id` (`item_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝-商品交易时段表' 
/*!50500 PARTITION BY RANGE  COLUMNS(date_of)
(PARTITION p2012_11 VALUES LESS THAN ('2012-12-01') ENGINE = InnoDB,
 PARTITION p2012_12 VALUES LESS THAN ('2013-01-01') ENGINE = InnoDB,
 PARTITION p2013_01 VALUES LESS THAN ('2013-02-01') ENGINE = InnoDB,
 PARTITION p2013_02 VALUES LESS THAN ('2013-03-01') ENGINE = InnoDB,
 PARTITION p2013_03 VALUES LESS THAN ('2013-04-01') ENGINE = InnoDB,
 PARTITION p2013_04 VALUES LESS THAN ('2013-05-01') ENGINE = InnoDB,
 PARTITION p2013_05 VALUES LESS THAN ('2013-06-01') ENGINE = InnoDB,
 PARTITION p2013_06 VALUES LESS THAN ('2013-07-01') ENGINE = InnoDB,
 PARTITION p2013_07 VALUES LESS THAN ('2013-08-01') ENGINE = InnoDB,
 PARTITION p2013_08 VALUES LESS THAN ('2013-09-01') ENGINE = InnoDB,
 PARTITION p2013_09 VALUES LESS THAN ('2013-10-01') ENGINE = InnoDB,
 PARTITION p2013_10 VALUES LESS THAN ('2013-11-01') ENGINE = InnoDB,
 PARTITION p2013_11 VALUES LESS THAN ('2013-12-01') ENGINE = InnoDB,
 PARTITION p2013_12 VALUES LESS THAN ('2014-01-01') ENGINE = InnoDB) */ 


explain partitions 
SELECT count(*) from (
EXPLAIN 
SELECT t2.avg_deal_price, t2.volume
FROM ibbd2.top_item2 t2 JOIN ibbd2.top_cat_items t1 ON  
t1.keyword='香槟'  AND t1.item_id = t2.item_id 
WHERE 
 t2.date_of BETWEEN '2012-11-25' AND '2012-12-10' 
) s;

SELECT t2.avg_deal_price,t2.volume
from ibbd2.top_item2_parittion3 t2
where t2.item_id='10131144110'
AND 
 t2.date_of BETWEEN '2012-11-25' AND '2012-12-10'
 ;
 
SELECT t2.hour_of,t2.volume
FROM ibbd2.top_item_tradingtime t2, ibbd2.top_cat_search_result t1 
WHERE t2.item_id =t1.item_id 
AND t1.keyword='真皮 女鞋 休闲' 
AND t2.date_of BETWEEN '2012-01-12' AND '2013-01-14'; 

SELECT count(t2.hour_of*t2.volume)
FROM ibbd2.top_item_tradingtime t2
WHERE t2.item_id ='10005933914'
AND t2.date_of BETWEEN '2012-01-12' AND '2013-01-14' group by t2.hour_of; 
| 10000001294 |
| 10000013355 |
| 10000100440 |
| 10000149328 |
| 10000187708 |
| 10000536152 |
| 10000594204 |
| 10000649150 |
| 10000662240 |
| 10000946988 |
| 10001013186 |
| 10001084620 |
| 10001598303 |
| 10002056839 |
| 10002368187 |
| 10002415956 |
| 10002520139 |
| 10002630957 |
| 10002723373 |
| 10002941674 |
| 10003594257 |
| 10003650522 |
| 10003748465 |
| 10003774656 |
| 10003840133 |
| 10004875792 |
| 10004882357 |
| 10005014021 |
| 10005222616 |
| 10005428463 |
| 10005506996 |
| 10005740074 |
| 10005763814 |
| 10005802968 |
| 10005933914 |
| 10006007461 |
| 10006518032 |
| 10006874036 |
| 10008303025 |
| 10008351440 |
| 10008395927 |
| 10009880208 |
| 10010483433 |
| 10010525564 |
| 10010704463 |
| 10010796827 |
| 10011467734 |
| 10011646006 |
| 10011697907 |
| 10012440816 |
| 10012457089 |
| 10012560430 |
| 10012633076 |
| 10012826550 |
| 10013060444 |
| 10013082206 |
| 10013083925 |
| 10013275137 |
| 10013367222 |
| 10013500753 |
| 10013713477 |
| 10013789884 |
| 10013815658 |
| 10013988995 |
| 10014457714 |
| 10014504756 |
| 10014767786 |
| 10015071309 |
| 10015163431 |
| 10015260431 |
| 10015267755 |
| 10015617223 |
| 10016136485 |
| 10016278266 |
| 10016297030 |
| 10016307143 |
| 10016754731 |
| 10017300528 |
| 10017677932 |
| 10017829719 |
| 10017890828 |
| 10018474521 |
| 10018614481 |
| 10018636053 |
| 10018851879 |
| 10019241679 |
| 10019406745 |
| 1001951826  |
| 10019714969 |
| 10020223601 |
| 10020333546 |
| 10020841840 |
| 10021343540 |
| 10021586794 |
| 10021622353 |
| 10022158443 |
| 10022310909 |
| 10022622090 |
| 10022633724 |
| 10023133666 

 EXPLAIN PARTITIONS           
 SELECT SQL_NO_CACHE T3.item_id,T3.item_name,T3.user_num_id,T3.wangwang,T3.volume2,T3.volume1,(T3.volume1-T3.volume2)/T3.volume2
        FROM(
          SELECT T1.item_pic,T1.item_id,T1.item_name,T1.user_num_id,T1.wangwang,
          SUM(CASE WHEN T2.date_of BETWEEN CURDATE()-INTERVAL 7 DAY AND CURDATE() THEN T2.volume ELSE 0 END) AS volume1,
          SUM(CASE WHEN T2.date_of BETWEEN CURDATE()-INTERVAL 14 DAY AND CURDATE()-INTERVAL 7 DAY THEN T2.volume ELSE 0 END)  AS volume2
          FROM ibbdtest.top_cat_search_result T1
          LEFT JOIN ibbdtest.top_item2 T2
          ON T1.item_id=T2.item_id
          AND T2.date_of BETWEEN CURDATE()-INTERVAL 14 DAY AND CURDATE()
          WHERE T1.keyword='榛蘑'
                    AND T2.item_id IS NOT NULL
          GROUP BY T1.item_id
        )T3
        ORDER BY T3.volume1/T3.volume2 DESC 
        LIMIT 0, 50
 EXPLAIN PARTITIONS  
  SELECT SQL_NO_CACHE T3.item_id,T3.item_name,T3.user_num_id,T3.wangwang,T3.volume2,T3.volume1,(T3.volume1-T3.volume2)/T3.volume2
        FROM(
          SELECT T1.item_pic,T1.item_id,T1.item_name,T1.user_num_id,T1.wangwang,
          SUM(CASE WHEN T2.date_of BETWEEN CURDATE()-INTERVAL 7 DAY AND CURDATE() THEN T2.volume ELSE 0 END) AS volume1,
          SUM(CASE WHEN T2.date_of BETWEEN CURDATE()-INTERVAL 14 DAY AND CURDATE()-INTERVAL 7 DAY THEN T2.volume ELSE 0 END)  AS volume2
          FROM ibbdtest.top_cat_search_result T1
          LEFT JOIN ibbdtest.top_item2_older T2
          ON T1.item_id=T2.item_id
          AND T2.date_of BETWEEN CURDATE()-INTERVAL 14 DAY AND CURDATE()
          WHERE T1.keyword='补水霜'
                    AND T2.item_id IS NOT NULL
          GROUP BY T1.item_id
        )T3
        ORDER BY T3.volume1/T3.volume2 DESC 
        LIMIT 0, 50

ALTER TABLE top_item_tradingtime PARTITION BY KEY(`date_of`) PARTITIONS 2;          
ALTER TABLE ibbdtest.top_item_tradingtime
partition by key(`date_of`);
PARTITION BY RANGE COLUMNS(`date_of`)
subpartition by key(`item_id`) subpartitions 20(
PARTITION p2012_11 VALUES LESS THAN ('2012-12-01'),
PARTITION p2012_12 VALUES LESS THAN ('2013-01-01'),
PARTITION p2013_01 VALUES LESS THAN ('2013-02-01')
);

 item_id         | varchar(20) | NO   | PRI |                   |       |
| date_of 

SELECT t2.hour_of,cast(SUM(t2.volume) AS signed) 
FROM ibbd2.top_item_tradingtime t2, ibbd2.top_cat_search_result t1 
WHERE t2.item_id =t1.item_id 
AND t1.keyword='珍珠毛衣链' 
AND t2.date_of BETWEEN '2013-01-01' AND '2013-01-14' GROUP BY t2.hour_of; 

mysqldump --quick --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit -h223.4.155.172 -uibbd -pspider ibbd2 top_item_tradingtime>/tmp/top_item_tradingtime.sql


quota_tradingtime_aly       |    1329147 |
| ststc_cat_range_hotshops    |    1851383 |
| top_item_buyer              |    2139217 |
| ststc_shop_sale_in          |    2842206 |

| top_itemsearchresult        |    5188324 | 
| ststc_shop_sales_keyword    |    5390005 |
| ststc_keyword_shop_pct      |    5914877 |
| ststc_cat_shop_sales_detail |    7878887 |
| ststc_item_rate1            |    9547230 |
| top_item2                   |   15627237 |
| top_item_tradingtime        |   64096317 |




--------
FILE I/O
--------

Pending normal aio reads: 0 [0, 0, 0, 0] , aio writes: 0 [0, 0, 0, 0] ,
 ibuf aio reads: 0, log i/o's: 0, sync i/o's: 0
Pending flushes (fsync) log: 0; buffer pool: 0
21813927 OS file reads, 18002418 OS file writes, 2473507 OS fsyncs
1 pending preads, 0 pending pwrites
76.21 reads/s, 16384 avg bytes/read, 0.00 writes/s, 0.00 fsyncs/s
--------
FILE I/O
--------

Pending normal aio reads: 0 [0, 0, 0, 0] , aio writes: 0 [0, 0, 0, 0] ,
 ibuf aio reads: 0, log i/o's: 0, sync i/o's: 0
Pending flushes (fsync) log: 0; buffer pool: 0
21821999 OS file reads, 18002531 OS file writes, 2473539 OS fsyncs
2 pending preads, 0 pending pwrites
86.53 reads/s, 16762 avg bytes/read, 1.86 writes/s, 0.36 fsyncs/s

21834950 OS file reads, 18002580 OS file writes, 2473554 OS fsyncs
100.90 reads/s, 16384 avg bytes/read, 0.00 writes/s, 0.00 fsyncs/s




'''