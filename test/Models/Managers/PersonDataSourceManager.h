//
//  PersonDataSourceManager.h
//  test
//
//  Created by François Juteau on 04/09/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^personCompletion)(NSArray *persons);

@interface PersonDataSourceManager : NSObject

+(void)getListOfPersonWithCompletion:(personCompletion)compblock;

@end
