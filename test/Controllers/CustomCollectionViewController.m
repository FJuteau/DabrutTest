//
//  CustomCollectionViewController.m
//  test
//
//  Created by François Juteau on 03/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import "CustomCollectionViewController.h"
#import "CustomCollectionViewCell.h"
#import "Person.h"

@interface CustomCollectionViewController ()

@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation CustomCollectionViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    self.items = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:@"http://mqmq.free.fr/test.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if (data) // existing data
    {
        NSError *error;
        NSArray *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if(error)
        {
            NSLog(@"error : %@", error.description);
        }
        else // serialization complete
        {
            NSInteger i = 0;
            
            for (NSDictionary *entry in jsonData)
            {
                // add a person with every attribute on the json file
                [self.items addObject:[[Person alloc] initPersonWithFirstName:[entry objectForKey:@"firstname"]
                                                                  andLastName:[entry objectForKey:@"lastname"]]];
                
                dispatch_queue_t netQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
                
                dispatch_async(netQ,^
                               {
                                   // Code à executer en async.
                                   [[self.items objectAtIndex:i] setImageFromUrl:[entry objectForKey:@"photo"]];
                                   
                                   // CallBack dans la MainQueue
                                   dispatch_async(dispatch_get_main_queue(),^
                                                  {
                                                      [self.collectionView reloadData];
                                                  });
                                   
                               });
                i++;
            }
        }
    }
    
}

#pragma mark - Data source methods

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _items.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"personCell";
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[CustomCollectionViewCell alloc] init];
    }
    
    [[cell firstName] setText:[self.items[indexPath.row] firstname]];
    [[cell lastName] setText:[self.items[indexPath.row] lastname]];
    UIImage *image = [self.items[indexPath.row] photo];
    
    if (image)
    {
        [[cell photoImageView] setImage:image];
    }
    
    return cell;
}



@end
