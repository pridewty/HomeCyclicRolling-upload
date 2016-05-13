//
//  HomeViewController.m
//  HomeCyclicRolling
//
//  Created by pride太医 on 16/5/11.
//  Copyright © 2016年 pridewty. All rights reserved.
//

#import "HomeViewController.h"
#import "TYCollectionView.h"

@interface HomeViewController ()
@property (strong, nonatomic)  TYCollectionView *collectionView;//轮播的collectionView
@property(nonatomic,strong)UIPageControl *pageControl;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //建立包含图片名的数组
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 0; i<5; i++) {
      NSString *imageName = [NSString stringWithFormat:@"img_%02d",i + 1];
        [imageArray addObject:imageName];
    }
    
    //两步搞定
    //1.导入TYCollectionView类的主头文件，传入一个数组创建轮播
    TYCollectionView *collectionV = [[TYCollectionView alloc]initWithImageArray:imageArray];
    [collectionV start];//开始轮播
    
    [self.view addSubview:collectionV];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
