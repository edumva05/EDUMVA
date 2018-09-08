//
//  homework.m
//  homework
//
//  Created by EDUMVA1 on 04/09/18.
//  Copyright © 2018 EDUMVA1. All rights reserved.
//

#import "homework.h"
#import "webHomework.h"
@interface homework ()

{
    NSArray *arrayH;
    NSString *topassH;
}

@end

@implementation homework

@synthesize bottomViewH;

- (void)viewDidLoad {
    _webViewH.delegate = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _urlH=@"";
    if (_nexusH) {
        [self nextUrl:_nexusH];
    } else {
        [self nextUrl:@"ftp://192.168.1.188/h_work/"];
    }
    
    _webViewH.alpha = 0;
    //  NSLog();
    _btn2H.alpha = 0;
    
}
NSString *llaH ;
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
    lbl.text=[[arrayH objectAtIndex:indexPath.row] substringFromIndex:59];
    UIImageView *img = (UIImageView *)[cell viewWithTag:2];
    if ([[arrayH objectAtIndex:indexPath.row] hasPrefix:@"-"]) {
        llaH = [arrayH objectAtIndex:indexPath.row];
        llaH = [llaH pathExtension];
        if ([llaH hasPrefix:@"pdf"]) {
            img.image = [UIImage imageNamed:@"pdf.png"];
        } else if ([llaH hasPrefix:@"doc"]||[llaH hasPrefix:@"pages"]) {
            img.image = [UIImage imageNamed:@"Document.png"];
        } else if ([llaH hasPrefix:@"JPG"]||[llaH hasPrefix:@"PNG"]||[llaH hasPrefix:@"png"]||[llaH hasPrefix:@"jpeg"]||[llaH hasPrefix:@"jpg"]) {
            img.image = [UIImage imageNamed:@"img.png"];
        } else if ([llaH hasPrefix:@"DS_Store"]||[llaH hasPrefix:@"db"]) {
            img.image = [UIImage imageNamed:@"db.png"];
        } else if ([llaH hasPrefix:@"xls"]||[llaH hasPrefix:@"numbers"]) {
            img.image = [UIImage imageNamed:@"xlsx.png"];
        } else if ([llaH hasPrefix:@"ppt"]||[llaH hasPrefix:@"pptx"]||[llaH hasPrefix:@"keynote"]) {
            img.image = [UIImage imageNamed:@"ppt.png"];
        } else if ([llaH hasPrefix:@"cer"]) {
            img.image = [UIImage imageNamed:@"cer.png"];
        } else if ([llaH hasPrefix:@"txt"]) {
            img.image = [UIImage imageNamed:@"txt.png"];
        } else if ([llaH hasPrefix:@"mp4"]||[llaH hasPrefix:@"m4v"]||[llaH hasPrefix:@"mkv"]) {
            img.image = [UIImage imageNamed:@"video.png"];
        } else if ([llaH hasPrefix:@"zip"]||[llaH hasPrefix:@"rar"]) {
            img.image = [UIImage imageNamed:@"zip.png"];
        } else if ([llaH hasPrefix:@"ibooks"]||[llaH hasPrefix:@"epub"]) {
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
    return  arrayH.count-1;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *next = [[arrayH objectAtIndex:indexPath.row] substringFromIndex:59];
    if ([[arrayH objectAtIndex:indexPath.row] hasPrefix:@"-"]) {
        topassH = next;
        
        [self nextFile:next];
        
    } else {
        [self nextUrl:next];
        
    }
}


-(void)nextUrl :(NSString *)str {
    if ([str  isEqual: @"ftp://192.168.1.188/h_work/"]) {
        [self.lblheadH setText:@"HOMEWORK"];
    } else {
        if ([str hasPrefix:@"ftp://"]) {
            NSArray *newUrlArray = [str componentsSeparatedByString:@"/"];
            [self.lblheadH setText:[[newUrlArray objectAtIndex:[newUrlArray count]-2] stringByReplacingOccurrencesOfString:@"%20" withString:@" "]];
        } else {
            [self.lblheadH setText:str];
        }
    }
    NSString *lastChar = [str substringFromIndex:[str length] - 2];
    NSString * firstLetter = [lastChar substringWithRange:[lastChar rangeOfComposedCharacterSequenceAtIndex:0]];
    str = [str stringByReplacingOccurrencesOfString:lastChar withString:[firstLetter stringByAppendingString:@"/"]];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    _urlH = [_urlH stringByAppendingString:str];
    NSURL *ftp = [NSURL URLWithString:_urlH];
    NSData *data = [NSData dataWithContentsOfURL:ftp];
    NSData *dataEmp = [NSData data];
    if (![data isEqualToData:dataEmp]) {
        NSString *html = [NSString stringWithUTF8String:[data bytes]];
        arrayH = [html componentsSeparatedByString:@"\n"];
        [self.collection reloadData];
    } else {
        arrayH = [NSArray arrayWithObjects:@"", nil];
        [self.collection reloadData];
    }
    
    if ([_urlH isEqual:@"ftp://192.168.1.188/h_work/"]) {
        [self.btnH setEnabled:NO];
        self.btnH.alpha = 0;
    } else {
        [self.btnH setEnabled:YES];
        self.btnH.alpha = 1;
    }
    NSString *NSFtp = [NSString stringWithFormat:@"%@", ftp];
    _lblonH.text = NSFtp;
}

-(void)nextFile :(NSString *)str {
    
    
    
    
    NSString *lastChar = [str substringFromIndex:[str length] - 2];
    NSString * firstLetter = [lastChar substringWithRange:[lastChar rangeOfComposedCharacterSequenceAtIndex:0]];
    str = [str stringByReplacingOccurrencesOfString:lastChar withString:firstLetter];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *myURL = [NSString stringWithFormat:@"%@%@", _urlH,str];
    if ([myURL isEqual:@"ftp://192.168.1.188/h_work/"]) {
        [self.btnH setEnabled:NO];
        self.btnH.alpha = 0;
    } else {
        [self.btnH setEnabled:YES];
        self.btnH.alpha = 1;
    }
    // [self performSegueWithIdentifier:@"go" sender:[_url stringByAppendingString:str]];
    _webViewH.alpha = 1;
    [_webViewH loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: myURL]]];
    
    // NSString *NSFtp = [NSString stringWithFormat:@"%@%@",_lblon.text,str];
    //_lblon.text = NSFtp;
    //   [self webViewDidStartLoad:_webView];
    
}

-(IBAction)back:(id)sender{
    if([_lblonH.text isEqual:@"ftp://192.168.1.188/h_work/"]){
        _btnH.alpha = 0;
        _btn2H.alpha = 0;
        
    }
    if (_webViewH.alpha == 1) {
        [_webViewH loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: @""]]];
        _webViewH.alpha = 0;
        
        _btn2H.alpha = 0;
    }
    else{
        NSArray *newUrlArray = [_urlH componentsSeparatedByString:@"/"];
        _urlH = @"";
        NSString *new = @"";
        for (int i = 0; i<newUrlArray.count-2; i++) {
            new = [new stringByAppendingString:newUrlArray[i]];
            new = [new stringByAppendingString:@"/"];
        }
        
        [self nextUrl:new];
        _lblonH.text = new;
    }
    
}


- (IBAction)share:(id)sender {
    NSData *Data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_urlH] options:NSDataReadingMappedIfSafe error:NULL];
    NSArray *activityItems = @[Data];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
   
    
    [self presentViewController:activityViewControntroller animated:true completion:nil];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"go"]) {
        webHomework *dest = segue.destinationViewController;
        dest.urlaH = sender;
        dest.oldUrlH = _urlH;
        dest.lbltxtH = topassH;
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    
    self.loadH.alpha = 1.0;
    [self.loadH startAnimating];
    
    
    if ([llaH hasPrefix:@"mp4"]||[llaH hasPrefix:@"m4v"]||[llaH hasPrefix:@"mkv"]) {
        [self webViewDidStopLoad:_webViewH];}
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.loadH stopAnimating];
    self.loadH.hidesWhenStopped = YES;
}


- (void)webViewDidStopLoad:(UIWebView *)webView{
    [self.loadH stopAnimating];
    self.loadH.hidesWhenStopped = YES;
}

- (IBAction)reBack:(id)sender {
    
}

@end
