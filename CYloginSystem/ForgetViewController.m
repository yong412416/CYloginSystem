//
//  ForgetViewController.m
//  CYloginSystem
//
//  Created by qianfeng on 15/11/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ForgetViewController.h"
#import "CYGameOverViewController.h"
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
    NSInteger width = (self.view.bounds.size.width)/4;
    NSInteger height = self.view.bounds.size.height;
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(width*1.25-30, height-50, width+120, 50)];
    
    self.timeLabel.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.timeLabel];
    
    // Do any additional setup after loading the view.
    [self playGame];
   
//    [self gameOver];
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
    NSInteger height=(self.view.bounds.size.height)/p;
    NSInteger width=(self.view.bounds.size.width)/p;
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, height*p-100)];
    v.tag = 987;
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    
//    v.backgroundColor = [UIColor whiteColor];
    
    int s = arc4random()%(p*p);
    CGFloat hue = ( arc4random() % 128 / 256.0 )+0.5;
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    for (int i = 0; i < p*p; i++) {
        imageButton = [[UIButton alloc]initWithFrame:CGRectMake(width*(i/p+0.025), ((height*0.83) *(i%p)), width*0.95, height*0.8)];
        if (i == s ) {
            imageButton.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:(self.clarity+0.01*a)];
            [imageButton addTarget:self action:@selector(playGame) forControlEvents:UIControlEventTouchDown];
        }else{ 
            imageButton.backgroundColor = [ UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
            if (self.tag) {
                [imageButton addTarget:self action:@selector(hange) forControlEvents:UIControlEventTouchDown];
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
            [self gameOver];
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
