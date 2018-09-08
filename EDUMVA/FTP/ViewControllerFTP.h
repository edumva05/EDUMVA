//
//  ViewControllerFTP.h
//  login
//
//  Created by EDUMVA2 on 01/08/18.
//  Copyright © 2018 EDUMVA1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerFTP : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UIWebViewDelegate, NSURLConnectionDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *lblhead;
- (IBAction)share:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *SHARE;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *nexus;
@property (weak, nonatomic) IBOutlet UIButton *home;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *lblon;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
- (IBAction)reBack:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;



@end
