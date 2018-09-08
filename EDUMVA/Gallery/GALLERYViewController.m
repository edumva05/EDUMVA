//
//  GALLERYViewController.m
//  gallery
//
//  Created by EDUMVA3 on 03/09/18.
//  Copyright © 2018 EDUMVA3. All rights reserved.
//

#import "GALLERYViewController.h"
#import "ViewControllerGALLERY.h"



@interface GALLERYViewController ()

@end

@implementation GALLERYViewController
-(BOOL)prefersStatusBarHidden{
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.glblHead setText:_glbltxt];
    [_gwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_gurla]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender
{
    
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerGALLERY"] animated:YES completion:nil];
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [_gwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]]];
    
    ViewControllerGALLERY *dest = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerGALLERY"];
    dest.gnexus = _goldUrl;
    
    
    
}


- (IBAction)gshare:(id)sender {
    NSData *Data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_gurla] options:NSDataReadingMappedIfSafe error:NULL];
    NSArray *activityItems = @[Data];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        activityViewControntroller.popoverPresentationController.sourceView = self.GSHARE;
        activityViewControntroller.popoverPresentationController.sourceRect = CGRectMake(self.GSHARE.bounds.size.width/2, self.GSHARE.bounds.size.height/2, 0, 0);
    }
    [self presentViewController:activityViewControntroller animated:true completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [_gwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]]];
    if ([segue.identifier isEqual:@"comeBack"]) {
        ViewControllerGALLERY *dest = segue.destinationViewController;
        dest.gnexus = _goldUrl;
        
    }
}


-(void) webViewDidFinishLoad:(UIWebView *)gwebView
{
    
}

-(void) webViewDidStartLoad:(UIWebView *)gwebView {
    
}

-(void) webView:(UIWebView *)gwebView didFailLoadWithError:(NSError *)error{
    [_gbtmview bringSubviewToFront:_gerrlabel];
}
- (IBAction)gback:(id)sender {
}
@end
