关于flutter_staggered_grid_view的认识和使用
-----
```
 return Container(
      margin: EdgeInsets.only(top: 12.0),
      color: Colors.white,
      child: StaggeredGridView.countBuilder(
        itemCount: indexGoodsList.length,//item数
        primary: false,
        shrinkWrap: true,//在ListView中嵌套flutter_staggered_grid_view中使用,防止报错
        physics: new NeverScrollableScrollPhysics(),//在ListView中嵌套flutter_staggered_grid_view下解决不滚动问题
        crossAxisCount: 4,//横轴计数
        mainAxisSpacing: 5.0,//主轴间距离
        crossAxisSpacing: 5.0,//横轴间距离
        padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),//缩进设置
        itemBuilder: (context, index) => getGoodsCard(context, indexGoodsList[index]),//构建每个item
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),//在横轴方向,每个item占的空间比
      ),
    );
```