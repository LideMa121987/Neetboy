//
//  LMObject.h
//  LMCharacter
//
//  Created by lide on 14-4-22.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^LMObjectSuccessBlock)(NSArray *array);
typedef void (^LMObjectFailureBlock)(NSError *error);

@interface LMObject : NSObject <NSCoding>

@end
