//
//  PostCell.h
//  zxczxvc
//
//  Created by William Judd on 3/17/16.
//  Copyright © 2016 William Judd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *triggerImage;
@property (weak, nonatomic) IBOutlet UIImageView *auraImage;
@property (weak, nonatomic) IBOutlet UITextView *commentTextField;



@end
