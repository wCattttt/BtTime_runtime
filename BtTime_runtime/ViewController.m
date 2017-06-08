//
//  ViewController.m
//  BtTime_runtime
//
//  Created by 魏唯隆 on 2017/6/5.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Timer.h"
#import "RuntimeKit.h"

@interface ViewController ()
{
    UIButton *button;
}
@end

@implementation ViewController


- (void)viewDidLoad {
    CGFloat KScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat KScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    [super viewDidLoad];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(40, 100, KScreenWidth - 80, 45);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 8;
    [button setTitle:@"点击获取验证码" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor colorWithRed:40.2f/255 green:180.2f/255 blue:247.2f/255 alpha:1];
    button.color = [UIColor colorWithRed:40.2f/255 green:180.2f/255 blue:247.2f/255 alpha:1];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button.time = @"3";
    
}

- (void)clickAction {
    
    [button startTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
