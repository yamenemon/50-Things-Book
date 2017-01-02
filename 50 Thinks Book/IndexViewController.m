//
//  IndexViewController.m
//  50 Thinks Book
//
//  Created by Emon on 12/30/16.
//  Copyright © 2016 csm. All rights reserved.
//

#import "IndexViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface IndexViewController ()
{
    NSArray *items;
}
@property (weak, nonatomic) IBOutlet UITableView *indexTable;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *theString = @"Be Great Now, The Joy of Generosity, Thank your way to the Top, Remembering your Mentors, Encourage the next Generation, R-E-S-P-E-C-T, Help your way out of a Slump, Written Goals, Rebounding your Way to Sales Success, Solve your way to Success, Multi Task, Multi Income Streams, Leverage, 1 in 98 shot to 1 Million, You Bet, Help friends find jobs, Give Referrals,  Three Way Calls,  Don't Beautiful Barbara Things, Dialing for Dollars,  Solutions no Dump Trucks,  Don't leave your Success to Chance,  Mistakes and Failures Mandatory,  School is always in Session, Happy Bombs,  Ozzy \"When to say we verses I\", Thanksgiving vs. Christmas, No sales No problem, Don't say no for your Customer, Be Charitable, 366 Days from Now, Don't count on being thanked, Ask Questions, Be Assertive, Watch out for the Vice in Advice, Being the best is Duly Noted, Are you just visiting?, No instant pill for Success, Create Freedom, Magic Number 5, Before Tax Dollars vs. After Tax Dollars, Find the \"Why\", What's in it for them? , Equity, YOU INC, Let them go, Hurry vs. No Hurry people, Sell Yes or Buy No, Get Used, Convert Pay into Assets or Income Streams, Do it Now!";
    
   items = [theString componentsSeparatedByString:@","];

}
-(void)viewWillAppear:(BOOL)animated{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    tableView.backgroundColor = [UIColor clearColor];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = UIColorFromRGB(0xC09667); //
    [cell setSelectedBackgroundView:bgColorView];
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Chapter %ld: %@",indexPath.row+1,[items objectAtIndex:indexPath.row + 1]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PdfViewerViewController *vc = [sb instantiateViewControllerWithIdentifier:@"pdfViewerViewController"];
    vc.pdfNumber = (int)(indexPath.row + 1);
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController pushViewController:vc animated:YES];

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
