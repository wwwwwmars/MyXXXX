//
//  DengLuViewController.m
//  Daxiangmu
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "DengLuViewController.h"
#import<BmobSDK/Bmob.h>
#import "AppDelegate.h"

@interface DengLuViewController ()
@property (strong, nonatomic) IBOutlet UITextField *zhuhuTf;
@property (strong, nonatomic) IBOutlet UITextField *MimaTf;

@property (strong, nonatomic) IBOutlet UIButton *dengluBt;
@end

@implementation DengLuViewController
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)logIn:(id)sender {
    
    [BmobUser loginInbackgroundWithAccount:self.zhuhuTf.text andPassword:self.MimaTf.text block:^(BmobUser *user, NSError *error) {
        
        if (user) {
            //添加显示首页的代码
            AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [app showHomeVC];
        }
        
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                //确定时做的事
            }];
            
            [alert addAction:cancel];
            [alert addAction:confirm];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    

    
    
    
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
