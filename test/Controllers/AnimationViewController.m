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

@property (nonatomic, assign) BOOL startPointAnimation;

@end

@implementation AnimationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.startPointAnimation = YES;
    [self setStartingPoint:CGRectMake(20, 20, 50, 50)];
    [self setLandingPoint:CGRectMake(200, 400, 50, 50)];
    
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
        CGRect rectToUse = self.startPointAnimation ? self.startingPoint : self.landingPoint;
        CGPoint newPosition = CGPointMake(CGRectGetMidX(rectToUse), CGRectGetMidY(rectToUse));
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        basicAnimation.fromValue = [NSValue valueWithCGPoint:self.animatedView.layer.position];
        basicAnimation.toValue = [NSValue valueWithCGPoint:newPosition];
        basicAnimation.duration = 3.f;
        self.animatedView.layer.position = newPosition;
        [self.animatedView.layer addAnimation:basicAnimation forKey:@"Animated View Animation"];
    }
    self.startPointAnimation = !self.startPointAnimation;
}


@end