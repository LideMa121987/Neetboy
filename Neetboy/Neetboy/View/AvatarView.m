//
//  AvatarView.m
//  Neetboy
//
//  Created by lide on 14-5-8.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "AvatarView.h"

@implementation AvatarView

@synthesize user = _user;

@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
        [tap release];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - UIGestureRecognizer

- (void)tap:(UITapGestureRecognizer *)gestureRecognizer
{
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        if(_delegate && [_delegate respondsToSelector:@selector(avatarViewDidTap:)])
        {
            [_delegate avatarViewDidTap:self];
        }
    }
}

@end
