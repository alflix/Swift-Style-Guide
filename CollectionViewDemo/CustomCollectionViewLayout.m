//
//  CustomCollectionViewLayout.m
//  CollectionViewDemo
//
//  Created by JieYuanZhuang on 15/3/12.
//  Copyright (c) 2015年 JieYuanZhuang. All rights reserved.
//

#import "CustomCollectionViewLayout.h"

@interface CustomCollectionViewLayout (/*Private Methods*/)
@property (nonatomic, strong) NSMutableDictionary *lastYValueForColumn;
@property (strong, nonatomic) NSMutableDictionary *layoutInfo;
@end

@implementation CustomCollectionViewLayout

-(void) prepareLayout {
    //每行有多少个Item
    self.numberOfColumns = 3;
    //Item间的间距
    self.interItemSpacing = 12.5;
    //用于记录item的y轴
    self.lastYValueForColumn = [NSMutableDictionary dictionary];
    //用于记录item的属性
    self.layoutInfo = [NSMutableDictionary dictionary];
    
    //初始化当前Item为第0个Item
    CGFloat currentColumn = 0;
    
    //计算Item的宽度
    CGFloat fullWidth = self.collectionView.frame.size.width;
    CGFloat availableSpaceExcludingPadding = fullWidth - (self.interItemSpacing * (self.numberOfColumns + 1));
    CGFloat itemWidth = availableSpaceExcludingPadding / self.numberOfColumns;
    
    NSIndexPath *indexPath;
    NSInteger numSections = [self.collectionView numberOfSections];
    
    //遍历section
    for(NSInteger section = 0; section < numSections; section++)  {
        
        NSInteger numItems = [self.collectionView numberOfItemsInSection:section];
        //遍历item
        for(NSInteger item = 0; item < numItems; item++){
            indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            
            UICollectionViewLayoutAttributes *itemAttributes =
            [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            
            //计算x轴
            CGFloat x = self.interItemSpacing + (self.interItemSpacing + itemWidth) * currentColumn;
            //计算y轴
            CGFloat y = [self.lastYValueForColumn[@(currentColumn)] doubleValue];
            //通过协议回传高度值
            CGFloat height = [((id<CustomCollectionViewLayoutDelegate>)self.collectionView.delegate)
                              collectionView:self.collectionView
                              layout:self
                              heightForItemAtIndexPath:indexPath];
            
            itemAttributes.frame = CGRectMake(x, y, itemWidth, height);
            
            //下一个item的y轴是当前y轴加上item高度，并且加上间距
            y += height;
            y += self.interItemSpacing;
            
            //把下一个item的y轴记入到字典中
            self.lastYValueForColumn[@(currentColumn)] = @(y);
            
            currentColumn ++;
            if(currentColumn == self.numberOfColumns) currentColumn = 0;
            //将item的属性记录到字典中
            self.layoutInfo[indexPath] = itemAttributes;
        }
    }
}

//使用enumerateKeysAndObjectsUsingBlock遍历prepareLayout中的layoutInfo加入一个数组中
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *allAttributes = [NSMutableArray arrayWithCapacity:self.layoutInfo.count];
    [self.layoutInfo enumerateKeysAndObjectsUsingBlock:^(NSIndexPath *indexPath,
                                                         UICollectionViewLayoutAttributes *attributes,
                                                         BOOL *stop) {
        if (CGRectIntersectsRect(rect, attributes.frame)) {
            [allAttributes addObject:attributes];
        }
    }];
    return allAttributes;
}

-(CGSize) collectionViewContentSize {
    NSUInteger currentColumn = 0;
    CGFloat maxHeight = 0;
    do {
        //最大高度就是之前字典中的y轴
        CGFloat height = [self.lastYValueForColumn[@(currentColumn)] doubleValue];
        if(height > maxHeight)
            maxHeight = height;
        currentColumn ++;
    } while (currentColumn < self.numberOfColumns);
    
    return CGSizeMake(self.collectionView.frame.size.width, maxHeight);
}

@end

