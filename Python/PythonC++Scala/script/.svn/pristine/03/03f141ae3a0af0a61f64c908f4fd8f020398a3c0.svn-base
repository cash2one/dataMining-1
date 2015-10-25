use ibbd2;

/*
insert into top_item_tradingtime_partition
	select * from top_item_tradingtime where population_tsmp>'2013-02-19 00:00:00';
*/	

insert into top_item2_partition
	select * from top_item2  where population_tsmp>'2013-02-19 00:00:00';
	
insert into ststc_cat_shop_sales_detail_partition
	select * from ibbd2.ststc_cat_shop_sales_detail where population_tsmp>'2013-02-19 00:00:00';
	
insert into ststc_keyword_shop_pct_partition
	select * from ststc_keyword_shop_pct   where population_tsmp>'2013-02-19 00:00:00';
	
insert into ststc_shop_sales_keyword_partition
	select * from ststc_shop_sales_keyword where population_tsmp>'2013-02-19 00:00:00';
	