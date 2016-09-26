//
//  AppDelegate.h
//  Daxiangmu
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic,strong)MainTabBarController *tabbarController;
@property (strong, nonatomic) UIWindow *window;

-(void)showHomeVC;
@end

