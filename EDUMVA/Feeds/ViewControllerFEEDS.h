//
//  ViewControllerGALLERY.h
//  login
//
//  Created by EDUMVA3 on 02/09/18.
//  Copyright © 2018 EDUMVA3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerFEEDS : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UIWebViewDelegate, NSURLConnectionDelegate, UIScrollViewDelegate>

//@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *feedscollectionView;
- (IBAction)fback:(id)sender;
//- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *gbtn;
//@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIView *fbottomView;
//@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *flblhead;
//@property (weak, nonatomic) IBOutlet UILabel *lblhead;
- (IBAction)fshare:(id)sender;
//- (IBAction)share:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *FSHARE;
//@property (weak, nonatomic) IBOutlet UIButton *SHARE;
@property (strong, nonatomic) NSString *gurl;
//@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *gnexus;
//@property (strong, nonatomic) NSString *nexus;
@property (weak, nonatomic) IBOutlet UIButton *ghome;
//@property (weak, nonatomic) IBOutlet UIButton *home;
@property (weak, nonatomic) IBOutlet UIWebView *fwebView;
//@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *flblon;
//@property (weak, nonatomic) IBOutlet UILabel *lblon;
@property (weak, nonatomic) IBOutlet UIButton *gbtn2;
//@property (weak, nonatomic) IBOutlet UIButton *btn2;
- (IBAction)greBack:(id)sender;
//- (IBAction)reBack:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *factivityIndicator;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *fload;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;



@end

