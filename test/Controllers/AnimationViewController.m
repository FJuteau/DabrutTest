//
//  AnimationViewController.m
//  test
//
//  Created by François Juteau on 26/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property (strong, nonatomic) UIView *animatedView;

@property (nonatomic) CGRect startingPoint;
@property (nonatomic) CGRect landingPoint;

@end

@implementation AnimationViewController

-(void)viewDidLoad
{
    [self setStartingPoint:CGRectMake(-200, -200, 200, 200)];
    [self setLandingPoint:CGRectMake(100, 200, 200, 200)];
    
    self.animatedView = [[UIView alloc] init];
    [self.animatedView setFrame:self.startingPoint];
    [self.animatedView setBackgroundColor:[UIColor greenColor]];
    
    [self.view addSubview:_animatedView];
}

#pragma mark - Outlet handlers

- (IBAction)handleAnimate:(id)sender
{
    [UIView animateWithDuration:3.0 animations:^
    {
        if (CGRectEqualToRect(self.animatedView.frame,self.startingPoint))
        {
            [self.animatedView setFrame:self.landingPoint];
        }
        else
        {
            [self.animatedView setFrame:self.startingPoint];
        }
    }];
}


@end