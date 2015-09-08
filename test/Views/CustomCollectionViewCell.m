//
//  CustomCollectionViewCell.m
//  test
//
//  Created by François Juteau on 03/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "CacheImageManager.h"

@implementation CustomCollectionViewCell

-(void)setPerson:(Person *)person
{
    [self.firstNameLabel setText:person.firstname];
    [self.lastNameLabel setText:person.lastname];
    [CacheImageManager getImageFromUrlPath:[person.url absoluteString] withCompletion:^(UIImage *image) {
        [self.photoImageView setImage:image];
    }];
}

@end
