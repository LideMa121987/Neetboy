//
//  LMWeibo.h
//  Neetboy
//
//  Created by lide on 14-5-7.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "LMObject.h"

@class LMGeo;
@class LMUser;

@interface LMWeibo : LMObject
{
    NSString        *_createdAt;
    int64_t         _weiboId;
    int64_t         _mid;
    NSString        *_idstr;
    NSString        *_text;
    NSString        *_source;
    BOOL            _favorited;
    BOOL            _truncated;
    NSString        *_thumbnailPic;
    NSString        *_bmiddlePic;
    NSString        *_originalPic;
    LMGeo           *_geo;
    LMUser          *_user;
    LMWeibo         *_retweetedStatus;
    int             _repostsCount;
    int             _commentsCount;
    int             _attitudesCount;
    int             _visible;
    NSArray         *_picURLs;
    NSArray         *_ad;
}

@property (retain, nonatomic) NSString *createdAt;
@property (assign, nonatomic) int64_t weiboId;
@property (assign, nonatomic) int64_t mid;
@property (retain, nonatomic) NSString *idstr;
@property (retain, nonatomic) NSString *text;
@property (retain, nonatomic) NSString *source;
@property (assign, nonatomic) BOOL favorited;
@property (assign, nonatomic) BOOL truncated;
@property (retain, nonatomic) NSString *thumbnailPic;
@property (retain, nonatomic) NSString *bmiddlePic;
@property (retain, nonatomic) NSString *originalPic;
@property (retain, nonatomic) LMGeo *geo;
@property (retain, nonatomic) LMUser *user;
@property (retain, nonatomic) LMWeibo *retweetedStatus;
@property (assign, nonatomic) int repostsCount;
@property (assign, nonatomic) int commentsCount;
@property (assign, nonatomic) int attitudesCount;
@property (assign, nonatomic) int visible;
@property (retain, nonatomic) NSArray *picURLs;
@property (retain, nonatomic) NSArray *ad;

- (id)initWithAttribute:(NSDictionary *)attribute;
- (CGFloat)heightForRow;

+ (void)getWeiboFriendsTimelineWithSinceId:(int64_t)sinceId
                                     maxId:(int64_t)maxId
                                     count:(int)count
                                      page:(int)page
                                   baseApp:(int)baseApp
                                   feature:(int)feature
                                  trimUser:(int)trimUser
                                   success:(LMObjectSuccessBlock)successBlock
                                   failure:(LMObjectFailureBlock)failureBlock;

@end
