//
//  WeiboCell.h
//  Neetboy
//
//  Created by lide on 14-5-7.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMWeibo.h"
#import "AvatarView.h"

@protocol WeiboCellDelegate;

@interface WeiboCell : UITableViewCell <AvatarViewDelegate>
{
    UIView          *_backgroundView;
    AvatarView      *_avatarView;
    UILabel         *_nameLabel;
    UILabel         *_timeLabel;
    UILabel         *_textLabel;

    UIView          *_retweetBackgroundView;
    AvatarView      *_retweetAvatarView;
    UILabel         *_retweetNameLabel;
    UILabel         *_retweetTimeLabel;
    UILabel         *_retweetTextLabel;
    
    LMWeibo         *_weibo;
    
    id<WeiboCellDelegate>   _delegate;
}

@property (retain, nonatomic) LMWeibo *weibo;

@property (assign, nonatomic) id<WeiboCellDelegate> delegate;

@end

@protocol WeiboCellDelegate <NSObject>

@optional

- (void)weiboCellUpdateOnePictureHeight:(WeiboCell *)weiboCell;
- (void)weiboCellDidTapAvatar:(LMUser *)user;

@end
