//
//  Snake.m
//  she
//
//  Created by tarena on 16/9/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "Snake.h"

@implementation Snake
-(instancetype)initWithView:(UIView *)view;
{
    self=[super init];
    if (self) {
        self.speed=10;
        self.length=10;
        self.size=10;
        self.xOffset=1;
        self.body=[NSMutableArray array];
        for (int i=0; i<self.length; i++) {
            UIView *bView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.size, self.size)];
            bView.center=CGPointMake(100+i*5, 100);
            bView.backgroundColor=[UIColor redColor];
            bView.layer.cornerRadius=bView.bounds.size.width/2;
            bView.layer.masksToBounds=YES;
            [view addSubview:bView];
            [self.body addObject:bView];
            }
        [NSTimer scheduledTimerWithTimeInterval:.08 target:self selector:@selector(moveAction) userInfo:nil repeats:YES];
        
    }
    return self;
}

-(void)moveAction{
    UIView *headView=[self.body lastObject];
    CGPoint headCenter=headView.center;
    headCenter=CGPointMake(headCenter.x+self.xOffset*self.speed, headCenter.y+self.yOffset*self.speed);
    
    [UIView animateWithDuration:.2 animations:^{
        headView.center=headCenter;    }];
    
    for (int i=0; i<self.body.count-1; i++) {
        UIView *b1=self.body[i];
        UIView *b2=self.body[i+1];
        [UIView animateWithDuration:.2 animations:^{
            b1.center=b2.center;
        }];
    }
    
    
}

-(void)addBodyWithFoods:(UIView *)food;
{
    food.layer.cornerRadius=food.bounds.size.width/2;
    food.layer.masksToBounds=YES;
    
    UIView *headView=[self.body lastObject];
    
    food.center=CGPointMake(headView.center.x+self.speed*self.xOffset, headView.center.y+self.speed*self.yOffset);
    
    [self.body addObject:food];
    
    
    
}




@end
