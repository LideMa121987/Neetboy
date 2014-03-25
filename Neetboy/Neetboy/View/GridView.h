//
//  GridView.h
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GridViewDelegate;

@interface GridView : UIView
{
    UIView      *_view1;
    UIView      *_view2;
    
    __unsafe_unretained id<GridViewDelegate>    _delegate;
}

@property (assign, nonatomic) id<GridViewDelegate> delegate;

@end

@protocol GridViewDelegate <NSObject>

- (void)gridViewDidTap:(GridView *)gridView;

@end
