//
//  LMGeo.m
//  Neetboy
//
//  Created by lide on 14-5-7.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "LMGeo.h"

@implementation LMGeo

@synthesize longitude = _longitude;
@synthesize latitude = _latitude;
@synthesize city = _city;
@synthesize province = _province;
@synthesize cityName = _cityName;
@synthesize provinceName = _provinceName;
@synthesize address = _address;
@synthesize pinyin = _pinyin;
@synthesize more = _more;

- (id)initWithAttribute:(NSDictionary *)attribute
{
    self = [super init];
    if(self != nil)
    {
        if(attribute != nil)
        {
            self.longitude = [attribute objectForKey:@"longitude"];
            self.latitude = [attribute objectForKey:@"latitude"];
            self.city = [attribute objectForKey:@"city"];
            self.province = [attribute objectForKey:@"province"];
            self.cityName = [attribute objectForKey:@"city_name"];
            self.provinceName = [attribute objectForKey:@"province_name"];
            self.address = [attribute objectForKey:@"address"];
            self.pinyin = [attribute objectForKey:@"pinyin"];
            self.more = [attribute objectForKey:@"more"];
        }
    }
    
    return self;
}

@end
