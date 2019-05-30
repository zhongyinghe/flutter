http请求
-----
目录
```
    1、请求步骤
    2、文件上传
```
##### 1、请求步骤
```
    1)判断是否发送了http请求
        在发送请求进行中，要显示加载图标;在请求完成后去掉加载图标
        
    2)请求后是否有数据;有数据按有数据处理,没数据则按没数据处理
```
##### 2、文件上传
步骤一:从相册中获取图片
```
var image = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 700.0, maxHeight: 700.0);
setState(() {
  _image = image;
  fileName = path.basename(image.path);
});
```
步骤二:放进FormData中以便发送请求
```
FormData formData = new FormData();
formData.add('avatar', new UploadFileInfo(_image, fileName));
```
