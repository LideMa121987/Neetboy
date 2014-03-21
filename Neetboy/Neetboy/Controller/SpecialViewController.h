//
//  SpecialViewController.h
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SpecialViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>
{
    __unsafe_unretained UIViewController        *_homeViewController;
    
    UITableView     *_tableView;
    NSMutableArray  *_specialArray;
}

@property (assign, nonatomic) UIViewController *homeViewController;

@end
