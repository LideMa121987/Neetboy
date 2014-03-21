//
//  GridView.m
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "GridView.h"

@implementation GridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _view1 = [[UIView alloc] initWithFrame:CGRectMake(2, 2, 40, 40)];
        _view1.backgroundColor = [UIColor whiteColor];
        _view1.layer.borderWidth = 1.0;
        _view1.layer.borderColor = [UIColor blackColor].CGColor;
        [self addSubview:_view1];
        
        _view2 = [[UIView alloc] initWithFrame:CGRectMake(2, self.frame.size.height - 22, self.frame.size.width - 4, 20)];
        _view2.backgroundColor = [UIColor whiteColor];
        _view2.layer.borderWidth = 1.0;
        _view2.layer.borderColor = [UIColor blackColor].CGColor;
        [self addSubview:_view2];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    _view2.frame = CGRectMake(2, self.frame.size.height - 22, self.frame.size.width - 4, 20);
    [self addSubview:_view2];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
