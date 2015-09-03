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
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:@"http://www.mac4ever.com/actu"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
    [self.webView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - WebView delegate methods

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
