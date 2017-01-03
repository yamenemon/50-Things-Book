//
//  IndexViewController.m
//  50 Thinks Book
//
//  Created by Emon on 12/30/16.
//  Copyright © 2016 csm. All rights reserved.
//

#import "IndexViewController.h"
#import "ReaderViewController.h"
#define DEMO_VIEW_CONTROLLER_PUSH FALSE
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface IndexViewController () <ReaderViewControllerDelegate>
{
    NSArray *items;
}
@property (weak, nonatomic) IBOutlet UITableView *indexTable;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *theString = @"Be Great Now, The Joy of Generosity, Thank your way to the Top, Remembering your Mentors, Encourage the next Generation, R-E-S-P-E-C-T, Help your way out of a Slump, Written Goals, Rebounding your Way to Sales Success, Solve your way to Success, Multi Task, Multi Income Streams, Leverage, 1 in 98 shot to 1 Million, You Bet, Help friends find jobs, Give Referrals,  Three Way Calls,  Don't Beautiful Barbara Things, Dialing for Dollars,  Solutions no Dump Trucks,  Don't leave your Success to Chance,  Mistakes and Failures Mandatory,  School is always in Session, Happy Bombs,  Ozzy \"When to say we verses I\", Thanksgiving vs. Christmas, No sales No problem, Don't say no for your Customer, Be Charitable, 366 Days from Now, Don't count on being thanked, Ask Questions, Be Assertive, Watch out for the Vice in Advice, Being the best is Duly Noted, Are you just visiting?, No instant pill for Success, Create Freedom, Magic Number 5, Before Tax Dollars vs. After Tax Dollars, Find the \"Why\", What's in it for them? , Equity, YOU INC, Let them go, Hurry vs. No Hurry people, Sell Yes or Buy No, Get Used, Convert Pay into Assets or Income Streams, Do it Now!,In Closing";
    
   items = [theString componentsSeparatedByString:@","];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
#endif // DEMO_VIEW_CONTROLLER_PUSH
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
#endif // DEMO_VIEW_CONTROLLER_PUSH
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidUnload
{
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
#endif
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) // See README
        return UIInterfaceOrientationIsPortrait(interfaceOrientation);
    else
        return YES;
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
#endif
    
    [super didReceiveMemoryWarning];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 51;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    tableView.backgroundColor = [UIColor clearColor];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.accessoryView = [[ UIImageView alloc ] initWithImage:[UIImage imageNamed:@"accessoryIcon"]];;
    [cell.accessoryView setFrame:CGRectMake(0, 0, 17, 17)];
    cell.backgroundColor = [UIColor clearColor];
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = UIColorFromRGB(0xC09667); //
    [cell setSelectedBackgroundView:bgColorView];
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Chapter %ld: %@",indexPath.row+1,[items objectAtIndex:indexPath.row + 1]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *phrase = nil; // Document password (for unlocking most encrypted PDF files)
    
    NSString *filePath;
    NSArray *pdfs = [[NSBundle mainBundle] pathsForResourcesOfType:@"PDF" inDirectory:nil];
    
    
    for (int i=0; i<pdfs.count; i++) {
        NSString* pdfPathString = [pdfs objectAtIndex:i];
        if ([pdfPathString containsString:[NSString stringWithFormat:@"/%ld.PDF",indexPath.row+1]]) {
            filePath = pdfPathString; assert(filePath != nil); // Path to first PDF file
            break;
        }
        if ([pdfPathString containsString:[NSString stringWithFormat:@"/In Closing.PDF"]]) {
            filePath = pdfPathString; assert(filePath != nil); // Path to first PDF file
            break;
        }
    }
    
    ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:phrase];
    
    if (document != nil) // Must have a valid ReaderDocument object in order to proceed with things
    {
        ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
        
        readerViewController.delegate = self; // Set the ReaderViewController delegate to self
        
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
        
        [self.navigationController pushViewController:readerViewController animated:YES];
        
#else // present in a modal view controller
        
        readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        
        [self presentViewController:readerViewController animated:YES completion:NULL];
        
#endif // DEMO_VIEW_CONTROLLER_PUSH
    }
    else // Log an error so that we know that something went wrong
    {
        NSLog(@"%s [ReaderDocument withDocumentFilePath:'%@' password:'%@'] failed.", __FUNCTION__, filePath, phrase);
    }

}
#pragma mark - ReaderViewControllerDelegate methods

- (void)dismissReaderViewController:(ReaderViewController *)viewController
{
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
    
    [self.navigationController popViewControllerAnimated:YES];
    
#else // dismiss the modal view controller
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
#endif // DEMO_VIEW_CONTROLLER_PUSH
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
