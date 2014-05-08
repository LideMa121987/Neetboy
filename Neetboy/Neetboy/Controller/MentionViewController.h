//
//  MentionViewController.h
//  Neetboy
//
//  Created by lide on 14-5-8.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MentionViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>
{
    __unsafe_unretained UIViewController        *_homeViewController;
    
    UITableView     *_tableView;
    NSMutableArray  *_weiboArray;
}

@property (assign, nonatomic) UIViewController *homeViewController;

- (void)reloadData;

@end
