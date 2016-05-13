# HomeCyclicRolling-upload
轮播器


description：

基于UICollectionView的一款简单易用的的轮播器。
两行代码就可以在你的项目里使用。
有TYCollectionView和TYCollectionCell两个类，讲两个类放入你的工程里，在控制器里包含TYCollectionView.h头文件即可。通过传入一个图片数组即可创建，init方法传入frame可以设置轮播器的位置。

An easy to use carousel item which is Based UICollectionView.

Two lines of code you can use in your project.Contains TYCollectionView and TYCollectionCell two classes, take two classes into your project in the controller.

Import TYCollectionView.h header file.


How to use:(two steps)

//两步搞定

//1.导入TYCollectionView类的主头文件，传入一个数组创建轮播

    TYCollectionView *collectionV = [[TYCollectionView alloc]initWithImageArray:imageArray];
    
//2.调用start实例方法即可
    
    [collectionV start];
    
//提供了一个设置轮播位置的init方法，default在最顶部


 TYCollectionView *collectionV = [[TYCollectionView alloc]initWithImageArray:imageArray theFrame:CGRectMake(0, 0, 414, 150)];

    
    详情参见demo哦
    
    不足和bugs，欢迎指正和补充。
