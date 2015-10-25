## history

> v 1.5.3

    @Cooper
    `2013.5.9 15:00:00`
    修正 topitem 天猫商品中图片的URL提取逻辑
    `img = re.sub(r'', body, re.S) or re.sub(r'', body, re.S)`

    @Cylee
    `2013.7.3 20:00:00`
    处理某些商品没有shopId导致任务失败的问题
    添加一个处理这类商品的函数(未实现，这种商品的数据将会被丢弃)