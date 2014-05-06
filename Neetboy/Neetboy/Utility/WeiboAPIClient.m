//
//  WeiboAPIClient.m
//  Neetboy
//
//  Created by lide on 14-5-6.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "WeiboAPIClient.h"

@implementation WeiboAPIClient

#pragma mark - public
static id APIClient = nil;
+ (id)sharedInstance
{
    @synchronized(APIClient){
        if(APIClient == nil)
        {
            APIClient = [[self alloc] init];
        }
    }
    
    return APIClient;
}

- (id)init
{
    self = [super init];
    if(self != nil)
    {
        _headDictionary = [[NSMutableDictionary alloc] initWithCapacity:0];
        
        NSString *access_token = [[NSUserDefaults standardUserDefaults] objectForKey:@"weiboAccessToken"];
        
        if(access_token && [access_token length] > 0)
        {
            [_headDictionary setObject:access_token forKey:@"oauth_token"];
        }
    }
    
    return self;
}

@end
