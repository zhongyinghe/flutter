r_upgrade认识使用
-----
```
目录
    1、使用过程
    2、使用注意事项
```
##### 1、使用过程
```
RUpgrade.setDebug(false);
RUpgrade.stream.listen((DownloadInfo info) {
  if(this.mounted) {
    setState(() {
      progress = info.percent;
      remainingTime = info.planTime;
    });
  }
  if(info.status == DownloadStatus.STATUS_SUCCESSFUL) {
    progress = 100;
  }
});

RUpgrade.upgrade(
  widget.url,
  fileName: "update.apk",
  isAutoRequestInstall: true,//下载后自动安装软件
  notificationStyle: NotificationStyle.speechAndPlanTime,
);
```

##### 2、使用注意事项
```
下载时要动态授权，否则会报错
```
[官方说明文档](https://github.com/rhymelph/r_upgrade/blob/master/README_CN.md)
