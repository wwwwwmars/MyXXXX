//
//  MainTabBarController.m
//  Daxiangmu
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationViewController.h"
#import "HotQuestionTableViewController.h"
#import "HotWorkTableViewController.h"
#import "FMTableViewController.h"
#import "FriendTableViewController.h"
#import "MessageTableViewController.h"
#import "MakeTableViewController.h"
#import "MapViewController.h"


@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
       HotQuestionTableViewController *hqVc = [HotQuestionTableViewController new];
        HotWorkTableViewController *hwVc = [HotWorkTableViewController new];
        FMTableViewController *fmVc = [FMTableViewController new];
        FriendTableViewController *fVc = [FriendTableViewController new];
        MapViewController *mpVc = [MapViewController new];
        MakeTableViewController *mkVc = [MakeTableViewController new];
        MessageTableViewController *mgVc = [MessageTableViewController new];
    
    
    
    fmVc.title = @"朋友圈";
      mgVc.title = @"消息列表";
      fVc.title = @"好友列表";
       mpVc.title = @"位置服务";
    hqVc.title = @"热门问题";
    hwVc.title = @"热门项目";
    mkVc.title = @"设置页面";
    
        self.viewControllers = @[[[MainNavigationViewController alloc]initWithRootViewController:fmVc],[[MainNavigationViewController alloc]initWithRootViewController:mgVc],[[MainNavigationViewController alloc]initWithRootViewController:fVc],[[MainNavigationViewController alloc]initWithRootViewController:mpVc],[[MainNavigationViewController alloc]initWithRootViewController:hqVc],[[MainNavigationViewController alloc]initWithRootViewController:hwVc],[[MainNavigationViewController alloc]initWithRootViewController:mkVc]];
    
    
    
    
    
    self.tabBar.hidden = YES;

    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
