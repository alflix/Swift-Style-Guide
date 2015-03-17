//
//  AnotherCollectionViewController.m
//  CollectionViewDemo
//
//  Created by JieYuanZhuang on 15/3/12.
//  Copyright (c) 2015年 JieYuanZhuang. All rights reserved.
//

#import "AnotherCollectionViewController.h"

@interface AnotherCollectionViewController ()

@end

@implementation AnotherCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {    
    CGFloat randomHeight = 80 + (arc4random() % 150);
    return CGSizeMake(80, randomHeight);
}

- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(CustomCollectionViewLayout*) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath {
    CGFloat randomHeight = 80 + (arc4random() % 150);
    return randomHeight;
}
@end
