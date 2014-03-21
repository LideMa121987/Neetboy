//
//  RecommandViewController.h
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SMGridView.h"

@interface RecommandViewController : BaseViewController <SMGridViewDataSource, SMGridViewDelegate>
{
    __unsafe_unretained UIViewController        *_homeViewController;
    
    SMGridView      *_gridView;
    NSMutableArray  *_itemArray;
}

@property (assign, nonatomic) UIViewController *homeViewController;

@end
