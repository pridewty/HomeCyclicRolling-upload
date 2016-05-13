//
//  TYCollectionView.m
//  HomeCyclicRolling
//
//  Created by pride太医 on 16/5/11.
//  Copyright © 2016年 pridewty. All rights reserved.
//

#import "TYCollectionView.h"
#import "TYCollectionCell.h"
#define TYCell @"collectionCell"
#define MaxSection 100

@interface TYCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSTimer *timer;//定时器
@property(nonatomic,strong)UIPageControl *pageControl;

-(void)addTimer;
-(void)removeTimer;
@end

@implementation TYCollectionView

-(NSMutableArray *)imageArray{
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}


-(instancetype)initWithImageArray:(NSMutableArray*)imageArray{
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width / 2.5);
   self = [self initWithImageArray:imageArray theFrame:rect];
    return self;
}

-(instancetype)initWithImageArray:(NSMutableArray*)imageArray theFrame:(CGRect)rect{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.itemSize =CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/ 2.5);
    
    //2.创建collectionView
    TYCollectionView *collectionV = [[TYCollectionView alloc]initWithFrame:rect collectionViewLayout:layout];
    collectionV.backgroundColor = [UIColor redColor];
    collectionV.layout = layout;
    collectionV.imageArray = imageArray;
  
    return collectionV;

}

-(void)start{
    [self addTimer];
    [self scrollToLocation];
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
   self =  [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {

        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;


        [self registerClass:[TYCollectionCell class] forCellWithReuseIdentifier:TYCell];
        self.delegate = self;
        self.dataSource = self;
        
        UIPageControl *pageControl = [[UIPageControl alloc]init];
        pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        pageControl.pageIndicatorTintColor = [UIColor orangeColor];
        self.pageControl = pageControl;
       
    }
    return self;
}


-(void)addTimer{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    self.timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


-(void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}


-(void)nextPage{

    NSIndexPath *currentIndexPath = [[self indexPathsForVisibleItems] lastObject];

    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:MaxSection/2];
    [self scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];

    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem == self.imageArray.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    [self scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

-(void)layoutSubviews{
    [super layoutSubviews];

    [self.superview addSubview:self.pageControl];
    [self.superview bringSubviewToFront:self.pageControl];
    
    CGFloat collectionMaxY = CGRectGetMaxY(self.frame);
    CGFloat margin = 15;

    CGPoint collCenter = self.center;
    CGFloat centerX = collCenter.x;
    CGFloat centerY = collectionMaxY - margin;
    [self.pageControl setCenter:CGPointMake(centerX, centerY)];
    self.pageControl.bounds = CGRectMake(0, 0, 100, 0);
    self.pageControl.numberOfPages = self.imageArray.count;
    
}

-(void)scrollToLocation{
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:MaxSection/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}

#pragma mark- UICollectionViewDataSource数据源方法

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return MaxSection;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TYCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TYCell forIndexPath:indexPath];
    cell.icon = self.imageArray[indexPath.item];
    
    return cell;
}

#pragma mark- UICollectionViewDelegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = (int) (scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5) % self.imageArray.count;
    self.pageControl.currentPage =page;
}




@end
