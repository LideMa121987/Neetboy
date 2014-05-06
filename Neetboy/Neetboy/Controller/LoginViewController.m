//
//  LoginViewController.m
//  Neetboy
//
//  Created by lide on 14-5-6.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController () <WBHttpRequestDelegate>

@end

@implementation LoginViewController

#pragma mark - private

- (void)clickLoginButton:(id)sender
{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURI;
    request.scope = @"all";
//    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
//                         @"Other_Info_1": [NSNumber numberWithInt:123],
//                         @"Other_Info_2": @[@"obj1", @"obj2"],
//                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (void)clickLogoutButton:(id)sender
{
    AppDelegate *myDelegate =(AppDelegate*)[[UIApplication sharedApplication] delegate];
    [WeiboSDK logOutWithToken:myDelegate.weiboAccessToken delegate:self withTag:@"user1"];
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
    
    _loginButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    _loginButton.frame = CGRectMake(110, 259, 100, 50);
    [_loginButton setTitle:@"Weibo Login" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(clickLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    _logoutButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    _logoutButton.frame = CGRectMake(110, 317, 100, 50);
    [_logoutButton setTitle:@"Weibo Logout" forState:UIControlStateNormal];
    [_logoutButton addTarget:self action:@selector(clickLogoutButton:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_logoutButton];
    
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

#pragma mark - WBHttpRequestDelegate

- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result
{
//    NSString *title = nil;
//    UIAlertView *alert = nil;
    
//    title = @"收到网络回调";
//    alert = [[UIAlertView alloc] initWithTitle:title
//                                       message:[NSString stringWithFormat:@"%@",result]
//                                      delegate:nil
//                             cancelButtonTitle:@"确定"
//                             otherButtonTitles:nil];
//    [alert show];
//    [alert release];
    
    AppDelegate *myDelegate =(AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    myDelegate.weiboUserId = nil;
    myDelegate.weiboAccessToken = nil;
    myDelegate.weiboExpirationDate = nil;
}

- (void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error;
{
//    NSString *title = nil;
//    UIAlertView *alert = nil;
    
//    title = @"请求异常";
//    alert = [[UIAlertView alloc] initWithTitle:title
//                                       message:[NSString stringWithFormat:@"%@",error]
//                                      delegate:nil
//                             cancelButtonTitle:@"确定"
//                             otherButtonTitles:nil];
//    [alert show];
//    [alert release];
}


@end
