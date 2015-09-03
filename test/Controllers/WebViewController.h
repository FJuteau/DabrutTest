//
//  WebViewController.h
//  test
//
//  Created by François Juteau on 26/08/2015.
//  Copyright (c) 2015 FJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
