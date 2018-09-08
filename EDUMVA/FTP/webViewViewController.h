//
//  webViewViewController.h
//  login
//
//  Created by EDUMVA2 on 01/08/18.
//  Copyright © 2018 EDUMVA1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewViewController : UIViewController
<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) NSString *urla;
@property (weak, nonatomic) IBOutlet UIButton *SHARE;
@property (weak, nonatomic) IBOutlet UILabel *errlabel;
- (IBAction)share:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *btmview;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *lblHead;
@property (weak, nonatomic) NSString *lbltxt;
@property (weak, nonatomic) NSString *oldUrl;
@property (weak, nonatomic) IBOutlet UIButton *Back;

@end
