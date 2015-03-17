//
//  CustomCollectionViewLayout.h
//  CollectionViewDemo
//
//  Created by JieYuanZhuang on 15/3/12.
//  Copyright (c) 2015年 JieYuanZhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomCollectionViewLayout;

@protocol CustomCollectionViewLayoutDelegate <NSObject>
@required
- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(CustomCollectionViewLayout*) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath;
@end

@interface CustomCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, assign) NSUInteger numberOfColumns;
@property (nonatomic, assign) CGFloat interItemSpacing;
@property (weak, nonatomic)  id<CustomCollectionViewLayoutDelegate> delegate;

@end
