//
//  CustomCollectionViewController.m
//  test
//
//  Created by François Juteau on 03/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import "CustomCollectionViewController.h"
#import "CustomCollectionViewCell.h"
#import "PersonDataSourceManager.h"

@interface CustomCollectionViewController ()

@property (nonatomic,strong) NSArray *items;

@end

@implementation CustomCollectionViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    [PersonDataSourceManager getListOfPersonWithCompletion:^(NSArray *persons) {
        self.items = persons;
        [self.collectionView reloadData];
    }];
    
}

#pragma mark - Data source methods

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"personCell";
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell setPerson:[self.items objectAtIndex:indexPath.row]];
    
    return cell;
}



@end
