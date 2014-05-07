//
//  LMUser.m
//  Neetboy
//
//  Created by lide on 14-5-7.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "LMUser.h"
#import "LMWeibo.h"

@implementation LMUser

@synthesize userId = _userId;
@synthesize idstr = _idstr;
@synthesize screenName = _screenName;
@synthesize name = _name;
@synthesize province = _province;
@synthesize city = _city;
@synthesize location = _location;
@synthesize description = _description;
@synthesize url = _url;
@synthesize profileImageURL = _profileImageURL;
@synthesize profileURL = _profileURL;
@synthesize domain = _domain;
@synthesize weihao = _weihao;
@synthesize gender = _gender;
@synthesize followersCount = _followersCount;
@synthesize friendsCount = _friendsCount;
@synthesize statusesCount = _statusesCount;
@synthesize favouritesCount = _favouritesCount;
@synthesize createdAt = _createdAt;
@synthesize allowAllActMsg = _allowAllActMsg;
@synthesize geoEnabled = _geoEnabled;
@synthesize verified = _verified;
@synthesize remark = _remark;
@synthesize status = _status;
@synthesize allowAllComment = _allowAllComment;
@synthesize avatarLarge = _avatarLarge;
@synthesize avatarHD = _avatarHD;
@synthesize verifiedReason = _verifiedReason;
@synthesize followMe = _followMe;
@synthesize onlineStatus = _onlineStatus;
@synthesize biFollowersCount = _biFollowersCount;
@synthesize lang = _lang;

- (id)initWithAttribute:(NSDictionary *)attribute
{
    self = [super init];
    if(self != nil)
    {
        if(attribute != nil)
        {
            self.userId = [[attribute objectForKey:@"id"] longLongValue];
            self.idstr = [attribute objectForKey:@"idstr"];
            self.screenName = [attribute objectForKey:@"screen_name"];
            self.name = [attribute objectForKey:@"name"];
            self.province = [[attribute objectForKey:@"province"] intValue];
            self.city = [[attribute objectForKey:@"city"] intValue];
            self.location = [attribute objectForKey:@"location"];
            self.description = [attribute objectForKey:@"description"];
            self.url = [attribute objectForKey:@"url"];
            self.profileImageURL = [attribute objectForKey:@"profile_image_url"];
            self.profileURL = [attribute objectForKey:@"profile_url"];
            self.domain = [attribute objectForKey:@"domain"];
            self.weihao = [attribute objectForKey:@"weihao"];
            self.gender = [attribute objectForKey:@"gender"];
            self.followersCount = [[attribute objectForKey:@"followers_count"] intValue];
            self.friendsCount = [[attribute objectForKey:@"friends_count"] intValue];
            self.statusesCount = [[attribute objectForKey:@"statuses_count"] intValue];
            self.favouritesCount = [[attribute objectForKey:@"favourites_count"] intValue];
            self.createdAt = [attribute objectForKey:@"created_at"];
            self.allowAllActMsg = [[attribute objectForKey:@"allow_all_act_msg"] boolValue];
            self.geoEnabled = [[attribute objectForKey:@"geo_enabled"] boolValue];
            self.verified = [[attribute objectForKey:@"verified"] boolValue];
            self.remark = [attribute objectForKey:@"remark"];
            NSDictionary *status = [attribute objectForKey:@"status"];
            if(status != nil && ![status isEqual:[NSNull null]])
            {
                self.status = [[LMWeibo alloc] initWithAttribute:status];
            }
            self.allowAllComment = [[attribute objectForKey:@"allow_all_comment"] boolValue];
            self.avatarLarge = [attribute objectForKey:@"avatar_large"];
            self.avatarHD = [attribute objectForKey:@"avatar_hd"];
            self.followMe = [[attribute objectForKey:@"follow_me"] boolValue];
            self.onlineStatus = [[attribute objectForKey:@"online_status"] intValue];
            self.biFollowersCount = [[attribute objectForKey:@"bi_followers_count"] intValue];
            self.lang = [attribute objectForKey:@"lang"];
        }
    }
    
    return self;
}

@end
