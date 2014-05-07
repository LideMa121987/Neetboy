//
//  LMUser.h
//  Neetboy
//
//  Created by lide on 14-5-7.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "LMObject.h"

@class LMWeibo;

@interface LMUser : LMObject
{
    int64_t         _userId;
    NSString        *_idstr;
    NSString        *_screenName;
    NSString        *_name;
    int             _province;
    int             _city;
    NSString        *_location;
    NSString        *_description;
    NSString        *_url;
    NSString        *_profileImageURL;
    NSString        *_profileURL;
    NSString        *_domain;
    NSString        *_weihao;
    NSString        *_gender;
    int             _followersCount;
    int             _friendsCount;
    int             _statusesCount;
    int             _favouritesCount;
    NSString        *_createdAt;
    BOOL            _allowAllActMsg;
    BOOL            _geoEnabled;
    BOOL            _verified;
    NSString        *_remark;
    LMWeibo         *_status;
    BOOL            _allowAllComment;
    NSString        *_avatarLarge;
    NSString        *_avatarHD;
    NSString        *_verifiedReason;
    BOOL            _followMe;
    int             _onlineStatus;
    int             _biFollowersCount;
    NSString        *_lang;
}

@property (assign, nonatomic) int64_t userId;
@property (retain, nonatomic) NSString *idstr;
@property (retain, nonatomic) NSString *screenName;
@property (retain, nonatomic) NSString *name;
@property (assign, nonatomic) int province;
@property (assign, nonatomic) int city;
@property (retain, nonatomic) NSString *location;
@property (retain, nonatomic) NSString *description;
@property (retain, nonatomic) NSString *url;
@property (retain, nonatomic) NSString *profileImageURL;
@property (retain, nonatomic) NSString *profileURL;
@property (retain, nonatomic) NSString *domain;
@property (retain, nonatomic) NSString *weihao;
@property (retain, nonatomic) NSString *gender;
@property (assign, nonatomic) int followersCount;
@property (assign, nonatomic) int friendsCount;
@property (assign, nonatomic) int statusesCount;
@property (assign, nonatomic) int favouritesCount;
@property (retain, nonatomic) NSString *createdAt;
@property (assign, nonatomic) BOOL allowAllActMsg;
@property (assign, nonatomic) BOOL geoEnabled;
@property (assign, nonatomic) BOOL verified;
@property (retain, nonatomic) NSString *remark;
@property (retain, nonatomic) LMWeibo *status;
@property (assign, nonatomic) BOOL allowAllComment;
@property (retain, nonatomic) NSString *avatarLarge;
@property (retain, nonatomic) NSString *avatarHD;
@property (retain, nonatomic) NSString *verifiedReason;
@property (assign, nonatomic) BOOL followMe;
@property (assign, nonatomic) int onlineStatus;
@property (assign, nonatomic) int biFollowersCount;
@property (retain, nonatomic) NSString *lang;

- (id)initWithAttribute:(NSDictionary *)attribute;

@end
