//
//  TYCollectionView.h
//  HomeCyclicRolling
//
//  Created by pride太医 on 16/5/11.
//  Copyright © 2016年 pridewty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYCollectionView : UICollectionView

@property(nonatomic,strong)UICollectionViewFlowLayout *layout;

@property(nonatomic,strong)NSMutableArray *imageArray;


-(void)start;//轮播开始
-(instancetype)initWithImageArray:(NSMutableArray*)imageArray;
-(instancetype)initWithImageArray:(NSMutableArray*)imageArray theFrame:(CGRect)rect;

@end
