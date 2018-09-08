//
//  ViewControllerGALLERY.h
//  login
//
//  Created by EDUMVA3 on 02/09/18.
//  Copyright © 2018 EDUMVA3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerGALLERY : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UIWebViewDelegate, NSURLConnectionDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *gallerycollectionView;
//@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)gback:(id)sender;
//- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *gbtn;
//@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIView *gbottomView;
//@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *glblhead;
//@property (weak, nonatomic) IBOutlet UILabel *lblhead;
- (IBAction)gshare:(id)sender;
//- (IBAction)share:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *GSHARE;
//@property (weak, nonatomic) IBOutlet UIButton *SHARE;
@property (strong, nonatomic) NSString *gurl;
//@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *gnexus;
//@property (strong, nonatomic) NSString *nexus;
@property (weak, nonatomic) IBOutlet UIButton *ghome;
//@property (weak, nonatomic) IBOutlet UIButton *home;
@property (weak, nonatomic) IBOutlet UIWebView *gwebView;
//@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *glblon;
//@property (weak, nonatomic) IBOutlet UILabel *lblon;
@property (weak, nonatomic) IBOutlet UIButton *gbtn2;
//@property (weak, nonatomic) IBOutlet UIButton *btn2;
- (IBAction)greBack:(id)sender;
//- (IBAction)reBack:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *gactivityIndicator;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *gload;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;



@end

