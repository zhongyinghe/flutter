app版本号获取
-----
```
import 'package:package_info/package_info.dart';

PackageInfo packageInfo = await PackageInfo.fromPlatform();

String appName = packageInfo.appName;
String packageName = packageInfo.packageName;
String version = packageInfo.version;
String buildNumber = packageInfo.buildNumber;
```
```
主要应用于: app的版本更新
```
[参考链接](https://pub.dev/packages/package_info)
