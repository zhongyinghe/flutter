AndroidX版本引起的问题
-----
### 1、总论
```
问题
发生过程
原因
解决方法
```
##### 2、问题
```
编译时报以下错误:
D8: Program type already present: android.support.v4.app.INotificationSideChannel
```
##### 3、发生过程
```
我在引入webview_flutter包显示网页时，编译的过程中就报上面的错误
```
##### 4、原因
```
AndroidX引起的问题
```
##### 5、解决方法
```
迁移flutter app到AndroidX
```
具体步骤:<br>
步骤一:在文件android/gradle/wrapper/gradle-wrapper.properties中
```
distributionUrl=https\://services.gradle.org/distributions/gradle-4.10.2-all.zip
```
步骤二:在android/build.gradle中,替换
```
dependencies {
    classpath 'com.android.tools.build:gradle:3.2.1'
}
```
为
```
dependencies {
    classpath 'com.android.tools.build:gradle:3.3.0'
}
```
步骤三:在android/gradle.properties中增加
```
android.enableJetifier=true
android.useAndroidX=true
```
步骤四:在android/app/build.gradle中
```
Under android {, make sure compileSdkVersion and targetSdkVersion are at least 28.
```
步骤五:在android/app/build.gradle中,替换
```
testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
```
为
```
testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
```
在dependencies {中,替换
```
androidTestImplementation 'com.android.support.test:runner:1.0.2'
androidTestImplementation 'com.android.support.test.espresso:espresso-core:3.0.2'
```
为
```
androidTestImplementation 'androidx.test:runner:1.1.1'
androidTestImplementation 'androidx.test.espresso:espresso-core:3.1.1'
```
步骤六: 编译项目
```
在编译项目的过程中，把一些需要使用v4的包升级为支持AndroidX的版本,
例如:
fluttertoast的2.2.11版本就要升级到支持AndroidX的版本，否则编译不通过
image_picker的0.4.10版本就要涉及到支持AndroidX的版本,否则编译不通过
```
[具体处理步骤可以参考](https://flutter.dev/docs/development/packages-and-plugins/androidx-compatibility)
<br>
[找到问题的解决方法连接为](https://stackoverflow.com/questions/55596683/flutter-build-failed-with-d8-program-type-already-present)
