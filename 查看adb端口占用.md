##### 1、步骤一: 查看端口
```
netstat -aon|findstr "5037"
```

##### 2、步骤二: 根据查看的端口，看什么程序占用了端口
```
tasklist|findstr "6540"
```
[参考](https://blog.csdn.net/chenjinlong126/article/details/79833746)
