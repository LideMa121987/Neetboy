//
//  WeiboCell.h
//  Neetboy
//
//  Created by lide on 14-5-7.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMWeibo.h"

@interface WeiboCell : UITableViewCell
{
    UIView          *_backgroundView;
    UIImageView     *_avatarView;
    UILabel         *_nameLabel;
    UILabel         *_timeLabel;
    UILabel         *_textLabel;

    UIView          *_retweetBackgroundView;
    UIImageView     *_retweetAvatarView;
    UILabel         *_retweetNameLabel;
    UILabel         *_retweetTimeLabel;
    UILabel         *_retweetTextLabel;
    
    LMWeibo         *_weibo;
}

@property (retain, nonatomic) LMWeibo *weibo;

@end
