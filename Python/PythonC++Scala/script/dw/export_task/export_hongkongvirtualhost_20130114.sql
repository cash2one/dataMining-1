DROP TABLE IF EXISTS topexport.keyword_trade_hongkongvirtualhost;
CREATE TABLE topexport.keyword_trade_hongkongvirtualhost LIKE topexport.keyword_trade_template;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130106_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130107_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130108_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130109_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130110_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130111_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130112_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_1 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_10 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_11 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_12 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_13 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_14 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_15 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_2 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_3 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_4 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_5 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_6 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_7 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_8 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;

    INSERT INTO topexport.keyword_trade_hongkongvirtualhost
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
    LEFT JOIN topdata.top_item_trade_his_20130113_9 T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='香港虚拟主机'
    AND T5.item_id IS NOT NULL;
