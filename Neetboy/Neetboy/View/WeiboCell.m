//
//  WeiboCell.m
//  Neetboy
//
//  Created by lide on 14-5-7.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "WeiboCell.h"
#import "UIImageView+WebCache.h"
#import "LMUser.h"

#define kImageViewTag 88213

@implementation WeiboCell

@synthesize weibo = _weibo;

@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = [UIColor whiteColor];
        _backgroundView.layer.borderWidth = 1.0;
        _backgroundView.layer.borderColor = [UIColor blackColor].CGColor;
        [self addSubview:_backgroundView];
        
        _avatarView = [[AvatarView alloc] init];
        _avatarView.backgroundColor = [UIColor whiteColor];
        _avatarView.layer.borderWidth = 1.0;
        _avatarView.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _avatarView.delegate = self;
        [_backgroundView addSubview:_avatarView];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor darkGrayColor];
        _nameLabel.font = [UIFont systemFontOfSize:13.0f];
        [_backgroundView addSubview:_nameLabel];
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.textColor = [UIColor darkGrayColor];
        _timeLabel.font = [UIFont systemFontOfSize:10.0f];
        [_backgroundView addSubview:_timeLabel];
        
        _textLabel = [[UILabel alloc] init];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.font = [UIFont systemFontOfSize:14.0f];
        _textLabel.numberOfLines = 0;
        [_backgroundView addSubview:_textLabel];
        
        _retweetBackgroundView = [[UIView alloc] init];
        _retweetBackgroundView.backgroundColor = [UIColor whiteColor];
        _retweetBackgroundView.layer.borderWidth = 1.0f;
        _retweetBackgroundView.layer.borderColor = [UIColor grayColor].CGColor;
        [_backgroundView addSubview:_retweetBackgroundView];
        
        _retweetAvatarView = [[AvatarView alloc] init];
        _retweetAvatarView.backgroundColor = [UIColor whiteColor];
        _retweetAvatarView.layer.borderWidth = 1.0;
        _retweetAvatarView.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _retweetAvatarView.delegate = self;
        [_retweetBackgroundView addSubview:_retweetAvatarView];
        
        _retweetNameLabel = [[UILabel alloc] init];
        _retweetNameLabel.backgroundColor = [UIColor clearColor];
        _retweetNameLabel.textColor = [UIColor darkGrayColor];
        _retweetNameLabel.font = [UIFont systemFontOfSize:13.0f];
        [_retweetBackgroundView addSubview:_retweetNameLabel];
        
        _retweetTimeLabel = [[UILabel alloc] init];
        _retweetTimeLabel.backgroundColor = [UIColor clearColor];
        _retweetTimeLabel.textColor = [UIColor darkGrayColor];
        _retweetTimeLabel.font = [UIFont systemFontOfSize:10.0f];
        [_retweetBackgroundView addSubview:_retweetTimeLabel];
        
        _retweetTextLabel = [[UILabel alloc] init];
        _retweetTextLabel.backgroundColor = [UIColor clearColor];
        _retweetTextLabel.textColor = [UIColor blackColor];
        _retweetTextLabel.font = [UIFont systemFontOfSize:14.0f];
        _retweetTextLabel.numberOfLines = 0;
        [_retweetBackgroundView addSubview:_retweetTextLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setWeibo:(LMWeibo *)weibo
{
    if(_weibo != nil)
    {
        LM_SAFE_RELEASE(_weibo);
    }
    _weibo = [weibo retain];
    
    CGFloat height = [weibo heightForRow];
    CGRect textRect = CGRectZero;
    
    _backgroundView.frame = CGRectMake(5, 5, 310, height - 10);
    
    for(UIView *view in _backgroundView.subviews)
    {
        if(view.tag >= kImageViewTag)
        {
            [view removeFromSuperview];
        }
    }
    
    _avatarView.frame = CGRectMake(5, 5, 25, 25);
    [_avatarView setImageWithURL:[NSURL URLWithString:weibo.user.profileImageURL]];
    _avatarView.user = weibo.user;
    
    _nameLabel.frame = CGRectMake(_avatarView.frame.origin.x + _avatarView.frame.size.width + 5, _avatarView.frame.origin.y, 270, 15);
    _nameLabel.text = weibo.user.name;
    
    _timeLabel.frame = CGRectMake(_avatarView.frame.origin.x + _avatarView.frame.size.width + 5, _nameLabel.frame.origin.y + _nameLabel.frame.size.height, 270, 10);
    _timeLabel.text = weibo.createdAt;
    
    textRect = [weibo.text boundingRectWithSize:CGSizeMake(300, 600)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{
                                                  
                                                  NSFontAttributeName : [UIFont systemFontOfSize:14.0f]
                                                  
                                                  }
                                        context:nil];
    _textLabel.frame = CGRectMake(_avatarView.frame.origin.x, _avatarView.frame.origin.y + _avatarView.frame.size.height + 5, 300, textRect.size.height);
    _textLabel.text = weibo.text;
    
    if(weibo.picURLs && weibo.picURLs.count > 1)
    {
        for(NSUInteger i = 0; i < weibo.picURLs.count; i++)
        {
            NSDictionary *dict = [weibo.picURLs objectAtIndex:i];
            
            NSUInteger row = i / 3;
            NSUInteger col = i % 3;
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5 + col * 95, _textLabel.frame.origin.y + _textLabel.frame.size.height + 5 + row * 95, 90, 90)];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.layer.masksToBounds = YES;
            imageView.layer.borderWidth = 1.0;
            imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            NSString *string = [dict objectForKey:@"thumbnail_pic"];
//            string = [string stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
            [imageView setImageWithURL:[NSURL URLWithString:string]];
            imageView.tag = kImageViewTag + i;
            [_backgroundView addSubview:imageView];
        }
    }
    else if(weibo.picURLs && weibo.picURLs.count == 1)
    {
        if(weibo.onePictureHeight <= 0)
        {
            NSDictionary *dict = [weibo.picURLs objectAtIndex:0];
            
            __block id selfReference = self;
            NSString *string = [dict objectForKey:@"thumbnail_pic"];
            string = [string stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
            [[SDWebImageManager sharedManager] downloadWithURL:[NSURL URLWithString:string]
                                                       options:SDWebImageLowPriority
                                                      progress:^(NSUInteger receivedSize, long long expectedSize) {
                                                          
                                                      } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished) {
                                                          
                                                          if(image != nil)
                                                          {
                                                              weibo.onePictureHeight = image.size.height * (_backgroundView.frame.size.width - 10) / image.size.width;
                                                              if(_delegate && [_delegate respondsToSelector:@selector(weiboCellUpdateOnePictureHeight:)])
                                                              {
                                                                  [_delegate weiboCellUpdateOnePictureHeight:selfReference];
                                                              }
                                                          }
                                                          
                                                      }];
        }
        else
        {
            NSDictionary *dict = [weibo.picURLs objectAtIndex:0];

            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, _textLabel.frame.origin.y + _textLabel.frame.size.height + 5, _backgroundView.frame.size.width - 10, weibo.onePictureHeight)];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.layer.masksToBounds = YES;
            imageView.layer.borderWidth = 1.0;
            imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
            NSString *string = [dict objectForKey:@"thumbnail_pic"];
            string = [string stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
            [imageView setImageWithURL:[NSURL URLWithString:string]];
            imageView.tag = kImageViewTag;
            [_backgroundView addSubview:imageView];
        }
    }
    
    if(weibo.retweetedStatus == nil)
    {
        _retweetBackgroundView.hidden = YES;
    }
    else
    {
        _retweetBackgroundView.hidden = NO;
        
        _retweetBackgroundView.frame = CGRectMake(5, _textLabel.frame.origin.y + _textLabel.frame.size.height + 5, 300, _backgroundView.frame.size.height - _textLabel.frame.origin.y - _textLabel.frame.size.height - 10);
        
        for(UIView *view in _retweetBackgroundView.subviews)
        {
            if(view.tag >= kImageViewTag)
            {
                [view removeFromSuperview];
            }
        }
        
        _retweetAvatarView.frame = CGRectMake(5, 5, 25, 25);
        [_retweetAvatarView setImageWithURL:[NSURL URLWithString:weibo.retweetedStatus.user.profileImageURL]];
        _retweetAvatarView.user = weibo.retweetedStatus.user;
        
        _retweetNameLabel.frame = CGRectMake(_retweetAvatarView.frame.origin.x + _retweetAvatarView.frame.size.width + 5, _retweetAvatarView.frame.origin.y, 260, 15);
        _retweetNameLabel.text = weibo.retweetedStatus.user.name;
        
        _retweetTimeLabel.frame = CGRectMake(_retweetAvatarView.frame.origin.x + _retweetAvatarView.frame.size.width + 5, _retweetNameLabel.frame.origin.y + _retweetNameLabel.frame.size.height, 260, 10);
        _retweetTimeLabel.text = weibo.retweetedStatus.createdAt;
        
        textRect = [weibo.retweetedStatus.text boundingRectWithSize:CGSizeMake(290, 600)
                                                            options:NSStringDrawingUsesLineFragmentOrigin
                                                         attributes:@{
                                                                      
                                                                      NSFontAttributeName : [UIFont systemFontOfSize:14.0f]
                                                                      
                                                                      }
                                                            context:nil];
        _retweetTextLabel.frame = CGRectMake(_retweetAvatarView.frame.origin.x, _retweetTimeLabel.frame.origin.y + _retweetTimeLabel.frame.size.height + 5, 290, textRect.size.height);
        _retweetTextLabel.text = weibo.retweetedStatus.text;
        
        if(weibo.retweetedStatus.picURLs && weibo.retweetedStatus.picURLs.count > 1)
        {
            for(NSUInteger i = 0; i < weibo.retweetedStatus.picURLs.count; i++)
            {
                NSDictionary *dict = [weibo.retweetedStatus.picURLs objectAtIndex:i];
                
                NSUInteger row = i / 3;
                NSUInteger col = i % 3;
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5 + col * 95, _retweetTextLabel.frame.origin.y + _retweetTextLabel.frame.size.height + 5 + row * 95, 90, 90)];
                imageView.contentMode = UIViewContentModeScaleAspectFill;
                imageView.layer.masksToBounds = YES;
                imageView.layer.borderWidth = 1.0;
                imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
                NSString *string = [dict objectForKey:@"thumbnail_pic"];
//                string = [string stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
                [imageView setImageWithURL:[NSURL URLWithString:string]];
                imageView.tag = kImageViewTag + i;
                [_retweetBackgroundView addSubview:imageView];
            }
        }
        else if(weibo.retweetedStatus.picURLs && weibo.retweetedStatus.picURLs.count == 1)
        {
            if(weibo.onePictureHeight <= 0)
            {
                NSDictionary *dict = [weibo.retweetedStatus.picURLs objectAtIndex:0];
                
                __block id selfReference = self;
                NSString *string = [dict objectForKey:@"thumbnail_pic"];
                string = [string stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
                [[SDWebImageManager sharedManager] downloadWithURL:[NSURL URLWithString:string]
                                                           options:SDWebImageLowPriority
                                                          progress:^(NSUInteger receivedSize, long long expectedSize) {
                                                              
                                                          } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished) {
                                                              
                                                              if(image != nil)
                                                              {
                                                                  weibo.onePictureHeight = image.size.height * (_retweetBackgroundView.frame.size.width - 10) / image.size.width;
                                                                  if(_delegate && [_delegate respondsToSelector:@selector(weiboCellUpdateOnePictureHeight:)])
                                                                  {
                                                                      [_delegate weiboCellUpdateOnePictureHeight:selfReference];
                                                                  }
                                                              }
                                                              
                                                          }];
            }
            else
            {
                NSDictionary *dict = [weibo.retweetedStatus.picURLs objectAtIndex:0];
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, _retweetTextLabel.frame.origin.y + _retweetTextLabel.frame.size.height + 5, _retweetBackgroundView.frame.size.width - 10, weibo.onePictureHeight)];
                imageView.contentMode = UIViewContentModeScaleAspectFill;
                imageView.layer.masksToBounds = YES;
                imageView.layer.borderWidth = 1.0;
                imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
                NSString *string = [dict objectForKey:@"thumbnail_pic"];
                string = [string stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
                [imageView setImageWithURL:[NSURL URLWithString:string]];
                imageView.tag = kImageViewTag;
                [_retweetBackgroundView addSubview:imageView];
            }
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - AvatarViewDelegate

- (void)avatarViewDidTap:(AvatarView *)avatarView
{
    if(avatarView.user != nil)
    {
        if(_delegate && [_delegate respondsToSelector:@selector(weiboCellDidTapAvatar:)])
        {
            [_delegate weiboCellDidTapAvatar:avatarView.user];
        }
    }
}

@end
