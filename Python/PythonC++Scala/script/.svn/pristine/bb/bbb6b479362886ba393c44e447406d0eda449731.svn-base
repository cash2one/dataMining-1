DROP TABLE IF EXISTS topexport.{{target_table}};
CREATE TABLE topexport.{{target_table}} LIKE topexport.keyword_trade_template;
{% for trade_source_table in trade_source_table_list %}
    INSERT INTO topexport.{{target_table}}
    SELECT T1.keyword,
        T2.shop_type,
        T1.item_id,
        T2.title,
        T4.attr_list,
        T3.wangwang,
        T2.location2,
        T5.nick,
        T5.rank,
        T5.vip_level,
        T5.price,
        T5.promo_title,
        T5.amount,
        T5.trade_time,
        T5.sku
    FROM ibbd2.top_cat_items T1
    LEFT JOIN ibbd2.top_item1 T2
    ON T1.item_id=T2.item_id
    LEFT JOIN ibbd2.top_shop1 T3
    ON T1.user_num_id = T3.user_num_id
    LEFT JOIN ibbd2.top_item3 T4
    ON T1.item_id=T4.item_id
    LEFT JOIN topdata.{{trade_source_table}} T5
    ON T1.item_id=T5.item_id
    WHERE T1.keyword='{{keyword}}'
    AND T5.item_id IS NOT NULL;
{% end %}