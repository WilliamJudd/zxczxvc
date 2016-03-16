//
//  ViewController.m
//  zxczxvc
//
//  Created by William Judd on 3/15/16.
//  Copyright © 2016 William Judd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *auraImages;

@end

@implementation ViewController {
    
    __weak IBOutlet UICollectionView *_logoCollectionView;
    __strong IBOutlet UICollectionViewFlowLayout *flowLayout;
    __weak IBOutlet UICollectionViewCell *CellClass;
    
    __weak IBOutlet UIImageView *cellImage;
    
    NSArray *circleViews;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self->_logoCollectionView registerClass:[CellClass class] forCellWithReuseIdentifier:@"classCell"];
    self->_logoCollectionView.backgroundColor = [UIColor clearColor];
    
    // Configure layout
    self->flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [self->flowLayout setItemSize:CGSizeMake(191, 160)];
    [self->flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self->flowLayout.minimumInteritemSpacing = 0.0f;
    [self->_logoCollectionView setCollectionViewLayout:self->flowLayout];
    self->_logoCollectionView.bounces = YES;
    [self->_logoCollectionView setShowsHorizontalScrollIndicator:NO];
    [self->_logoCollectionView setShowsVerticalScrollIndicator:NO];
   
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}




-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [dataArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cellTwo = [cv dequeueReusableCellWithReuseIdentifier:@"cellName" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d",indexPath.item];
    return cell;
}


@end
