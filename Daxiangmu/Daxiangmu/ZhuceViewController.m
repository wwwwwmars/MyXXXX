//
//  ZhuceViewController.m
//  Daxiangmu
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ZhuceViewController.h"
#import <BmobSDK/Bmob.h>
#import "AppDelegate.h"

@interface ZhuceViewController ()
@property (strong, nonatomic) IBOutlet UITextField *zhuanghuTF;
@property (strong, nonatomic) IBOutlet UITextField *mimaTF;
@property (strong, nonatomic) IBOutlet UIButton *ZhuceBt;

@property (nonatomic,strong)BmobUser *user;

@end
extern NSString *DidLoginWeiboNotification;

@implementation ZhuceViewController
- (IBAction)click:(id)sender {
    BmobUser *user = [[BmobUser alloc]init];
    
    user.username = self.zhuanghuTF.text;
    user.password = self.mimaTF.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            
            AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication];
            [app showHomeVC];
        }
        else{
            NSLog(@"%@",error);
            
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
