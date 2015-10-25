先用task.py生成xml模板，task.py需要修改一些参数。
然后再修改etlbyhj.py,有3个地方：日期、日志文件名、连接参数。
如果还想要对特别的block进行修改线程，就更改BaseTaskThread的specTask，增加。
主要都是执行etlbyhj.py

如果需要捕捉异常，请把BaseTaskThread类中的try 和except注释删掉。
现在的策略是，捕捉异常后，不断尝试，粒度是以block为单位。
可以在BaseTaskThread类中把while进行简单的设置，变成有限次数