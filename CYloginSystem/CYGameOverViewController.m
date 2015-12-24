//
//  CYGameOverViewController.m
//  CYloginSystem
//
//  Created by qianfeng on 15/12/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CYGameOverViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "ForgetViewController.h"

@interface CYGameOverViewController ()

@property (nonatomic, strong) UILabel *labelTitle;

@property (nonatomic, strong) UILabel *labelScore;

@property (nonatomic, strong) UIButton *buttonBack;

@property (nonatomic, strong) UIButton *buttonAgain;

@end

@implementation CYGameOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.labelTitle];
    [self.view addSubview:self.labelScore];
    [self.view addSubview:self.buttonAgain];
    [self.view addSubview:self.buttonBack];
    
    [self.buttonBack addTarget:self  action:@selector(backMain) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonAgain addTarget:self action:@selector(againOnce) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)againOnce{
    
    AppDelegate *appd = [UIApplication sharedApplication].delegate;
    ForgetViewController *f= [[ForgetViewController alloc]init];
    f.time = self.time;
    f.side = self.side;
    f.tag = self.tag;
    f.gameTitle = self.gameTitle;
    f.clarity = self.clarity;
    UINavigationController *nav= [[UINavigationController alloc]initWithRootViewController:f];
    appd.window.rootViewController = nav;
    
    
    
}

- (void)backMain{
    AppDelegate *appd = [UIApplication sharedApplication].delegate;
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav= [[UINavigationController alloc]initWithRootViewController:vc];
    appd.window.rootViewController = nav;
    
}



- (void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (UILabel *)labelTitle{
    if (_labelTitle == nil) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0.2*w, 0.1*h, 0.6*w, 0.15*h)];
        _labelTitle.text = self.titleLable;
        _labelTitle.textAlignment = NSTextAlignmentCenter;
        _labelTitle.font = [UIFont systemFontOfSize:42];
        _labelTitle.textColor = [UIColor redColor];
    }
    return _labelTitle;
}

- (UILabel *)labelScore{
    if (_labelScore == nil) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        _labelScore = [[UILabel alloc]initWithFrame:CGRectMake(0.15*w, 0.3*h, 0.7*w, 0.1*h)];
        
        _labelScore.text = [NSString stringWithFormat:@"共找出图块%zd个",self.score];
        _labelScore.textAlignment = NSTextAlignmentCenter;
        _labelScore.font = [UIFont systemFontOfSize:28];
        _labelScore.textColor = [UIColor blackColor];
        
    }
    return _labelScore;
}

- (UIButton *)buttonAgain{
    if (_buttonAgain == nil) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        _buttonAgain = [[UIButton alloc]initWithFrame:CGRectMake(0.1*w, 0.8*h, 0.3*w, 0.1*h)];
        [_buttonAgain setTitle:@"再试一次" forState:UIControlStateNormal];
        [_buttonAgain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _buttonAgain;
}
- (UIButton *)buttonBack{
    if (_buttonBack == nil) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        _buttonBack = [[UIButton alloc]initWithFrame:CGRectMake(0.6*w, 0.8*h, 0.3*w, 0.1*h)];
        [_buttonBack setTitle:@"返回菜单" forState:UIControlStateNormal];
        [_buttonBack setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _buttonBack;
}
@end
