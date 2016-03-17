//
//  MainVC.m
//  zxczxvc
//
//  Created by William Judd on 3/16/16.
//  Copyright © 2016 William Judd. All rights reserved.
//

#import "MainVC.h"
#import "MyCollectionViewCell.h"
#import "PostCell.h"

@interface MainVC () <UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource,
UITableViewDelegate> {
    
    
    
    
    // Will be static for now, but will need to be immuatable later.
    
    NSArray *profileArray;
    NSArray *titleArray;
    NSArray *descriptionArray;
    NSArray *triggerArray;
    NSArray *auraArray;
    NSArray *commentArray;
    NSArray *cardSizeArray;
    
    
    
}

@property (strong, nonatomic) NSMutableArray *circleImages;
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;






@end

@implementation MainVC
//
//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _circleImages = [@[@"Beach",@"Bears",@"Beats",@"Chevy",@"Chipotle",@"Concert", @"Hp Logo",@"J.Crew",@"Nike",@"Starbucks"] mutableCopy];
    
    [self loadExampleData];
//    self.feedTableView.separatorColor = [UIColor whiteColor];
    
//    self.view.backgroundColor = [UIColor redColor];

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
 }*/

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //%%% this is asking for the number in the cardSizeArray.  If you're seriously
    // thinking about making your cards dynamic, they should depend on something more reliable
    // for example, facebook's post sizes depend on whether it's a status update or photo, etc
    // so there should be a switch statement in here that returns different heights depending on
    // what kind of post it is.  Also, don't forget to change the height of the
    // cardView if you use dynamic cards
    return [((NSNumber*)[cardSizeArray objectAtIndex:indexPath.row])intValue];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning you're going to want to change this
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning you're going to want to change this
    return 15;
}

//creates cell with a row number (0,1,2, etc), sets the name and description as strings from event object
//from _events
//called after hitting "activate" button, numberOfSectionsInTableView times per event
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostCell *cell = [self.feedTableView dequeueReusableCellWithIdentifier:@"postCell"];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[PostCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"postCell"];
    }
    
    cell.profileImage.image = [UIImage imageNamed:[profileArray objectAtIndex:indexPath.row]];
    cell.triggerImage.image = [UIImage imageNamed:[triggerArray objectAtIndex:indexPath.row]];
    cell.auraImage.image = [UIImage imageNamed:[auraArray objectAtIndex:indexPath.row]];
    cell.titleLabel.text = [titleArray objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = [descriptionArray objectAtIndex:indexPath.row];
    cell.commentTextField.text = [commentArray objectAtIndex:indexPath.row];
    
    //%%% I made the cards pseudo dynamic, so I'm asking the cards to change their frames depending on the height of the cell
    cell.cardView.frame = CGRectMake(10, 5, 300, [((NSNumber*)[cardSizeArray objectAtIndex:indexPath.row])intValue]-10);
    
    return cell;
}




-(void)loadExampleData
{
    /*
     this is just example data and you shouldn't be using your table like this because it's static.
     For example, if you want to have a news feed, you should be using an NSMutableArray and pulling
     the information from the internet somehow.  If you'd like some help figuring out the logistics,
     I'd be happy to help, contact me at cwrichardkim@gmail.com or twitter: @cwRichardKim
     */
    
    
    
    profileArray = [[NSArray alloc]initWithObjects:@"SnowboardPro",@"HorsePro",@"SpacePro",@"SnowCatPro",@"BeachPro",@"BaseballPro",@"BabyPro",@"CatPro",@"UnicatPro",@"ApplePro",@"HangoutPro",@"DodgePro",@"BanksyPro",@"SectorPro",@"AddidasPro", nil];
    
    
    
    auraArray = [[NSArray alloc]initWithObjects:@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle",@"RossRectangle", nil];
    
    
    
    titleArray = [[NSArray alloc]initWithObjects:@"First Card",@"OOOOH CHIIIILDD",@"Look! This One's Bigger", @"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD",@"OOOOH CHIIIILDD", nil];
    
    
    
    commentArray = [[NSArray alloc]initWithObjects:@"Things are gonna get",@"Easieerrrrr",@"ooooooh chiiiiild",@"Things are gonna get",@"Things are gonna get",@"Things are gonna get",@"Things are gonna get",@"Things are gonna get",@"Things are gonna get",@"Things are gonna get",@"Things are gonna get",@"Things are gonna get",@"Things are gonna get",@"Things are gonna get",@"Things are gonna get", nil];
    
    
    descriptionArray = [[NSArray alloc]initWithObjects:@"Dance off bro",@"Things are gonna get brighter",@"oooh oooh baeebeeee", @"Dance off bro",@"Dance off bro",@"Dance off bro",@"Dance off bro",@"Dance off bro",@"Dance off bro",@"Dance off bro",@"Dance off bro",@"Dance off bro",@"Dance off bro",@"Dance off bro",@"Dance off bro", nil];
    
    
    
    cardSizeArray = [[NSArray alloc]initWithObjects:@330,@330,@330,@330,@330,@330,@330,@330,@330,@330,@330,@330,@330,@330,@330, nil];
}




@end
