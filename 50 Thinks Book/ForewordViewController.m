//
//  ForewordViewController.m
//  50 Thinks Book
//
//  Created by Emon on 12/31/16.
//  Copyright © 2016 csm. All rights reserved.
//

#import "ForewordViewController.h"

@interface ForewordViewController ()
@property (weak, nonatomic) IBOutlet UITextView *forewordText;

@end

@implementation ForewordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;

}
-(void)viewDidLayoutSubviews{

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
