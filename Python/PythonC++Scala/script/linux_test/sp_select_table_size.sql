DROP PROCEDURE IF EXISTS `sp_select_table_size`;
DELIMITER $$
CREATE PROCEDURE `sp_select_table_size`(_schema_name varchar(50), _table_name varchar(50))
    COMMENT '统计表所占用的空间'
SELECT TABLE_NAME, 
			concat(round(sum(DATA_LENGTH)/1024/1024, 2), 'MB') as '数据大小', 
			concat(round(sum(INDEX_LENGTH)/1024/1024, 2), 'MB') as '索引大小', 
			concat(round(sum(DATA_LENGTH+INDEX_LENGTH)/1024/1024, 2), 'MB') as '大小总和', 
			TABLE_ROWS as '行数' FROM information_schema.TABLES  
		WHERE TABLE_SCHEMA=_schema_name AND TABLE_NAME=_table_name$$
DELIMITER ;