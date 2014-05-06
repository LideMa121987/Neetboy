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

#define kTGBaseURLString @"https://api.weibo.com/2"

@interface WeiboAPIClient : NSObject
{
    NSMutableDictionary         *_headDictionary;
}

+ (id)sharedInstance;

@end
