DropdownButton认识
-----
```
DropdownButton中的默认值属性: value, 其值必须在items中的,否则报错， 错误信息如下:

Either zero or 2 or more [DropdownMenuItem]s were detected with the same value
解决方法就是:value的值必须能在items中能够找到
```
[参考链接](https://stackoverflow.com/questions/59925233/either-zero-or-2-or-more-dropdownmenuitems-were-detected-with-the-same-value)
