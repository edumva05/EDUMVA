//
//  webHomework.m
//  homework
//
//  Created by EDUMVA1 on 04/09/18.
//  Copyright © 2018 EDUMVA1. All rights reserved.
//

#import "webHomework.h"
#import "homework.h"

@interface webHomework ()

@end

@implementation webHomework
-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.lblHeadH setText:_lbltxtH];
    [_webViewH loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlaH]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender
{
    
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"HWViewController"] animated:YES completion:nil];
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [_webViewH loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]]];
    
   homework *dest = [self.storyboard instantiateViewControllerWithIdentifier:@"HWViewController"];
    dest.nexusH = _oldUrlH;
    
    
    
}


- (IBAction)share:(id)sender {
    NSData *Data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_urlaH] options:NSDataReadingMappedIfSafe error:NULL];
    NSArray *activityItems = @[Data];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    [self presentViewController:activityViewControntroller animated:true completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [_webViewH loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]]];
    if ([segue.identifier isEqual:@"comeBack"]) {
      homework *dest = segue.destinationViewController;
        dest.nexusH = _oldUrlH;
        
    }
}


-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    
}

-(void) webViewDidStartLoad:(UIWebView *)webView {
    
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [_btmviewH bringSubviewToFront:_errlabelH];
}
@end


