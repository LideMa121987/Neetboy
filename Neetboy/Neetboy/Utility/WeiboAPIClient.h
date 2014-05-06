//
//  WeiboAPIClient.h
//  Neetboy
//
//  Created by lide on 14-5-6.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiboAPIClient : NSObject
{
    NSMutableDictionary         *_headDictionary;
}

+ (id)sharedInstance;

@end
