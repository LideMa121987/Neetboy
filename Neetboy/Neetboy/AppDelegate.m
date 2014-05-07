//
//  AppDelegate.m
//  Neetboy
//
//  Created by lide on 14-3-20.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "LoginViewController.h"

@implementation AppDelegate

@synthesize weiboUserId = _weiboUserId;
@synthesize weiboAccessToken = _weiboAccessToken;
@synthesize weiboExpirationDate = _weiboExpirationDate;

#pragma mark - private

- (void)showHomeViewController
{
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    navigationVC.navigationBarHidden = YES;
    self.window.rootViewController = navigationVC;
}

#pragma mark - super

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    
    self.weiboUserId = [[NSUserDefaults standardUserDefaults] objectForKey:@"weiboUserId"];
    self.weiboAccessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"weiboAccessToken"];
    self.weiboExpirationDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"weiboExpirationDate"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    HomeViewController *homeVC = [[HomeViewController alloc] init];
//    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
//    navigationVC.navigationBarHidden = YES;
//    self.window.rootViewController = navigationVC;
    
//    if(self.weiboAccessToken != nil && ![self.weiboAccessToken isEqualToString:@""])
//    {
//        [self showHomeViewController];
//    }
//    else
//    {
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        self.window.rootViewController = loginVC;
//    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

#pragma mark - WeiboSDKDelegate

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBProvideMessageForWeiboRequest.class])
    {
//        ProvideMessageForWeiboViewController *controller = [[[ProvideMessageForWeiboViewController alloc] init] autorelease];
//        [self.viewController presentModalViewController:controller animated:YES];
    }
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
//        NSString *title = @"发送结果";
//        NSString *message = [NSString stringWithFormat:@"响应状态: %d\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode, response.userInfo, response.requestUserInfo];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
//                                                        message:message
//                                                       delegate:nil
//                                              cancelButtonTitle:@"确定"
//                                              otherButtonTitles:nil];
//        [alert show];
//        [alert release];
    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
//        NSString *title = @"认证结果";
//        NSString *message = [NSString stringWithFormat:@"响应状态: %d\nresponse.userId: %@\nresponse.accessToken: %@\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode,[(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken], response.userInfo, response.requestUserInfo];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
//                                                        message:message
//                                                       delegate:nil
//                                              cancelButtonTitle:@"确定"
//                                              otherButtonTitles:nil];
        
        self.weiboUserId = [(WBAuthorizeResponse *)response userID];
        self.weiboAccessToken = [(WBAuthorizeResponse *)response accessToken];
        self.weiboExpirationDate = [(WBAuthorizeResponse *)response expirationDate];
        
        [[NSUserDefaults standardUserDefaults] setObject:self.weiboUserId forKey:@"weiboUserId"];
        [[NSUserDefaults standardUserDefaults] setObject:self.weiboAccessToken forKey:@"weiboAccessToken"];
        [[NSUserDefaults standardUserDefaults] setObject:self.weiboExpirationDate forKey:@"weiboExpirationDate"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        if(self.weiboAccessToken != nil && ![self.weiboAccessToken isEqualToString:@""])
        {
            [self showHomeViewController];
        }
        
//        [alert show];
//        [alert release];
    }
}

@end
