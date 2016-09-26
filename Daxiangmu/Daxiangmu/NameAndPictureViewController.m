//
//  NameAndPictureViewController.m
//  Daxiangmu
//
//  Created by tarena on 16/8/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NameAndPictureViewController.h"
#import <MBProgressHUD.h>
#import "UIButton+WebCache.h"
#import <BmobSDK/Bmob.h>

@interface NameAndPictureViewController ()<UINavigationBarDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *NickTf;
@property (weak, nonatomic) IBOutlet UIButton *headBt;
@property (nonatomic, strong)NSData *imageData;
@end

@implementation NameAndPictureViewController

- (IBAction)click:(id)sender {
    UIImagePickerController *vc = [[UIImagePickerController alloc]init];
    vc.delegate =self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self.headBt setImage:image forState:UIControlStateNormal];
    
    
    if ([[info[UIImagePickerControllerReferenceURL] description] hasSuffix:@"PNG"]) {
        self.imageData = UIImagePNGRepresentation(image);
    }else{
        self.imageData = UIImageJPEGRepresentation(image, .5);
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    
    NSString *nick = [[BmobUser currentUser]objectForKey:@"nick"];
    if (nick.length>0) {
        self.NickTf.text = nick;
    }
    
    NSString *headPath = [[BmobUser currentUser]objectForKey:@"headPath"];
    if (headPath) {
        [self.headBt sd_setImageWithURL:[NSURL URLWithString:headPath] forState:UIControlStateNormal];
    }
    


}

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doneAction{
    
    BmobUser *user = [BmobUser currentUser];
    
    [user setObject:self.NickTf.text forKey:@"nick"];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    
    if (self.imageData) {
        //如果有图片 先上传图片 再保存数据
        
        [BmobFile filesUploadBatchWithDataArray:@[@{@"filename":@"abc.jpg",@"data":self.imageData}] progressBlock:^(int index, float progress) {
            hud.progress = progress;
            NSLog(@"进度：%d-%f",index,progress);
        } resultBlock:^(NSArray *array, BOOL isSuccessful, NSError *error) {
            [hud hideAnimated:YES];
            if (isSuccessful) {
                //得到上传完成的图片地址
                BmobFile *file = [array firstObject];
                
                
                
                
                [user setObject:file.url forKey:@"headPath"];
                
                //更新数据
                [user updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
                    
                    
                    [self dismissViewControllerAnimated:YES completion:nil];
                    
                }];
                
            }
            
            
        }];
        
        
    }else{
        
        //更新数据
        [user updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
            
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }];
        
        
    }
    
    
    
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
