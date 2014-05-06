//
//  AppDelegate.h
//  Neetboy
//
//  Created by lide on 14-3-20.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, WeiboSDKDelegate>
{
    NSString    *_weiboUserId;
    NSString    *_weiboAccessToken;
    NSDate      *_weiboExpirationDate;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *weiboUserId;
@property (strong, nonatomic) NSString *weiboAccessToken;
@property (strong, nonatomic) NSDate *weiboExpirationDate;

@end
