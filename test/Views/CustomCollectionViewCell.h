//
//  CustomCollectionViewCell.h
//  test
//
//  Created by François Juteau on 03/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *lastName;

@end
