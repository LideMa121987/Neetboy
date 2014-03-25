//
//  AudioViewController.m
//  Neetboy
//
//  Created by lide on 14-3-25.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "AudioViewController.h"

@interface AudioViewController ()

@end

@implementation AudioViewController

#pragma mark - private

- (void)clickPlayButton:(id)sender
{
    _playButton.hidden = YES;
    _pauseButton.hidden = NO;
}

- (void)clickPauseButton:(id)sender
{
    _playButton.hidden = NO;
    _pauseButton.hidden = YES;
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
    
    _titleLabel.text = @"Audio";
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _adjustView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - _adjustView.frame.size.height - 106)];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:_scrollView];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 8, 280, 160)];
    _imageView.backgroundColor = [UIColor whiteColor];
    _imageView.layer.borderWidth = 1.0;
    _imageView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    [_scrollView addSubview:_imageView];
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(18, self.view.frame.size.height - 38 - 60, 284, 31)];
    _slider.minimumValue = 0.0;
    _slider.maximumValue = 1.0;
    _slider.value = 0.5;
    _slider.minimumTrackTintColor = [UIColor darkGrayColor];
    [self.view addSubview:_slider];
    
    _favouriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _favouriteButton.frame = CGRectMake(20, self.view.frame.size.height - 60, 80, 40);
    _favouriteButton.backgroundColor = [UIColor whiteColor];
    [_favouriteButton setTitle:@"Favourite" forState:UIControlStateNormal];
    [_favouriteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _favouriteButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _favouriteButton.layer.borderWidth = 1.0;
    _favouriteButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    [self.view addSubview:_favouriteButton];
    
    _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _playButton.frame = CGRectMake(120, self.view.frame.size.height - 60, 80, 40);
    _playButton.backgroundColor = [UIColor whiteColor];
    [_playButton setTitle:@"Play" forState:UIControlStateNormal];
    [_playButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _playButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _playButton.layer.borderWidth = 1.0;
    _playButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    [_playButton addTarget:self action:@selector(clickPlayButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_playButton];
    
    _pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _pauseButton.frame = CGRectMake(120, self.view.frame.size.height - 60, 80, 40);
    _pauseButton.backgroundColor = [UIColor whiteColor];
    [_pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    [_pauseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _pauseButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _pauseButton.layer.borderWidth = 1.0;
    _pauseButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    [_pauseButton addTarget:self action:@selector(clickPauseButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pauseButton];
    _pauseButton.hidden = YES;
    
    _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _shareButton.frame = CGRectMake(220, self.view.frame.size.height - 60, 80, 40);
    _shareButton.backgroundColor = [UIColor whiteColor];
    [_shareButton setTitle:@"Share" forState:UIControlStateNormal];
    [_shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _shareButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _shareButton.layer.borderWidth = 1.0;
    _shareButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    [self.view addSubview:_shareButton];
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
