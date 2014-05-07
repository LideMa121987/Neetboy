//
//  WeiboAPIClient.m
//  Neetboy
//
//  Created by lide on 14-5-6.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "WeiboAPIClient.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "Reachability.h"

#define Net_NotAvilable 100000000

@implementation WeiboAPIClient

#pragma mark - private

- (id)responseJSON:(NSData *)data
{
    if(data == nil)
    {
        return nil;
    }
    NSError *error = nil;

    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if(error)
    {
        return nil;
    }
    
    
    return jsonObject;
}

- (void)sendRequestPath:(NSString *)path
                 params:(NSDictionary *)params
                 method:(NSString *)method
                success:(QYAPISuccessBlock)successBlock
                failure:(QYAPIFailureBlock)failureBlock;
{
    
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        
        return;
    }
    
    if([method isEqualToString:@"GET"])
    {
        NSString *urlStr = [kTGBaseURLString stringByAppendingFormat:@"%@", path];
        
        urlStr = [self stringFromBaseURL:urlStr withParams:params];
        
        ASIHTTPRequest *myRequest = [[[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]] autorelease];
        myRequest.delegate=self;
        
        [myRequest setCompletionBlock:^{
            
            NSData *data = [myRequest responseData];
            
            successBlock(data);
        }];
        
        [myRequest setFailedBlock:^{
            
            [myRequest clearDelegatesAndCancel];
            
        }];
        
        [myRequest startAsynchronous];
    }
    else if([method isEqualToString:@"POST"])
    {
        NSString *urlStr = [kTGBaseURLString stringByAppendingFormat:@"%@", path];
        
        ASIFormDataRequest *myRequest  = [[[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]] autorelease];
        myRequest.shouldRedirect = YES;
        myRequest.delegate=self;
        
        [_headDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [myRequest addPostValue:obj forKey:key];
        }];
        
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            if([obj isKindOfClass:[UIImage class]])
            {
                [myRequest addData:UIImageJPEGRepresentation(obj, 1.0) forKey:key];
            }
            else if([obj isKindOfClass:[NSData class]])
            {
                [myRequest addData:obj forKey:key];
            }
            else
            {
                [myRequest addPostValue:obj forKey:key];
            }
        }];
        
        [myRequest setCompletionBlock:^{
            
            NSData *data = [myRequest responseData];
            
            successBlock(data);
            
        }];
        
        [myRequest setFailedBlock:^{
            
            [myRequest clearDelegatesAndCancel];
            
        }];
        [myRequest startAsynchronous];
    }
    else
    {
        //TODO Lide need to handle other HTTP method
    }
}

- (NSString *)stringFromBaseURL:(NSString *)baseURL withParams:(NSDictionary *)dictionary
{
    NSString *fullString = [NSString stringWithString:[baseURL stringByAppendingFormat:@"?"]];
    
    for(id key in [_headDictionary allKeys])
    {
        fullString = [fullString stringByAppendingFormat:@"%@=%@&", key, [_headDictionary objectForKey:key]];
    }
    
    for(id key in [dictionary allKeys])
    {
        fullString = [fullString stringByAppendingFormat:@"%@=%@&", key, [dictionary objectForKey:key]];
    }
    
    fullString = [fullString substringToIndex:([fullString length] - 1)];
    
    return fullString;
}

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
            [_headDictionary setObject:access_token forKey:@"access_token"];
        }
    }
    
    return self;
}

#pragma mark - API method

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
                                   failure:(QYAPIFailureBlock)failureBlock
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    
    if(sinceId > 0)
    {
        [params setObject:[NSString stringWithFormat:@"%lli", (int64_t)sinceId] forKey:@"since_id"];
    }
    if(maxId > 0)
    {
        [params setObject:[NSString stringWithFormat:@"%lli", (int64_t)maxId] forKey:@"max_id"];
    }
    if(count > 0 && count <= 100)
    {
        [params setObject:[NSString stringWithFormat:@"%i", count] forKey:@"count"];
    }
    if(page > 1)
    {
        [params setObject:[NSString stringWithFormat:@"%i", page] forKey:@"page"];
    }
    if(baseApp > 0)
    {
        [params setObject:[NSString stringWithFormat:@"%i", baseApp] forKey:@"base_app"];
    }
    if(feature > 0)
    {
        [params setObject:[NSString stringWithFormat:@"%i", feature] forKey:@"feature"];
    }
    if(trimUser > 0)
    {
        [params setObject:[NSString stringWithFormat:@"%i", trimUser] forKey:@"trim_user"];
    }
    
    [self sendRequestPath:@"statuses/friends_timeline.json"
                   params:params
                   method:@"GET"
                  success:successBlock
                  failure:failureBlock];
}

@end
