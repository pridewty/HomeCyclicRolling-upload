# HomeCyclicRolling-upload
轮播器
基于UICollectionView的一款简单易用的的轮播器。两行代码就可以在你的项目里使用。有TYCollectionView和TYCollectionCell两个类，讲两个类放入你的工程里，在控制器里包含TYCollectionView.h头文件即可。
An easy to use carousel item which is Based UICollectionView. Two lines of code you can use in your project.Contains TYCollectionView and TYCollectionCell two classes, take two classes into your project in the controller.Import TYCollectionView.h header file.
//两步搞定
    //1.导入TYCollectionView类的主头文件，传入一个数组创建轮播
    TYCollectionView *collectionV = [[TYCollectionView alloc]initWithImageArray:imageArray];
    //2.调用实例方法 start即可
    [collectionV start];//开始轮播
    
    详情参见demo哦
