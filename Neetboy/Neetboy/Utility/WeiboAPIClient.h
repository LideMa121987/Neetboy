//
//  WeiboAPIClient.h
//  Neetboy
//
//  Created by lide on 14-5-6.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^QYAPISuccessBlock)(NSData *data);
typedef void (^QYAPIFailureBlock)(NSError *error);

#define kTGBaseURLString @"https://api.weibo.com/2/"

@interface WeiboAPIClient : NSObject
{
    NSMutableDictionary         *_headDictionary;
}

+ (id)sharedInstance;

- (id)responseJSON:(NSData *)data;

/*
 获取当前登录用户及其所关注用户的最新微博
 */
- (void)getWeiboFriendsTimelineWithSinceId:(int64_t)sinceId
                                     maxId:(int64_t)maxId
                                     count:(int)count
                                      page:(int)page
                                   baseApp:(int)baseApp
                                   feature:(int)feature
                                  trimUser:(int)trimUser
                                   success:(QYAPISuccessBlock)successBlock
                                   failure:(QYAPIFailureBlock)failureBlock;

@end
