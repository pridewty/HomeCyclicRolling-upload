//
//  TYCollectionCell.m
//  collectionViewDemo
//
//  Created by a王泰贻 on 16/3/29.
//  Copyright © 2016年 WTY. All rights reserved.
//

#import "TYCollectionCell.h"
@interface TYCollectionCell()
@property(nonatomic,strong)UIImageView *imageView;
@end


@implementation TYCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:imageView];
        self.imageView = imageView;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

//接收所要显示的图片名，并显示
-(void)setIcon:(NSString *)icon{
    _icon = icon;
    self.imageView.image = [UIImage imageNamed:icon];
}

//设置子控件，设置imageView的frame为自身的bounds
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds ;
//    NSLog(@"self.bounds------TYCollectionCell--%@",NSStringFromCGRect(self.bounds));
}


@end
