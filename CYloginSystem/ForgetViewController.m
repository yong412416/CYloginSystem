//
//  ForgetViewController.m
//  CYloginSystem
//
//  Created by qianfeng on 15/11/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ForgetViewController.h"
#import "CYGameOverViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
@interface ForgetViewController ()
{
    UIButton *imageButton;
    UIButton *hideButton;
    UIButton *submitButton;
    UIButton *undoButton;
    NSInteger _s;
    NSInteger a;
    NSInteger p;
}
@property(nonatomic,strong)UILabel *timeLabel;
//计时器用来刷新时间
@property(nonatomic,strong)NSTimer *runTimer;

@end

/* 
    难度的选择
    不同的模式()
    本地数据排行
    
 */

@implementation ForgetViewController

- (void)viewDidLoad {
    [self creatTimer];
    p = self.side;
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(backMain)];
    
    NSInteger width = (self.view.bounds.size.width)/4;
    NSInteger height = self.view.bounds.size.height;
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(width*1.25-30, height-50, width+120, 50)];
    
    self.timeLabel.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor purpleColor];
    if (!self.tag) {
        [self.view addSubview:self.timeLabel];        
    }
    
    // Do any additional setup after loading the view.
    [self playGame];
   
//    [self gameOver];
}

- (void)backMain{
    AppDelegate *appd = [UIApplication sharedApplication].delegate;
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav= [[UINavigationController alloc]initWithRootViewController:vc];
    appd.window.rootViewController = nav;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}


// 开始游戏
- (void)playGame{
    // 1. 先将原来的v移除
    UIView *view = [self.view viewWithTag:987];
    [view removeFromSuperview];
    a++;
    if (a %5 == 0) {
        p ++;
    }
     CGFloat height=[UIScreen mainScreen].bounds.size.height/p;
    CGFloat width=(self.view.bounds.size.width)/p;
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, height*p*0.8)];
    v.backgroundColor = [UIColor blackColor];
    v.tag = 987;
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    
//    v.backgroundColor = [UIColor whiteColor];
    
    int s = arc4random()%(p*p);
    CGFloat hue = ( arc4random() % 128 / 256.0 )+0.5;
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    for (int i = 0; i < p*p; i++) {
        imageButton = [[UIButton alloc]initWithFrame:CGRectMake((0.1*p/(p-1)+0.9)*width*(i%p), ((height*0.8) *(i/p)*(0.1*p/(p-1)+0.9)), width*0.9, height*0.72)];
        if (i == s ) {
            imageButton.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:(0.8+self.clarity*a*0.01)];
            [imageButton addTarget:self action:@selector(playGame) forControlEvents:UIControlEventTouchDown];
        }else{ 
            imageButton.backgroundColor = [ UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
            if (self.tag) {
                [imageButton addTarget:self action:@selector(gameOver) forControlEvents:UIControlEventTouchDown];
                if (a>20) {
                    [self gameOver];
                }
            }
        }
        [v addSubview:imageButton];
    }
    [self.view addSubview:v];
}

- (void)creatTimer{
    [self.runTimer setFireDate:[NSDate distantPast]];
    self.runTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//    [self.runTimer setFireDate:[NSDate distantFuture]];
    
}
- (void)hange{
    _s = self.time;
}
- (void)timerAction{
    
        if (++_s>=self.time) {
            _s=0;
            if (!self.tag) {
                [self gameOver];
            }
            
        }
    self.timeLabel.text=[NSString stringWithFormat:@"剩余时间%02zd",self.time-_s];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)gameOver{
    CYGameOverViewController *gameOver = [[CYGameOverViewController alloc]init];
    /*
     @property(nonatomic, assign)NSInteger time;
     // 边长
     @property(nonatomic, assign)NSInteger side;
     //透明度
     @property(nonatomic, assign)CGFloat clarity;
     // 判断是否
     @property(nonatomic, assign)BOOL tag;
     
     @property(nonatomic, copy)NSString *gameTitle;
     */
    gameOver.titleLable = self.gameTitle;
    gameOver.score = a-1;
    gameOver.time = self.time;
    gameOver.side = self.side;
    gameOver.tag = self.tag;
    gameOver.gameTitle = self.gameTitle;
    gameOver.clarity = self.clarity;
    [self.navigationController pushViewController:gameOver animated:NO];
}

- (void)viewDidDisappear:(BOOL)animated{
    [self.runTimer invalidate];
}


@end
