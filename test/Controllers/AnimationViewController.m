//
//  AnimationViewController.m
//  test
//
//  Created by François Juteau on 26/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import "AnimationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AnimationViewController ()

@property (strong, nonatomic) UIView *animatedView;

@property (nonatomic) CGRect startingPoint;
@property (nonatomic) CGRect landingPoint;

@property (weak, nonatomic) IBOutlet UISwitch *animationTypeSwitch;

@end

@implementation AnimationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setStartingPoint:CGRectMake(-200, -200, 200, 200)];
    [self setLandingPoint:CGRectMake(100, 200, 200, 200)];
    
    self.animatedView = [[UIView alloc] init];
    [self.animatedView setFrame:self.startingPoint];
    [self.animatedView setBackgroundColor:[UIColor greenColor]];
    
    [self.view addSubview:self.animatedView];
}

#pragma mark - Outlet handlers

- (IBAction)handleAnimate:(id)sender
{
    if (self.animationTypeSwitch.on) // UIView block based api
    {
        [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:0 animations:^{
            if (CGRectEqualToRect(self.animatedView.frame,self.startingPoint))
            {
                [self.animatedView setFrame:self.landingPoint];
            }
            else
            {
                [self.animatedView setFrame:self.startingPoint];
            }
        } completion:^(BOOL finished) {
            NSLog(@"OK");
        }];
    }
    else // Not implemented yet : CAAnimation
    {
        
    }
    
}


@end