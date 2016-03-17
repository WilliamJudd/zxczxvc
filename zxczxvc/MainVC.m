//
//  MainVC.m
//  zxczxvc
//
//  Created by William Judd on 3/16/16.
//  Copyright © 2016 William Judd. All rights reserved.
//

#import "MainVC.h"
#import "MyCollectionViewCell.h"

@interface MainVC () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *circleImages;

@end

@implementation MainVC







- (void)viewDidLoad
{
    [super viewDidLoad];
    _circleImages = [@[@"Beach",
                       @"Bears",
                       @"Beats",
                       @"Chevy",
                       @"Chipotle",
                       @"Concert",
                       @"Hp Logo",
                       @"J.Crew",
                       @"Nike",
                       @"Starbucks"] mutableCopy];
}



#pragma mark - UICollectionView Datasource

// 1
-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}

// 2
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return _circleImages.count;
}

// 3
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *myCell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"circleCell"
                                    forIndexPath:indexPath];
    
    UIImage *image;
    long row = [indexPath row];
    
    image = [UIImage imageNamed: _circleImages[row]];
    
    myCell.imageView.image = image;
    
    return myCell;
}

// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/@end
