#数据都为2013－02－19 00:00:00之前，在改表前必须导入新数据！！！
##运行script/ibbd_optimize/insert_newer_data_to_partition.sql导入新数据

* top_item_tradingtime:分区后平均时间由35到16，还不理想，暂不使用,分区表为ibbd2.top_item_tradingtime_partition
* top_item2:分区后平均时间减至5秒，分区表为ibbd2.top_item2_partition3(废弃top_item2_partition)
* ststc_cat_shop_sales_detail:查询花费时间很少，暂时不需要分区
* ststc_keyword_shop_pct:查询花费时间很少，暂时不需要分区
* ststc_shop_sales_keyword:在网站模块没有展示sql?