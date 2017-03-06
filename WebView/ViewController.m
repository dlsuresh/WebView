//
//  ViewController.m
//  WebView
//
//  Created by Suresh on 2/14/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *urlTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"https://www.google.com";
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
   
  //  UIApplication *safari = [UIApplication sharedApplication];
    //[safari openURL:url options:@{} completionHandler:nil];
    
    //    NSString *str = @"https://www.gmail.com";
//    NSURL *url = [NSURL URLWithString:str];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    [self.webView loadRequest:request];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    self.indicateView.hidden = NO;
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    

}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
 
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
    self.activityIndicator.hidden = YES;
    [self.activityIndicator stopAnimating];
    self.indicateView.hidden = YES;
    //self.urlTextField.hidden = YES;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Loading Error" message:@"No Internet Connection" preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        self.indicateView.hidden = YES;
        self.activityIndicator.hidden = YES;
         [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
        
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}


@end
