//
//  HomeViewController.h
//  Neetboy
//
//  Created by lide on 14-3-20.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimelineViewController.h"
//#import "RecommandViewController.h"
#import "MineViewController.h"
//#import "SpecialViewController.h"
#import "MentionViewController.h"
//#import "FavouriteViewController.h"

@interface HomeViewController : UIViewController //<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
{
//    UITableView     *_tableView;
//    UIScrollView    *_scrollView;
//    
//    UIView          *_floatView;
    
    UIView          *_footView;
    
    UIButton        *_timelineButton;
//    UIButton        *_recommandButton;
    UIButton        *_mineButton;
//    UIButton        *_specialButton;
    UIButton        *_mentionButton;
//    UIButton        *_favouriteButton;
    
    TimelineViewController      *_timelineVC;
//    RecommandViewController     *_recommandVC;
    MineViewController          *_mineVC;
//    SpecialViewController       *_specialVC;
    MentionViewController       *_mentionVC;
//    FavouriteViewController     *_favouriteVC;
}

@end
