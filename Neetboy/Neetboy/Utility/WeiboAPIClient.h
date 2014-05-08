//
//  WeiboAPIClient.h
//  Neetboy
//
//  Created by lide on 14-5-6.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^LMAPISuccessBlock)(NSData *data);
typedef void (^LMAPIFailureBlock)(NSError *error);

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
                                   success:(LMAPISuccessBlock)successBlock
                                   failure:(LMAPIFailureBlock)failureBlock;

/*
 获取某个用户最新发表的微博列表
 */
- (void)getUserWeiboListWithUserId:(int64_t)userId
                        screenName:(NSString *)screenName
                           sinceId:(int64_t)sinceId
                             maxId:(int64_t)maxId
                             count:(int)count
                              page:(int)page
                           baseApp:(int)baseApp
                           feature:(int)feature
                          trimUser:(int)trimUser
                           success:(LMAPISuccessBlock)successBlock
                           failure:(LMAPIFailureBlock)failureBlock;

/*
 获取最新的提到登录用户的微博列表，即@我的微博
 */
- (void)getMentionWeiboListWithSinceId:(int64_t)sinceId
                                 maxId:(int64_t)maxId
                                 count:(int)count
                                  page:(int)page
                        filterByAuthor:(int)filterByAuthor
                        filterBySource:(int)filterBySource
                          filterByType:(int)filterByType
                               success:(LMAPISuccessBlock)successBlock
                               failure:(LMAPIFailureBlock)failureBlock;

@end
