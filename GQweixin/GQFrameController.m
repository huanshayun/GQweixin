//
//  GQFrameController.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//

#import "GQFrameController.h"
#import "GQHomeTableViewController.h"
#import "GQContactViewController.h"
#import "GQDiscoverTableViewController.h"
#import "GQMineTableViewController.h"

@implementation GQFrameController

- (void)viewDidLoad{
    [super viewDidLoad];
    NSArray *itemView = @[
        @{@"itemViewController" : @"GQHomeTableViewController",
          @"title" : @"微信",
          @"image" : @"tabBar_home",
          @"imageSelected" : @"tabBar_home_selected"},
        
        @{@"itemViewController" : @"GQContactViewController",
          @"title" : @"通讯录",
          @"image" : @"tabBar_contacts",
          @"imageSelected" : @"tabBar_contacts_selected"},
        
        @{@"itemViewController" : @"GQDiscoverTableViewController",
          @"title" : @"发现",
          @"image" : @"tabBar_discover",
          @"imageSelected" : @"tabBar_discover_selected"},
        
        @{@"itemViewController" : @"GQMineTableViewController",
          @"title" : @"我",
          @"image" : @"tabBar_mine",
          @"imageSelected" : @"tabBar_mine_selected"}
    ];
    
    [itemView enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *viewController = [NSClassFromString(dict[@"itemViewController"]) new];
        viewController.title = dict[@"title"];
        
        UINavigationController *viewNv = [[UINavigationController alloc] initWithRootViewController:viewController];
        UITabBarItem *item = viewNv.tabBarItem;
        item.title = dict[@"title"];
        item.image = [UIImage imageNamed:dict[@"image"]];
        item.selectedImage = [[UIImage imageNamed:dict[@"imageSelected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]} forState:UIControlStateSelected];
        [self addChildViewController:viewNv];
    }];
}
@end
