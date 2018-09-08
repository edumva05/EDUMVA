//
//  webViewViewController.m
//  login
//
//  Created by EDUMVA2 on 01/08/18.
//  Copyright © 2018 EDUMVA1. All rights reserved.
//

#import "webViewViewController.h"
#import "ViewControllerFTP.h"


@interface webViewViewController ()

@end

@implementation webViewViewController


-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.lblHead setText:_lbltxt];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urla]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender
{
    
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"IdeaViewController"] animated:YES completion:nil];
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]]];
    
    ViewControllerFTP *dest = [self.storyboard instantiateViewControllerWithIdentifier:@"IdeaViewController"];
    dest.nexus = _oldUrl;
    
    
    
}


- (IBAction)share:(id)sender {
    NSData *Data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_urla] options:NSDataReadingMappedIfSafe error:NULL];
    NSArray *activityItems = @[Data];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        activityViewControntroller.popoverPresentationController.sourceView = self.SHARE;
        activityViewControntroller.popoverPresentationController.sourceRect = CGRectMake(self.SHARE.bounds.size.width/2, self.SHARE.bounds.size.height/2, 0, 0);
    }
    [self presentViewController:activityViewControntroller animated:true completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]]];
    if ([segue.identifier isEqual:@"comeBack"]) {
        ViewControllerFTP *dest = segue.destinationViewController;
        dest.nexus = _oldUrl;
        
    }
}


-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    
}

-(void) webViewDidStartLoad:(UIWebView *)webView {
    
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [_btmview bringSubviewToFront:_errlabel];
}
@end

