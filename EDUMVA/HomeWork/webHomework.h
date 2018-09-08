//
//  webHomework.h
//  homework
//
//  Created by EDUMVA1 on 04/09/18.
//  Copyright © 2018 EDUMVA1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webHomework : UIViewController
<UIWebViewDelegate>


@property (weak, nonatomic) IBOutlet UIView *topViewH;
@property (strong, nonatomic) NSString *urlaH;
@property (weak, nonatomic) IBOutlet UILabel *errlabelH;
@property (weak, nonatomic) IBOutlet UIView *btmviewH;
@property (weak, nonatomic) IBOutlet UIWebView *webViewH;
@property (weak, nonatomic) IBOutlet UILabel *lblHeadH;
@property (weak, nonatomic) NSString *lbltxtH;
@property (weak, nonatomic) NSString *oldUrlH;

@property (weak, nonatomic) IBOutlet UIButton *BackH;

@end
