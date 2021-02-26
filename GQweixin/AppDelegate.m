//
//  AppDelegate.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/1/28.
//

#import "AppDelegate.h"
#import "GQFrameController.h"
#import "GQHomeTableViewController.h"
#import "GQContactViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor greenColor];
    
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [GQFrameController new];
    [self setupNavBar];
    // Override point for customization after application launch.
    return YES;
}

- (void)setupNavBar{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UINavigationBar *navBar = [UINavigationBar appearance];
    CGFloat rgb = 0.1;
    navBar.barTintColor = [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:0.9];
    navBar.tintColor = [UIColor whiteColor];
    navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    //NSLog(@"start");
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
    UITabBarController *tabViewController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *nav = tabViewController.selectedViewController;
    UIViewController *childViewController = [nav.childViewControllers lastObject];
    if ([childViewController isKindOfClass:[GQContactViewController class]]) {
        GQContactViewController *contactViewController = (GQContactViewController *)childViewController;
    }
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - UISceneSession lifecycle
/*
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}
*/

@end
