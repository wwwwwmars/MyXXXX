//
//  LoginViewController.m
//  Daxiangmu
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LoginViewController.h"
#import "DengLuViewController.h"
#import "ZhuceViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (IBAction)toDenglu:(UIButton *)sender {
    DengLuViewController *dl=[[DengLuViewController alloc]init];
    [self presentViewController:dl animated:YES completion:nil];
    
    
}
- (IBAction)ToZhuce:(id)sender {
    ZhuceViewController *zc=[[ZhuceViewController alloc]init];
    [self presentViewController:zc animated:YES completion:nil];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
