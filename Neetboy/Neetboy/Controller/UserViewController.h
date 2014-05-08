//
//  UserViewController.h
//  Neetboy
//
//  Created by lide on 14-5-8.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "LMUser.h"

@interface UserViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>
{
    UITableView         *_tableView;
    NSMutableArray      *_weiboArray;
    
    LMUser              *_user;
}

@property (retain, nonatomic) LMUser *user;

@end
