### 1、flutter常用命令
```
帮助：flutter -h 或 flutter --help

诊断flutter：flutter doctor

查看flutter版本号：flutter --version

flutter升级：flutter upgrade

获取flutter packages包：flutter packages get

json序列化，自动监听命令（使用json_annotation、build_runner、json_serializable库的执行命令）：
flutter packages pub run build_runner watch

打包apk包：
64位-release：
flutter build apk --release --target-platform android-arm64

32位-release：
flutter build apk --release --target-platform android-arm
```
```
flutter build apk 来打包 APK,告知这种方式会将 android-arm 和 android-arm64 两种CPU架构都打包到一个apk中，
app打包出来的apk会是一个 “fat APK”。
```
```
如果打包是为了上传到 Google play 上的，建议使用 app bundles 的方式或者对不同架构 CPU 分别打包
命令如下:
flutter build appbundle --target-platform android-arm64

flutter build appbundle --target-platform android-arm
```
```
flutter build apk --target-platform android-arm64 

flutter build apk --target-platform android-arm
```
[参考](http://w4mxl.github.io/2019/07/10/provide-64-bit-for-google-play/)
<br>
[参考2](https://blog.csdn.net/dalong3976/article/details/94736506)
