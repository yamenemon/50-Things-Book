//
//  PdfViewerViewController.m
//  50 Thinks Book
//
//  Created by CSM on 1/2/17.
//  Copyright © 2017 csm. All rights reserved.
//

#import "PdfViewerViewController.h"

@interface PdfViewerViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation PdfViewerViewController
@synthesize pdfNumber;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadPdf];
}
-(void)viewWillAppear:(BOOL)animated{
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.view setNeedsDisplay];
}
-(void)loadPdf{

    NSString *path1 = [NSString stringWithFormat:@"%d.pdf",pdfNumber];

    NSString *html = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:html baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]]];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
