//
//  Person.m
//  test
//
//  Created by François Juteau on 21/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import "Person.h"

@implementation Person

-(Person *)initPersonWithFirstName:(NSString *)_firstName
                      andLastName:(NSString *)_lastName
{
    self.firstname = _firstName;
    self.lastname = _lastName;
    return self;
}

-(void)setImageFromUrl:(NSString *)_url
{
    NSURL *imageUrl = [NSURL URLWithString:_url];
    NSData *data = [NSData dataWithContentsOfURL:imageUrl];
    
    if (data) // datas are OK
    {
        UIImage *image = [UIImage imageWithData:data];
        [self setPhoto:image];
    }
}
@end
