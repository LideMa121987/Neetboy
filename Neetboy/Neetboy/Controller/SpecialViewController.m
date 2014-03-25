//
//  SpecialViewController.m
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "SpecialViewController.h"
#import "SpecialTableViewCell.h"
#import "AudioViewController.h"

@interface SpecialViewController ()

@end

@implementation SpecialViewController

@synthesize homeViewController = _homeViewController;

- (id)init
{
    self = [super init];
    if(self != nil)
    {
        _specialArray = [[NSMutableArray alloc] initWithCapacity:0];
        for(NSUInteger i = 0; i < 40; i++)
        {
            CGSize size = CGSizeMake(320, 60 + rand() % 3 * 10);
            [_specialArray addObject:NSStringFromCGSize(size)];
        }
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
    
    _titleLabel.text = @"Special";
    _backButton.hidden = YES;
    
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - 49);
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _adjustView.frame.size.height, 320, self.view.frame.size.height - _adjustView.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 2.5)];
    headerView.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = headerView;
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 2.5)];
    footerView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = footerView;
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_specialArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeFromString([_specialArray objectAtIndex:indexPath.row]).height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SpecialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialViewControllerIdentifier"];
    if(cell == nil)
    {
        cell = [[SpecialTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SpecialViewControllerIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    CGSize size = CGSizeFromString([_specialArray objectAtIndex:indexPath.row]);
    cell.frame = CGRectMake(0, 0, size.width, size.height);
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AudioViewController *audioVC = [[AudioViewController alloc] init];
    [self.homeViewController.navigationController pushViewController:audioVC animated:YES];
    
    return nil;
}

@end
