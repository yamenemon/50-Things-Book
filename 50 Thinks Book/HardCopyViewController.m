//
//  HardCopyViewController.m
//  50 Thinks Book
//
//  Created by Emon on 12/31/16.
//  Copyright © 2016 csm. All rights reserved.
//

#import "HardCopyViewController.h"

@interface HardCopyViewController ()
@property (weak, nonatomic) IBOutlet UIButton *amazonBtn;
@property (weak, nonatomic) IBOutlet UIButton *luluBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightCon;
@property (weak, nonatomic) IBOutlet UIView *btnContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnContainerTopConstraint;

@end

@implementation HardCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidLayoutSubviews{

    _amazonBtn.layer.cornerRadius = 5.0;
    _luluBtn.layer.cornerRadius = 5.0;
    [self.view setNeedsUpdateConstraints];
}
-(void)updateViewConstraints {
    [super updateViewConstraints];

    if ((self.btnContainerTopConstraint.constant+_heightCon.constant)>self.view.bounds.size.height) {
        self.heightCon.constant = (self.view.frame.size.height)-self.btnContainerTopConstraint.constant;
    }
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
    {
        // code for landscape orientation
    }
    
    if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation))
    {
        // code for Portrait orientation
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)amazonButtonAction:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.amazon.com/Things-They-Didnt-Teach-School/dp/1539357155"] options:@{} completionHandler:nil];

}
- (IBAction)luluButtonAction:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.lulu.com/us/en/shop/tim-shiner/50-things-they-didnt-teach-you-in-school/hardcover/product-22835657.html"] options:@{} completionHandler:nil];

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
