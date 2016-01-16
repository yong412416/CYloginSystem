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
#import "CYScoreModel.h"
#import "CYDatabaseMessage.h"

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

- (void) viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    CYScoreModel *model = [[CYDatabaseMessage sharedManager] allScore];
    if ([self.gameTitle isEqualToString:@"经典模式"]) {
        if (self.score > model.sutraScore) {
            model.sutraScore = self.score;
            [[CYDatabaseMessage sharedManager] updateScore:model];
            self.labelScore.text = [NSString stringWithFormat:@"恭喜, 创造了新的记录找出了%zd个色块",self.score];
        }else{
            self.labelScore.text = [NSString stringWithFormat:@"共找出色块个数为%d,  最佳记录为%zd",self.score,model.sutraScore];
        }
        
    }
    if ([self.gameTitle isEqualToString:@"暴力模式"]) {
        if (!model.violentScore) {
            model.violentScore = 0;
        }
        if (self.score > model.violentScore) {
            model.violentScore = self.score;
            [[CYDatabaseMessage sharedManager] updateScore:model];
            self.labelScore.text = [NSString stringWithFormat:@"恭喜, 创造了新的记录找出了%d个色块",self.score];
        }else{
            self.labelScore.text = [NSString stringWithFormat:@"共找出色块个数为%d,  最佳记录为%zd",self.score,model.violentScore];
        }
    }
    if ([self.gameTitle isEqualToString:@"街机模式"]) {

        if (self.score > model.arcadeScore) {
            
            model.arcadeScore = self.score;
            
            [[CYDatabaseMessage sharedManager] updateScore:model];
            self.labelScore.text = [NSString stringWithFormat:@"恭喜, 创造了新的记录找出了%d个色块",self.score];
        }else{
            self.labelScore.text = [NSString stringWithFormat:@"共找出色块个数为%d,  最佳记录为%zd",self.score,model.arcadeScore];
        }
    }
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





- (UILabel *)labelTitle{
    if (_labelTitle == nil) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0.2*w, 0.1*h, 0.6*w, 0.15*h)];
        _labelTitle.text = self.titleLable;
        _labelTitle.textAlignment = NSTextAlignmentCenter;
        _labelTitle.font = [UIFont systemFontOfSize:self.view.bounds.size.width/20];
        _labelTitle.textColor = [UIColor redColor];
    }
    return _labelTitle;
}

- (UILabel *)labelScore{
    if (_labelScore == nil) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        _labelScore = [[UILabel alloc]initWithFrame:CGRectMake(0.15*w, 0.3*h, 0.7*w, 0.1*h)];
        
//        _labelScore.text = [NSString stringWithFormat:@"共找出图块%zd个",self.score];
        
        _labelScore.textAlignment = NSTextAlignmentCenter;
        _labelScore.font = [UIFont systemFontOfSize:self.view.bounds.size.width/30];
        _labelScore.numberOfLines =0;
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
