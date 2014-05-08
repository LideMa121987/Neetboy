//
//  MineViewController.m
//  Neetboy
//
//  Created by lide on 14-5-8.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "MineViewController.h"
#import "LMWeibo.h"
#import "WeiboCell.h"
#import "AppDelegate.h"

@interface MineViewController () <WeiboCellDelegate>

@end

@implementation MineViewController

@synthesize homeViewController = _homeViewController;

#pragma mark - private

- (void)loadMoreWeibo
{
    if(_loading)
    {
        return;
    }
    _loading = YES;
    
    [LMWeibo getUserWeiboListWithUserId:[[(AppDelegate *)[[UIApplication sharedApplication] delegate] weiboUserId] longLongValue]
                             screenName:nil
                                sinceId:0
                                  maxId:[[_weiboArray lastObject] weiboId] - 1
                                  count:0
                                   page:0
                                baseApp:0
                                feature:0
                               trimUser:0
                                success:^(NSArray *array) {
                                    
                                    _loading = NO;
                                    
                                    [_weiboArray addObjectsFromArray:array];
                                    [_tableView reloadData];
                                } failure:^(NSError *error) {
                                    
                                    _loading = NO;
                                    
                                }];
}

- (id)init
{
    self = [super init];
    if(self != nil)
    {
        _weiboArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
    
    _titleLabel.text = @"Mine";
    _backButton.hidden = YES;
    
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - 49);
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _adjustView.frame.size.height, 320, self.view.frame.size.height - _adjustView.frame.size.height) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
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
    
    _loading = YES;
    
    [LMWeibo getUserWeiboListWithUserId:[[(AppDelegate *)[[UIApplication sharedApplication] delegate] weiboUserId] longLongValue]
                             screenName:nil
                                sinceId:0
                                  maxId:0
                                  count:0
                                   page:0
                                baseApp:0
                                feature:0
                               trimUser:0
                                success:^(NSArray *array) {
                                    
                                    _loading = NO;
                                    
                                    [_weiboArray removeAllObjects];
                                    [_weiboArray addObjectsFromArray:array];
                                    [_tableView reloadData];
                                } failure:^(NSError *error) {
                                    
                                    _loading = NO;
                                    
                                }];
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

#pragma mark - public

- (void)reloadData
{
    if(_loading)
    {
        return;
    }
    _loading = YES;
    
    [_tableView setContentOffset:CGPointZero animated:YES];
    
    [LMWeibo getUserWeiboListWithUserId:[[(AppDelegate *)[[UIApplication sharedApplication] delegate] weiboUserId] longLongValue]
                             screenName:nil
                                sinceId:0
                                  maxId:0
                                  count:0
                                   page:0
                                baseApp:0
                                feature:0
                               trimUser:0
                                success:^(NSArray *array) {
                                    
                                    _loading = NO;
                                    
                                    [_weiboArray removeAllObjects];
                                    [_weiboArray addObjectsFromArray:array];
                                    [_tableView reloadData];
                                } failure:^(NSError *error) {
                                    
                                    _loading = NO;
                                    
                                }];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.y + 200 > scrollView.contentSize.height - scrollView.frame.size.height)
    {
        [self loadMoreWeibo];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_weiboArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[_weiboArray objectAtIndex:indexPath.row] heightForRow];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimelineViewControllerIdentifier"];
    if(cell == nil)
    {
        cell = [[[WeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TimelineViewControllerIdentifier"] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    
    [cell setWeibo:[_weiboArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)weiboCellUpdateOnePictureHeight:(WeiboCell *)weiboCell
{
    __block NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[_weiboArray indexOfObject:weiboCell.weibo] inSection:0];
    if(indexPath != nil)// && weiboCell.weibo.weiboId == [[_weiboArray objectAtIndex:indexPath.row] weiboId])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
        });
    }
}

@end
