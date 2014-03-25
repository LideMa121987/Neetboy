//
//  DetailViewController.h
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface DetailViewController : BaseViewController
{
    UIScrollView        *_scrollView;
    UIScrollView        *_pictureScrollView;
    
    UIView              *_floatView;
}

@end
