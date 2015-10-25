use schemanoexist;

drop procedure if exists sp_copy_top_item_tradingtime_dayly;
delimiter $$
create procedure sp_copy_top_item_tradingtime_dayly()
COMMENT '复制top_item_tradingtime的数据'
begin
	declare begindate date default '2012-06-01';
	while begindate<'2012-08-10' do
		insert ignore into ibbd2.top_item_tradingtime_partition
			(select * from ibbd2.top_item_tradingtime where date_of between begindate and begindate + interval 1 day);
		select '已完成',begindate;
		set begindate = begindate + interval 1 day;
	end while;
end $$
delimiter ;

drop procedure if exists sp_copy_top_item2_dayly;
delimiter $$
create procedure sp_copy_top_item2_dayly()
begin
	declare begindate date default '2012-06-01';
	while begindate<'2012-08-10' do
		insert ignore into ibbd2.top_item2_partition
			(select * from ibbd2.top_item2 where date_of between begindate and begindate + interval 1 day);
		select '已完成',begindate;
		set begindate = begindate + interval 1 day;
	end while;
end $$
delimiter ;

drop procedure if exists sp_copy_ststc_item_rate1_dayly;
delimiter $$
create procedure sp_copy_ststc_item_rate1_dayly()
begin
	declare begindate date default '2012-06-01';
	while begindate<'2012-08-10' do
		insert ignore into ibbd2.ststc_item_rate1_partition
			(select * from ibbd2.ststc_item_rate1 where rate_date between begindate and begindate + interval 1 day);
		select '已完成',begindate;
		set begindate = begindate + interval 1 day;
	end while;
end $$
delimiter ;

drop procedure if exists sp_copy_ststc_cat_shop_sales_detail_dayly;
delimiter $$
create procedure sp_copy_ststc_cat_shop_sales_detail_dayly()
begin
	declare begindate date default '2012-06-01';
	while begindate<'2012-08-10' do
		insert ignore into ibbd2.ststc_cat_shop_sales_detail_partition
			(select * from ibbd2.ststc_cat_shop_sales_detail where date_of between begindate and begindate + interval 1 day);
		select '已完成',begindate;
		set begindate = begindate + interval 1 day;
	end while;
end $$
delimiter ;

drop procedure if exists sp_copy_ststc_keyword_shop_pct_dayly;
delimiter $$
create procedure sp_copy_ststc_keyword_shop_pct_dayly()
begin
	declare begindate date default '2012-06-01';
	while begindate<'2012-08-10' do
		insert ignore into ibbd2.ststc_keyword_shop_pct_partition
			(select * from ibbd2.ststc_keyword_shop_pct where date_of between begindate and begindate + interval 1 day);
		select '已完成',begindate;
		set begindate = begindate + interval 1 day;
	end while;
end $$
delimiter ;

drop procedure if exists sp_copy_top_itemsearchresult_dayly;
delimiter $$
create procedure sp_copy_top_itemsearchresult_dayly()
begin
	declare begindate date default '2012-06-01';
	while begindate<'2012-08-10' do
		insert ignore into ibbd2.top_itemsearchresult_partition
			(select * from ibbd2.top_itemsearchresult where population_tsmp between begindate and begindate + interval 1 day);
		select '已完成',begindate;
		set begindate = begindate + interval 1 day;
	end while;
end $$
delimiter ;