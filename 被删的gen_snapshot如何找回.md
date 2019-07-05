被删除的gen_snapshot.exe如何找回
----
目录
```
背景
原因
解决方法
```
### 1、背景
```
我在使用flutter build apk时报找不到
flutter\bin\cache\artifacts\engine\android-arm-release\windows-x64\gen_snapshot.exe
所以编译不成功
```
### 2、原因
```
gen_snapshot.exe被360做为木马删除了
```
### 3、解决方法
```
到这里https://flutter.dev/docs/development/tools/sdk/releases
下载相应版本的sdk包

然后根据被删除的gen_snapshot.exe属于哪个目录，找到相应的exe文件,复制进去就可以了
```
