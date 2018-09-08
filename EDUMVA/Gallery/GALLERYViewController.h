//
//  GALLERYViewController.h
//  gallery
//
//  Created by EDUMVA3 on 03/09/18.
//  Copyright © 2018 EDUMVA3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GALLERYViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *gtopView;
//@property (weak, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) NSString *gurla;
//@property (strong, nonatomic) NSString *urla;
@property (weak, nonatomic) IBOutlet UIButton *GSHARE;
//@property (weak, nonatomic) IBOutlet UIButton *SHARE;
@property (weak, nonatomic) IBOutlet UILabel *gerrlabel;
//@property (weak, nonatomic) IBOutlet UILabel *errlabel;
- (IBAction)gshare:(id)sender;
//- (IBAction)share:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *gbtmview;
//@property (weak, nonatomic) IBOutlet UIView *btmview;
@property (weak, nonatomic) IBOutlet UIWebView *gwebView;
//@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *glblHead;
//@property (weak, nonatomic) IBOutlet UILabel *lblHead;
@property (weak, nonatomic) NSString *glbltxt;
//@property (weak, nonatomic) NSString *lbltxt;
@property (weak, nonatomic) NSString *goldUrl;
//@property (weak, nonatomic) NSString *oldUrl;
@property (weak, nonatomic) IBOutlet UIButton *gBack;
//@property (weak, nonatomic) IBOutlet UIButton *Back;
- (IBAction)gback:(id)sender;

@end

