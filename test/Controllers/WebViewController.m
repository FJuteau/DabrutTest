//
//  WebViewController.m
//  test
//
//  Created by François Juteau on 26/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://www.mac4ever.com/actu"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
    [self.view bringSubviewToFront:self.spinner];
}

#pragma mark - WebView delegate methods

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    if (!self.spinner.isAnimating)
    {
        [self.spinner startAnimating];
    }
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (self.spinner.isAnimating)
    {
        [self.spinner stopAnimating];
    }
}

@end
