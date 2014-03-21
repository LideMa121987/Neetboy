//
//  BaseViewController.m
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)init
{
    self = [super init];
    if(self != nil)
    {
    
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _adjustView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 64 - self.view.frame.origin.y)];
    _adjustView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_adjustView];
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, _adjustView.frame.size.height - 44, 320, 44)];
    _headView.backgroundColor = [UIColor whiteColor];
    _headView.layer.borderWidth = 1.0;
    _headView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    [_adjustView addSubview:_headView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:_headView.bounds];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [_headView addSubview:_titleLabel];
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
