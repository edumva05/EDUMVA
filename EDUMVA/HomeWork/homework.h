//
//  homework.h
//  homework
//
//  Created by EDUMVA1 on 04/09/18.
//  Copyright © 2018 EDUMVA1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homework : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UIWebViewDelegate, NSURLConnectionDelegate, UIScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *collection;
- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnH;
@property (weak, nonatomic) IBOutlet UIView *bottomViewH;
@property (weak, nonatomic) IBOutlet UILabel *lblheadH;






@property (strong, nonatomic) NSString *urlH;
@property (strong, nonatomic) NSString *nexusH;

@property (weak, nonatomic) IBOutlet UIWebView *webViewH;
@property (weak, nonatomic) IBOutlet UILabel *lblonH;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorH;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadH;



@property (weak, nonatomic) IBOutlet UIButton *btn2H;
- (IBAction)reBack:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *homeH;


@end

