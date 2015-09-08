//
//  Person.m
//  test
//
//  Created by François Juteau on 21/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName
                      andLastName:(NSString *)lastName
                          fromUrl:(NSURL *)url
{
    if (self = [super init])
    {
        _firstname = firstName;
        _lastname = lastName;
        _url = url;
    }
    return self;
}

@end
