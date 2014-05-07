//
//  LMWeibo.m
//  Neetboy
//
//  Created by lide on 14-5-7.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "LMWeibo.h"
#import "LMGeo.h"
#import "LMUser.h"

@implementation LMWeibo

@synthesize createdAt = _createdAt;
@synthesize weiboId = _weiboId;
@synthesize mid = _mid;
@synthesize idstr = _idstr;
@synthesize text = _text;
@synthesize source = _source;
@synthesize favorited = _favorited;
@synthesize truncated = _truncated;
@synthesize thumbnailPic = _thumbnailPic;
@synthesize bmiddlePic = _bmiddlePic;
@synthesize originalPic = _originalPic;
@synthesize geo = _geo;
@synthesize user = _user;
@synthesize retweetedStatus = _retweetedStatus;
@synthesize repostsCount = _repostsCount;
@synthesize commentsCount = _commentsCount;
@synthesize attitudesCount = _attitudesCount;
@synthesize visible = _visible;
@synthesize picURLs = _picURLs;
@synthesize ad = _ad;

- (id)initWithAttribute:(NSDictionary *)attribute
{
    self = [super init];
    if(self != nil)
    {
        if(attribute != nil)
        {
            self.createdAt = [attribute objectForKey:@"created_at"];
            self.weiboId = [[attribute objectForKey:@"id"] longLongValue];
            self.mid = [[attribute objectForKey:@"mid"] longLongValue];
            self.idstr = [attribute objectForKey:@"idstr"];
            self.text = [attribute objectForKey:@"text"];
            self.source = [attribute objectForKey:@"source"];
            self.favorited = [[attribute objectForKey:@"favorited"] boolValue];
            self.truncated = [[attribute objectForKey:@"truncated"] boolValue];
            self.thumbnailPic = [attribute objectForKey:@"thumbnail_pic"];
            self.bmiddlePic = [attribute objectForKey:@"bmiddle_pic"];
            self.originalPic = [attribute objectForKey:@"original_pic"];
            NSDictionary *geo = [attribute objectForKey:@"geo"];
            if(geo && ![geo isEqual:[NSNull null]])
            {
                self.geo = [[LMGeo alloc] initWithAttribute:geo];
            }
            NSDictionary *user = [attribute objectForKey:@"user"];
            if(user && ![user isEqual:[NSNull null]])
            {
                self.user = [[LMUser alloc] initWithAttribute:user];
            }
            NSDictionary *retweetedStatus = [attribute objectForKey:@"retweeted_status"];
            if(retweetedStatus && ![retweetedStatus isEqual:[NSNull null]])
            {
                self.retweetedStatus = [[LMWeibo alloc] initWithAttribute:retweetedStatus];
            }
            self.repostsCount = [[attribute objectForKey:@"reposts_count"] intValue];
            self.commentsCount = [[attribute objectForKey:@"comments_count"] intValue];
            self.attitudesCount = [[attribute objectForKey:@"attitudes_count"] intValue];
            NSDictionary *visible = [attribute objectForKey:@"visible"];
            if(visible && ![visible isEqual:[NSNull null]])
            {
                self.visible = [[visible objectForKey:@"type"] intValue];
            }
            NSArray *picURLs = [attribute objectForKey:@"pic_urls"];
            if(picURLs && ![picURLs isEqual:[NSNull null]] && [picURLs isKindOfClass:[NSArray class]])
            {
                self.picURLs = picURLs;
            }
            self.ad = [attribute objectForKey:@"ad"];
        }
    }
    
    return self;
}

- (CGFloat)heightForRow
{
    CGFloat height = 0;
    CGRect textRect = CGRectZero;
    
    textRect = [self.text boundingRectWithSize:CGSizeMake(300, 600)
                                       options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{
                                                 
                                                 NSFontAttributeName : [UIFont systemFontOfSize:14.0f]
                                                 
                                                 }
                                       context:nil];
    
    height += textRect.size.height;
    height += 50;
    
    if(self.retweetedStatus != nil)
    {
        textRect = [self.retweetedStatus.text boundingRectWithSize:CGSizeMake(290, 600)
                                                           options:NSStringDrawingUsesLineFragmentOrigin
                                                        attributes:@{
                                                                     
                                                                     NSFontAttributeName : [UIFont systemFontOfSize:14.0f]
                                                                     
                                                                     }
                                                           context:nil];
        
        height += textRect.size.height;
        height += 45;
    }
    
    return height;
}

+ (NSArray *)parseFromeData:(NSData *)data
{
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:0];
    
    NSDictionary *dictionary = (NSDictionary *)[[WeiboAPIClient sharedInstance] responseJSON:data];
    
    if([dictionary objectForKey:@"statuses"])
    {
        dictionary = [dictionary objectForKey:@"statuses"];
    }
    
    if([dictionary isKindOfClass:[NSArray class]])
    {
        for(NSDictionary *attribute in (NSArray *)dictionary)
        {
            LMWeibo *weibo = [[LMWeibo alloc] initWithAttribute:attribute];
            [mutableArray addObject:weibo];
            [weibo release];
        }
    }
    else if([dictionary isKindOfClass:[NSDictionary class]])
    {
        if([dictionary objectForKey:@"status"])
        {
            id suppliers = [dictionary objectForKey:@"status"];
            if([suppliers isKindOfClass:[NSArray class]])
            {
                for(NSDictionary *attribute in (NSArray *)suppliers)
                {
                    LMWeibo *weibo = [[LMWeibo alloc] initWithAttribute:attribute];
                    [mutableArray addObject:weibo];
                    [weibo release];
                }
            }
        }
        else
        {
            LMWeibo *weibo = [[LMWeibo alloc] initWithAttribute:dictionary];
            [mutableArray addObject:weibo];
            [weibo release];
        }
    }
    
    return mutableArray;
}

+ (void)getWeiboFriendsTimelineWithSinceId:(int64_t)sinceId
                                     maxId:(int64_t)maxId
                                     count:(int)count
                                      page:(int)page
                                   baseApp:(int)baseApp
                                   feature:(int)feature
                                  trimUser:(int)trimUser
                                   success:(LMObjectSuccessBlock)successBlock
                                   failure:(LMObjectFailureBlock)failureBlock
{
    [[WeiboAPIClient sharedInstance] getWeiboFriendsTimelineWithSinceId:sinceId
                                                                  maxId:maxId
                                                                  count:count
                                                                   page:page
                                                                baseApp:baseApp
                                                                feature:feature
                                                               trimUser:trimUser
                                                                success:^(NSData *data) {
                                                                    if(successBlock)
                                                                    {
                                                                        successBlock([LMWeibo parseFromeData:data]);
                                                                    }
                                                                } failure:^(NSError *error) {
                                                                    if(failureBlock)
                                                                    {
                                                                        failureBlock(error);
                                                                    }
                                                                }];
}

@end
