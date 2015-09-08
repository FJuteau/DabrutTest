//
//  Person.h
//  test
//
//  Created by François Juteau on 21/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstname;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSURL *url;


-(instancetype)initWithFirstName:(NSString *)_firstName
                     andLastName:(NSString *)_lastName
                         fromUrl:(NSURL *)url;


@end

