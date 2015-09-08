//
//  PersonDataSourceManager.m
//  test
//
//  Created by François Juteau on 04/09/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import "PersonDataSourceManager.h"
#import "NetworkManager.h"
#import "Person.h"

@implementation PersonDataSourceManager

+(void)getListOfPersonWithCompletion:(personCompletion)compblock
{
    NSURL *url = [NSURL URLWithString:@"http://mqmq.free.fr/test.json"];
    [NetworkManager getDataFromUrl:url
                    withCompletion:^(NSData *data) {
                        if (data) // existing data
                        {
                            NSMutableArray *tmpMutablePersons = [[NSMutableArray alloc] init];
                            NSError *error;
                            NSArray *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                            
                            if(error)
                            {
                                NSLog(@"error : %@", error.description);
                            }
                            else // serialization complete
                            {
                                Person *tmpPerson;
                                for (NSDictionary *entry in jsonData)
                                {
                                    NSLog(@"JSON PARSING");
                                    // add a person with every attribute on the json file
                                    tmpPerson = [[Person alloc] initWithFirstName:[entry objectForKey:@"firstname"]
                                                                      andLastName:[entry objectForKey:@"lastname"]
                                                                          fromUrl:[NSURL URLWithString:[entry objectForKey:@"photo"]]];
                                    [tmpMutablePersons addObject:tmpPerson];
                                }
                            }
                            compblock([tmpMutablePersons copy]); // returns a non mutable copy of a person array
                        }
                        else
                        {
                            NSLog(@"PERSON : NO DATA");
                        }
                    }];
}

@end
