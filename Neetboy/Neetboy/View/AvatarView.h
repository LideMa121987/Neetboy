//
//  AvatarView.h
//  Neetboy
//
//  Created by lide on 14-5-8.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMUser.h"

@protocol AvatarViewDelegate;

@interface AvatarView : UIImageView
{
    LMUser      *_user;
    
    id<AvatarViewDelegate>  _delegate;
}

@property (retain, nonatomic) LMUser *user;

@property (assign, nonatomic) id<AvatarViewDelegate> delegate;

@end

@protocol AvatarViewDelegate <NSObject>

- (void)avatarViewDidTap:(AvatarView *)avatarView;

@end
