//
//  ViewControllerGALLERY.m
//  gallery
//
//  Created by EDUMVA3 on 03/09/18.
//  Copyright © 2018 EDUMVA3. All rights reserved.
//

#import "ViewControllerGALLERY.h"
#import "GALLERYViewController.h"

@interface ViewControllerGALLERY ()
{
    NSArray *array;
    NSString *topass;
    
}
@end

@implementation ViewControllerGALLERY
@synthesize gbottomView;



NSString *myURL;





- (void)viewDidLoad {
    [super viewDidLoad];
    _gwebView.delegate = self;
    
    // Do any additional setup after loading the view, typically from a nib.
    _gurl=@"";
    if (_gnexus) {
        [self nextUrl:_gnexus];
    } else {
        [self nextUrl:@"ftp://192.168.1.188/g_gallery/"];
        [self getPath:myURL];
    }
    
    _gwebView.alpha = 0;
    
    _gbtn2.alpha = 0;
    
}
NSString *gallerylla ;
-(BOOL)prefersStatusBarHidden{
    return YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UICollectionViewCell *gallerycell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gallerycell" forIndexPath:indexPath];
    
    UILabel *lbl = (UILabel *)[gallerycell viewWithTag:1];
    
    
    
    lbl.text=[[array objectAtIndex:indexPath.row] substringFromIndex:59];
    NSString *newString = [ lbl.text stringByReplacingOccurrencesOfString:@"_" withString:@""];
    
    NSString *newString2 = [ newString stringByReplacingOccurrencesOfString:@"1" withString:@""];
    
    NSString *newString3 = [ newString2 stringByReplacingOccurrencesOfString:@"&" withString:@" "];
    lbl.text = newString3;
    //lbl.font.labelFontSize = [fontWithName:lbl size:50.0]];
   
    NSLog(newString);
    NSString *cellLblPath = [[array objectAtIndex:indexPath.row] substringFromIndex:59];
    
    
    
    
    UIImageView *img = (UIImageView *)[gallerycell viewWithTag:2];
    UIView* shadowContainer = (UIImageView *)[gallerycell viewWithTag:3];
    if ([[array objectAtIndex:indexPath.row] hasPrefix:@"-"]) {
        gallerylla = [array objectAtIndex:indexPath.row];
        
        
        gallerylla = [gallerylla pathExtension];
        
        
        if ([gallerylla hasPrefix:@"pdf"]) {
            img.image = [UIImage imageNamed:@"pdf.png"];
        } else if ([gallerylla hasPrefix:@"doc"]||[gallerylla hasPrefix:@"pages"]) {
            img.image = [UIImage imageNamed:@"Document.png"];
        } else if ([gallerylla hasPrefix:@"JPG"]||[gallerylla hasPrefix:@"PNG"]||[gallerylla hasPrefix:@"png"]||[gallerylla hasPrefix:@"jpeg"]||[gallerylla hasPrefix:@"jpg"]) {
            
            
            NSString *get1 = [cellLblPath stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
            NSString *get2 = [get1 stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
            
            int *get3 = [get2 integerValue];
            NSLog(@"%d",get3);
            
            NSString *get5= _glblon.text;
            
            NSString *ftpLocation = [NSString stringWithFormat:@"%@%d.jpg", get5, get3];
            NSLog(@"FTP LOCATION OF IMAGE:%@" , ftpLocation );
            //variable to recieve data
            NSMutableData *responseData;
            
            //loads ftpLocation into url
            NSURL *gurl = [NSURL URLWithString: ftpLocation];
            
            lbl.alpha = 0;
            
            //Connect to ftp
            img.image = [UIImage imageNamed:ftpLocation];
            
            //Inner view with content
            
            [img.layer setCornerRadius:30.0f];
            [img.layer setMasksToBounds:YES];
            
            //Outer view with shadow
            [shadowContainer.layer setCornerRadius:30.0f];
            
            [shadowContainer.layer setMasksToBounds:NO];
            [shadowContainer.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [shadowContainer.layer setShadowOpacity:0.6f];
            [shadowContainer.layer setShadowRadius:6.5f];
            [shadowContainer.layer setShadowOffset: CGSizeMake(1.0f, 2.0f)];
            
            
            
            /*  NSURLRequest *request = [NSURLRequest requestWithURL:url];
             (void) [[NSURLConnection alloc] initWithRequest: request delegate:self];
             */
            
            NSURLRequest *request = [NSURLRequest requestWithURL:gurl];
            
            //download
            [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * r, NSData * d, NSError * e) {
                //save
                UIImage *imge = [[UIImage alloc] initWithData:d];
                
                //display
                img.image = imge;
            }];
            
            
            
        } else if ([gallerylla hasPrefix:@"DS_Store"]||[gallerylla hasPrefix:@"db"]) {
            img.image = [UIImage imageNamed:@"db.png"];
        } else if ([gallerylla hasPrefix:@"xls"]||[gallerylla hasPrefix:@"numbers"]) {
            img.image = [UIImage imageNamed:@"xlsx.png"];
        } else if ([gallerylla hasPrefix:@"ppt"]||[gallerylla hasPrefix:@"pptx"]||[gallerylla hasPrefix:@"keynote"]) {
            img.image = [UIImage imageNamed:@"ppt.png"];
        } else if ([gallerylla hasPrefix:@"cer"]) {
            img.image = [UIImage imageNamed:@"cer.png"];
        } else if ([gallerylla hasPrefix:@"txt"]) {
            img.image = [UIImage imageNamed:@"txt.png"];
        } else if ([gallerylla hasPrefix:@"mp4"]||[gallerylla hasPrefix:@"m4v"]||[gallerylla hasPrefix:@"mkv"]) {
            img.image = [UIImage imageNamed:@"video.png"];
        } else if ([gallerylla hasPrefix:@"zip"]||[gallerylla hasPrefix:@"rar"]) {
            img.image = [UIImage imageNamed:@"zip.png"];
        } else if ([gallerylla hasPrefix:@"ibooks"]||[gallerylla hasPrefix:@"epub"]) {
            img.image = [UIImage imageNamed:@"epub.png"];
        } else {
            img.image = [UIImage imageNamed:@"file.png"];
        }
    } else {
        img.image = [UIImage imageNamed:@"folder.png"];
        
        lbl.alpha = 1;
        
        /*NSString *get1 = [cellLblPath stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
         NSString *get2 = [get1 stringByReplacingOccurrencesOfString:@".jpg" withString:@""];*/
        NSString *nameGet = [[cellLblPath componentsSeparatedByString:@"_"] firstObject];
        NSString *get2= [[cellLblPath componentsSeparatedByString:@"_"] lastObject];
        NSLog(@"get2: %@",get2);
        int *get3 = [get2 integerValue];
        NSLog(@"%d",get3);
        
        NSString *ftpLocation = [NSString stringWithFormat:@"ftp://192.168.1.188/g_gallery/%@_%d/%d.jpg", nameGet, get3, get3];
        
        NSLog(@"%@", ftpLocation);
        //variable to recieve data
        NSMutableData *responseData;
        
        //loads ftpLocation into url
        NSURL *gurl = [NSURL URLWithString: ftpLocation];
        NSLog(@"url: %@", gurl);
        
        
        //Connect to ftp
        img.image = [UIImage imageNamed:ftpLocation];
        img.layer.cornerRadius = 30;
        img.clipsToBounds = YES;
        [shadowContainer.layer setCornerRadius:30.0f];
        
        [shadowContainer.layer setMasksToBounds:NO];
        [shadowContainer.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [shadowContainer.layer setShadowOpacity:0.6f];
        [shadowContainer.layer setShadowRadius:6.5f];
        [shadowContainer.layer setShadowOffset: CGSizeMake(1.0f, 2.0f)];
        
        /*  NSURLRequest *request = [NSURLRequest requestWithURL:url];
         (void) [[NSURLConnection alloc] initWithRequest: request delegate:self];
         */
        
        NSURLRequest *request = [NSURLRequest requestWithURL:gurl];
        
        //download
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * r, NSData * d, NSError * e) {
            //save
            UIImage *imge = [[UIImage alloc] initWithData:d];
            
            //display
            img.image = imge;
        }];
    }
    return gallerycell;
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
    
    if ([str  isEqual: @"ftp://192.168.1.188/g_gallery/"]) {
        [self.glblhead setText:@"FTP"];
    } else {
        if ([str hasPrefix:@"ftp://"]) {
            NSArray *newUrlArray = [str componentsSeparatedByString:@"/"];
            [self.glblhead setText:[[newUrlArray objectAtIndex:[newUrlArray count]-2] stringByReplacingOccurrencesOfString:@"%20" withString:@" "]];
        } else {
            NSString *strOfMyOwn;
            strOfMyOwn = [[str componentsSeparatedByString:@"_"] firstObject];
            [self.glblhead setText:strOfMyOwn];
        }
    }
    NSString *lastChar = [str substringFromIndex:[str length] - 2];
    NSString * firstLetter = [lastChar substringWithRange:[lastChar rangeOfComposedCharacterSequenceAtIndex:0]];
    str = [str stringByReplacingOccurrencesOfString:lastChar withString:[firstLetter stringByAppendingString:@"/"]];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    _gurl = [_gurl stringByAppendingString:str];
    NSURL *ftp = [NSURL URLWithString:_gurl];
    NSData *data = [NSData dataWithContentsOfURL:ftp];
    NSData *dataEmp = [NSData data];
    if (![data isEqualToData:dataEmp]) {
        NSString *html = [NSString stringWithUTF8String:[data bytes]];
        array = [html componentsSeparatedByString:@"\n"];
        [self.gallerycollectionView reloadData];
    } else {
        array = [NSArray arrayWithObjects:@"", nil];
        [self.gallerycollectionView reloadData];
    }
    
    if ([_gurl isEqual:@"ftp://192.168.1.188/g_gallery/"]) {
        [self.gbtn setEnabled:NO];
        self.gbtn.alpha = 0;
    } else {
        [self.gbtn setEnabled:YES];
        self.gbtn.alpha = 1;
    }
    
    NSString *myURL2 = [NSString stringWithFormat:@"%@%@", _gurl,str];
    
    
    NSString *NSFtp = [NSString stringWithFormat:@"%@", ftp];
    _glblon.text = NSFtp;
    
    
}

-(void)nextFile :(NSString *)str {
    
    /*
    
    
    NSString *lastChar = [str substringFromIndex:[str length] - 2];
    NSString * firstLetter = [lastChar substringWithRange:[lastChar rangeOfComposedCharacterSequenceAtIndex:0]];
    str = [str stringByReplacingOccurrencesOfString:lastChar withString:firstLetter];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    myURL = [NSString stringWithFormat:@"%@%@", _gurl,str];
    if ([myURL isEqual:@"ftp://192.168.1.188/g_gallery/"]) {
        [self.gbtn setEnabled:NO];
        self.gbtn.alpha = 0;
    } else {
        [self.gbtn setEnabled:YES];
        self.gbtn.alpha = 1;
    }
    // [self performSegueWithIdentifier:@"go" sender:[_url stringByAppendingString:str]];
    _gwebView.alpha = 1;
    [_gwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: myURL]]];
    
    // NSString *NSFtp = [NSString stringWithFormat:@"%@%@",_lblon.text,str];
    //_lblon.text = NSFtp;
    //   [self webViewDidStartLoad:_webView];
    */
}
-(void)getPath :(NSString *)str{
    NSString *lastChar = [str substringFromIndex:[str length] - 2];
    NSString * firstLetter = [lastChar substringWithRange:[lastChar rangeOfComposedCharacterSequenceAtIndex:0]];
    str = [str stringByReplacingOccurrencesOfString:lastChar withString:firstLetter];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    myURL = [NSString stringWithFormat:@"%@%@", _gurl,str];
    
}
-(IBAction)gback:(id)sender{
    if([_glblon.text isEqual:@"ftp://192.168.1.188/g_gallery/"]){
        _gbtn.alpha = 0;
        _gbtn2.alpha = 0;
        
    }
    if (_gwebView.alpha == 1) {
        [_gwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: @""]]];
        _gwebView.alpha = 0;
        
        _gbtn2.alpha = 0;
    }
    else{
        NSArray *newUrlArray = [_gurl componentsSeparatedByString:@"/"];
        _gurl = @"";
        NSString *new = @"";
        for (int i = 0; i<newUrlArray.count-2; i++) {
            new = [new stringByAppendingString:newUrlArray[i]];
            new = [new stringByAppendingString:@"/"];
        }
        
        [self nextUrl:new];
        _glblon.text = new;
    }
    
}


- (IBAction)gshare:(id)sender {
    NSData *Data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_gurl] options:NSDataReadingMappedIfSafe error:NULL];
    NSArray *activityItems = @[Data];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        activityViewControntroller.popoverPresentationController.sourceView = self.GSHARE;
        activityViewControntroller.popoverPresentationController.sourceRect = CGRectMake(self.GSHARE.bounds.size.width/2, self.GSHARE.bounds.size.height/2, 0, 0);
    }
    [self presentViewController:activityViewControntroller animated:true completion:nil];
}



/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"go"]) {
        GALLERYViewController *dest = segue.destinationViewController;
        dest.gurla = sender;
        dest.goldUrl = _gurl;
        dest.glbltxt = topass;
        
    }
}*/

- (void)webViewDidStartLoad:(UIWebView *)gwebView{
    
    
    self.gload.alpha = 1.0;
    [self.gload startAnimating];
    
    
    if ([gallerylla hasPrefix:@"mp4"]||[gallerylla hasPrefix:@"m4v"]||[gallerylla hasPrefix:@"mkv"]) {
        [self webViewDidStopLoad:_gwebView];}
}

- (void)webViewDidFinishLoad:(UIWebView *)gwebView {
    
    [self.gload stopAnimating];
    self.gload.hidesWhenStopped = YES;
}


- (void)webViewDidStopLoad:(UIWebView *)gwebView{
    [self.gload stopAnimating];
    self.gload.hidesWhenStopped = YES;
}

- (IBAction)greBack:(id)sender {
    
}


@end
