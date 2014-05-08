//
//  UserViewController.m
//  Neetboy
//
//  Created by lide on 14-5-8.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "UserViewController.h"
#import "WeiboCell.h"
#import "LMWeibo.h"

@interface UserViewController () <WeiboCellDelegate>

@end

@implementation UserViewController

@synthesize user = _user;

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
    
    _titleLabel.text = @"User";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _adjustView.frame.origin.y + _adjustView.frame.size.height, 320, self.view.frame.size.height - _adjustView.frame.size.height) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [LMWeibo getUserWeiboListWithUserId:[_user userId]
                             screenName:nil
                                sinceId:0
                                  maxId:0
                                  count:0
                                   page:0
                                baseApp:0
                                feature:0
                               trimUser:0
                                success:^(NSArray *array) {
                                    [_weiboArray removeAllObjects];
                                    [_weiboArray addObjectsFromArray:array];
                                    [_tableView reloadData];
                                } failure:^(NSError *error) {
                                    
                                }];
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

#pragma mark - UITableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - WeiboCellDelegate

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
