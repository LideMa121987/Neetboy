//
//  SpecialTableViewCell.m
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "SpecialTableViewCell.h"

@implementation SpecialTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(5, 2.5, 310, self.frame.size.height - 5)];
        _backgroundView.backgroundColor = [UIColor whiteColor];
        _backgroundView.layer.borderWidth = 1.0;
        _backgroundView.layer.borderColor = [UIColor darkGrayColor].CGColor;
        [self addSubview:_backgroundView];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    _backgroundView.frame = CGRectMake(5, 2.5, 310, frame.size.height - 5);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
