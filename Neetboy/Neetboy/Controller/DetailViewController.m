//
//  DetailViewController.m
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "DetailViewController.h"

#define kButtonTag 17782

@interface DetailViewController () <UIScrollViewDelegate>

@end

@implementation DetailViewController

#pragma mark - private

- (void)clickButton:(id)sender
{
    [_scrollView setContentOffset:CGPointZero animated:YES];
//    [UIView animateWithDuration:0.2 animations:^{
//        _floatView.transform = CGAffineTransformIdentity;
//    }];
    NSUInteger index = [sender tag] - kButtonTag;
    [_pictureScrollView setContentOffset:CGPointMake(_pictureScrollView.frame.size.width * index, 0) animated:YES];
}

#pragma mark - super

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
    
    _titleLabel.text = @"Detail";
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _adjustView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - _adjustView.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, _scrollView.frame.size.height * 2);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    _pictureScrollView = [[UIScrollView alloc] initWithFrame:_scrollView.bounds];
    _pictureScrollView.contentSize = CGSizeMake(_pictureScrollView.frame.size.width * 4, _pictureScrollView.frame.size.height);
    _pictureScrollView.pagingEnabled = YES;
    [_scrollView addSubview:_pictureScrollView];
    
    _floatView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 60)];
    _floatView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_floatView];
    
    for(NSUInteger i = 0; i < 4; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = kButtonTag + i;
        button.frame = CGRectMake(10 + i * 50, 10, 40, 40);
        button.layer.borderWidth = 1.0;
        button.layer.borderColor = [UIColor darkGrayColor].CGColor;
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_floatView addSubview:button];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20 + i * _pictureScrollView.frame.size.width, 20, _pictureScrollView.frame.size.width - 40, _pictureScrollView.frame.size.height - 80)];
        view.layer.borderWidth = 1.0;
        view.layer.borderColor = [UIColor blackColor].CGColor;
        [_pictureScrollView addSubview:view];
    }
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

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.y > scrollView.frame.size.height - _floatView.frame.size.height)
    {
        _floatView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, _floatView.frame.size.height - scrollView.frame.size.height);
    }
    else if(scrollView.contentOffset.y < 0)
    {
        _floatView.transform = CGAffineTransformIdentity;
    }
    else
    {
        _floatView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, -scrollView.contentOffset.y);
    }
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    NSUInteger index = scrollView.contentOffset.y / scrollView.frame.size.height;
//    switch (index) {
//        case 0:
//        {
//            [UIView animateWithDuration:0.2 animations:^{
//                _floatView.transform = CGAffineTransformIdentity;
//            }];
//        }
//            break;
//        default:
//        {
//            [UIView animateWithDuration:0.2 animations:^{
//                _floatView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, _floatView.frame.size.height);
//            }];
//        }
//            break;
//    }
//}

@end
