//
//  BaseViewController.h
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
    UIView      *_adjustView;
    UIView      *_headView;
    
    UILabel     *_titleLabel;
    UIButton    *_backButton;
    UIButton    *_closeButton;
}

@end
