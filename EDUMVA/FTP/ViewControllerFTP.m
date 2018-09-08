//
//  ViewControllerFTP.m
//  login
//
//  Created by EDUMVA2 on 01/08/18.
//  Copyright © 2018 EDUMVA1. All rights reserved.
//

#import "ViewControllerFTP.h"

#import "webViewViewController.h"



@interface ViewControllerFTP ()
{
    NSArray *array;
    NSString *topass;
}
@end

@implementation ViewControllerFTP
@synthesize bottomView;

- (void)viewDidLoad {
    _webView.delegate = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _url=@"";
    if (_nexus) {
        [self nextUrl:_nexus];
    } else {
        [self nextUrl:@"ftp://192.168.1.8/"];
    }
    
    _webView.alpha = 0;
    //  NSLog();
    _btn2.alpha = 0;
    
}
NSString *lla ;
-(BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *lbl = (UILabel *)[cell viewWithTag:1];
    lbl.text=[[array objectAtIndex:indexPath.row] substringFromIndex:59];
    UIImageView *img = (UIImageView *)[cell viewWithTag:2];
    if ([[array objectAtIndex:indexPath.row] hasPrefix:@"-"]) {
        lla = [array objectAtIndex:indexPath.row];
        lla = [lla pathExtension];
        if ([lla hasPrefix:@"pdf"]) {
            img.image = [UIImage imageNamed:@"pdf.png"];
        } else if ([lla hasPrefix:@"doc"]||[lla hasPrefix:@"pages"]) {
            img.image = [UIImage imageNamed:@"Document.png"];
        } else if ([lla hasPrefix:@"JPG"]||[lla hasPrefix:@"PNG"]||[lla hasPrefix:@"png"]||[lla hasPrefix:@"jpeg"]||[lla hasPrefix:@"jpg"]) {
            img.image = [UIImage imageNamed:@"img.png"];
        } else if ([lla hasPrefix:@"DS_Store"]||[lla hasPrefix:@"db"]) {
            img.image = [UIImage imageNamed:@"db.png"];
        } else if ([lla hasPrefix:@"xls"]||[lla hasPrefix:@"numbers"]) {
            img.image = [UIImage imageNamed:@"xlsx.png"];
        } else if ([lla hasPrefix:@"ppt"]||[lla hasPrefix:@"pptx"]||[lla hasPrefix:@"keynote"]) {
            img.image = [UIImage imageNamed:@"ppt.png"];
        } else if ([lla hasPrefix:@"cer"]) {
            img.image = [UIImage imageNamed:@"cer.png"];
        } else if ([lla hasPrefix:@"txt"]) {
            img.image = [UIImage imageNamed:@"txt.png"];
        } else if ([lla hasPrefix:@"mp4"]||[lla hasPrefix:@"m4v"]||[lla hasPrefix:@"mkv"]) {
            img.image = [UIImage imageNamed:@"video.png"];
        } else if ([lla hasPrefix:@"zip"]||[lla hasPrefix:@"rar"]) {
            img.image = [UIImage imageNamed:@"zip.png"];
        } else if ([lla hasPrefix:@"ibooks"]||[lla hasPrefix:@"epub"]) {
            img.image = [UIImage imageNamed:@"epub.png"];
        } else {
            img.image = [UIImage imageNamed:@"file.png"];
        }
    } else {
        img.image = [UIImage imageNamed:@"folder.png"];
    }
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  array.count-1;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *next = [[array objectAtIndex:indexPath.row] substringFromIndex:59];
    if ([[array objectAtIndex:indexPath.row] hasPrefix:@"-"]) {
        topass = next;
        
        [self nextFile:next];
        
    } else {
        [self nextUrl:next];
        
    }
}


-(void)nextUrl :(NSString *)str {
    if ([str  isEqual: @"ftp://192.168.1.8/"]) {
        [self.lblhead setText:@"FTP"];
    } else {
        if ([str hasPrefix:@"ftp://"]) {
            NSArray *newUrlArray = [str componentsSeparatedByString:@"/"];
            [self.lblhead setText:[[newUrlArray objectAtIndex:[newUrlArray count]-2] stringByReplacingOccurrencesOfString:@"%20" withString:@" "]];
        } else {
            [self.lblhead setText:str];
        }
    }
    NSString *lastChar = [str substringFromIndex:[str length] - 2];
    NSString * firstLetter = [lastChar substringWithRange:[lastChar rangeOfComposedCharacterSequenceAtIndex:0]];
    str = [str stringByReplacingOccurrencesOfString:lastChar withString:[firstLetter stringByAppendingString:@"/"]];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    _url = [_url stringByAppendingString:str];
    NSURL *ftp = [NSURL URLWithString:_url];
    NSData *data = [NSData dataWithContentsOfURL:ftp];
    NSData *dataEmp = [NSData data];
    if (![data isEqualToData:dataEmp]) {
        NSString *html = [NSString stringWithUTF8String:[data bytes]];
        array = [html componentsSeparatedByString:@"\n"];
        [self.collectionView reloadData];
    } else {
        array = [NSArray arrayWithObjects:@"", nil];
        [self.collectionView reloadData];
    }
    
    if ([_url isEqual:@"ftp://192.168.1.8/"]) {
        [self.btn setEnabled:NO];
        self.btn.alpha = 0;
    } else {
        [self.btn setEnabled:YES];
        self.btn.alpha = 1;
    }
    NSString *NSFtp = [NSString stringWithFormat:@"%@", ftp];
    _lblon.text = NSFtp;
}

-(void)nextFile :(NSString *)str {
    
    
    
    
    NSString *lastChar = [str substringFromIndex:[str length] - 2];
    NSString * firstLetter = [lastChar substringWithRange:[lastChar rangeOfComposedCharacterSequenceAtIndex:0]];
    str = [str stringByReplacingOccurrencesOfString:lastChar withString:firstLetter];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *myURL = [NSString stringWithFormat:@"%@%@", _url,str];
    if ([myURL isEqual:@"ftp://192.168.1.8/"]) {
        [self.btn setEnabled:NO];
        self.btn.alpha = 0;
    } else {
        [self.btn setEnabled:YES];
        self.btn.alpha = 1;
    }
    // [self performSegueWithIdentifier:@"go" sender:[_url stringByAppendingString:str]];
    _webView.alpha = 1;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: myURL]]];
    
    // NSString *NSFtp = [NSString stringWithFormat:@"%@%@",_lblon.text,str];
    //_lblon.text = NSFtp;
    //   [self webViewDidStartLoad:_webView];
    
}

-(IBAction)back:(id)sender{
    if([_lblon.text isEqual:@"ftp://192.168.1.8/"]){
        _btn.alpha = 0;
        _btn2.alpha = 0;
        
    }
    if (_webView.alpha == 1) {
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: @""]]];
        _webView.alpha = 0;
        
        _btn2.alpha = 0;
    }
    else{
        NSArray *newUrlArray = [_url componentsSeparatedByString:@"/"];
        _url = @"";
        NSString *new = @"";
        for (int i = 0; i<newUrlArray.count-2; i++) {
            new = [new stringByAppendingString:newUrlArray[i]];
            new = [new stringByAppendingString:@"/"];
        }
        
        [self nextUrl:new];
        _lblon.text = new;
    }
    
}


- (IBAction)share:(id)sender {
    NSData *Data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_url] options:NSDataReadingMappedIfSafe error:NULL];
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
    if ([segue.identifier isEqual:@"go"]) {
        webViewViewController *dest = segue.destinationViewController;
        dest.urla = sender;
        dest.oldUrl = _url;
        dest.lbltxt = topass;
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    
    self.load.alpha = 1.0;
    [self.load startAnimating];
    
    
    if ([lla hasPrefix:@"mp4"]||[lla hasPrefix:@"m4v"]||[lla hasPrefix:@"mkv"]) {
        [self webViewDidStopLoad:_webView];}
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.load stopAnimating];
    self.load.hidesWhenStopped = YES;
}


- (void)webViewDidStopLoad:(UIWebView *)webView{
    [self.load stopAnimating];
    self.load.hidesWhenStopped = YES;
}

- (IBAction)reBack:(id)sender {
    
}
@end

