//
//  CustomCollectionViewCell.h
//  test
//
//  Created by François Juteau on 03/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

typedef void(^cellCompletion)(NSString *completion);

@interface CustomCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;


-(void)setPerson:(Person *)person;

@end
