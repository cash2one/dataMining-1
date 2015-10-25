DROP TABLE IF EXISTS topexport.keyword_trade_yurongfu;
CREATE TABLE topexport.keyword_trade_yurongfu LIKE topexport.keyword_trade_template;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121223_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121224_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121226_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121227_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121228_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121229_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121230_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20121231_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130102_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130103_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130104_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_yurongfu
    SELECT T1.keyword,
        null,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.top_item_trade_his_20130105_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='羽绒服'
    AND T5.item_id IS NOT NULL;
