//
//  LMGeo.h
//  Neetboy
//
//  Created by lide on 14-5-7.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "LMObject.h"

@interface LMGeo : LMObject
{
    NSString        *_longitude;
    NSString        *_latitude;
    NSString        *_city;
    NSString        *_province;
    NSString        *_cityName;
    NSString        *_provinceName;
    NSString        *_address;
    NSString        *_pinyin;
    NSString        *_more;
}

@property (retain, nonatomic) NSString *longitude;
@property (retain, nonatomic) NSString *latitude;
@property (retain, nonatomic) NSString *city;
@property (retain, nonatomic) NSString *province;
@property (retain, nonatomic) NSString *cityName;
@property (retain, nonatomic) NSString *provinceName;
@property (retain, nonatomic) NSString *address;
@property (retain, nonatomic) NSString *pinyin;
@property (retain, nonatomic) NSString *more;

- (id)initWithAttribute:(NSDictionary *)attribute;

@end
