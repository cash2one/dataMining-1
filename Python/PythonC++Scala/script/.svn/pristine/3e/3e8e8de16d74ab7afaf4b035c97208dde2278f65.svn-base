export IFS=";"
tables="user2;user_keywords;alipay_notify;alipay_order;alipay_trade;ibbd_recharge_his;user_fee_his;user_item_monitor;user_itemends_monitor"

for table in $tables; do
    /usr/local/mysql/bin/mysqldump -uibbd_site -pibbd_site_152 ibbd2 "$table" --no-create-info --default-character-set=utf8 -q --max_allowed_packet=2M --extended-insert=false --skip-add-locks --extended-insert --no-autocommit > /data/ibbd2_backup/"$table"_$(date +%Y%m%d).sql
done