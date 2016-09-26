//
//  MainViewController.m
//  Daxiangmu
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MainViewController.h"
#import "MainTabBarController.h"
#import "XHDrawerController.h"
@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UITableView *MytbVc;
@property(nonatomic,strong)NSArray *menus;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menus=@[@"朋友圈",@"消息列表",@"好友列表",@"位置服务",@"热门问题",@"热门项目",@"设置页面"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.menus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.menus[indexPath.row];
    
    
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainTabBarController *mtc = (MainTabBarController *)self.drawerController.centerViewController;
    
    mtc.selectedIndex = indexPath.row;
    
    [self.drawerController closeDrawerAnimated:YES completion:nil];
    
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
