# history

> v 1.0.1

    @Cooper
    @2013.5.7 15:00:00
    @add outflow support
    add slave interrupt
    为 slave 增加了中断响应,如果有高优先级的任务加入, 则发布中断请求, slave 收到后即中断当前任务
