//
//  AudioViewController.h
//  Neetboy
//
//  Created by lide on 14-3-25.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface AudioViewController : BaseViewController
{
    UIScrollView        *_scrollView;
    UIImageView         *_imageView;
    
    UISlider            *_slider;
    UIButton            *_playButton;
    UIButton            *_pauseButton;
    UIButton            *_favouriteButton;
    UIButton            *_shareButton;
}

@end
