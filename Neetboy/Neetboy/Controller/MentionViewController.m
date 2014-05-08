//
//  MentionViewController.m
//  Neetboy
//
//  Created by lide on 14-5-8.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "MentionViewController.h"
#import "LMWeibo.h"
#import "WeiboCell.h"

@interface MentionViewController () <WeiboCellDelegate>

@end

@implementation MentionViewController

@synthesize homeViewController = _homeViewController;

#pragma mark - super

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
    
    _titleLabel.text = @"Mention";
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
    [LMWeibo getMentionWeiboListWithSinceId:0
                                      maxId:0
                                      count:0
                                       page:0
                             filterByAuthor:0
                             filterBySource:0
                               filterByType:0
                                    success:^(NSArray *array) {
                                        [_weiboArray removeAllObjects];
                                        [_weiboArray addObjectsFromArray:array];
                                        [_tableView reloadData];

                                    } failure:^(NSError *error) {
                                        
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
    [_tableView setContentOffset:CGPointZero animated:YES];
    
    [LMWeibo getMentionWeiboListWithSinceId:0
                                      maxId:0
                                      count:0
                                       page:0
                             filterByAuthor:0
                             filterBySource:0
                               filterByType:0
                                    success:^(NSArray *array) {
                                        [_weiboArray removeAllObjects];
                                        [_weiboArray addObjectsFromArray:array];
                                        [_tableView reloadData];
                                        
                                    } failure:^(NSError *error) {
                                        
                                    }];
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
