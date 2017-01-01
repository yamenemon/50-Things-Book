//
//  AuthorViewController.m
//  50 Thinks Book
//
//  Created by Emon on 12/30/16.
//  Copyright © 2016 csm. All rights reserved.
//

#import "AuthorViewController.h"

@interface AuthorViewController (){

    NSString *authorText;
}
@property (weak, nonatomic) IBOutlet UILabel *authorHeaderText;
@property (nonatomic,assign) float authorTextHeight;
@property (weak, nonatomic) IBOutlet UIScrollView *authorInfoScroller;
@end

@implementation AuthorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _authorTextHeight = [self calculateAuthorTextHeight];
//    _authorInfoScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(5, _authorHeaderText.frame.origin.y+_authorHeaderText.frame.size.height, self.view.frame.size.width - 10, self.view.frame.size.height-(_authorHeaderText.frame.origin.y+_authorHeaderText.frame.size.height))];
//    [self.view addSubview:_authorInfoScroller];
}
-(void)viewWillAppear:(BOOL)animated{
    float width = 200;
    float height = 200;
    UIImage *authorImage = [UIImage imageNamed:@"timShiner"];
    UIImageView *authorImageView = [[UIImageView alloc] initWithFrame:CGRectMake((_authorInfoScroller.frame.size.width - 200)/2, 10, width, height)];
    authorImageView.image = authorImage;
    authorImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_authorInfoScroller addSubview:authorImageView];

    UILabel *authorTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10+authorImageView.frame.size.height, _authorInfoScroller.frame.size.width - 20, _authorTextHeight)];
    authorTextLabel.text = authorText;
    [_authorInfoScroller addSubview:authorTextLabel];
    authorTextLabel.font = [UIFont fontWithName:@"BodoniSvtyTwoITCTT-BookIta" size:18];;
    authorTextLabel.numberOfLines = 0;
    authorTextLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    authorTextLabel.adjustsFontSizeToFitWidth = YES;
    authorTextLabel.minimumScaleFactor = 10.0f/12.0f;
    authorTextLabel.clipsToBounds = YES;
    authorTextLabel.backgroundColor = [UIColor clearColor];
    authorTextLabel.textColor = [UIColor blackColor];
    authorTextLabel.textAlignment = NSTextAlignmentJustified;
    [authorTextLabel sizeToFit];

    float scrollerWidth = _authorInfoScroller.frame.size.width;
    float scrollerHeight = (authorImageView.frame.size.height + authorTextLabel.frame.size.height + 70);
    _authorInfoScroller.contentSize = CGSizeMake(scrollerWidth,scrollerHeight);
}
-(float)calculateAuthorTextHeight{

    authorText = @"Anyone who believes that school will truly prepare you for the real world will definitely benefit from this great read, written by Tim Shiner. This book is a combination of humor, practical advice, inspiration and fun all rolled into one. This is a must read for any graduate who is about to enter into the \"adult world.\" \n \n     Tim Shiner is a real estate investor, business owner, and mentor. His success has not broken his humility as Tim continually gives back to the world and helps others in need. He's a visionary that can take a concept that many would only dream of making a reality and make it a success!\n \n     Tim has invested in a variety of business ventures which have proven widely successful. Whether it's saving home/business owners from flooding disasters, creating products that establish a company brand, or designing custom calendars for schools, there's no challenge Tim is not willing to try!";
    CGRect r = [authorText boundingRectWithSize:CGSizeMake(200, 0)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]}
                                  context:nil];
    return r.size.height;
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
