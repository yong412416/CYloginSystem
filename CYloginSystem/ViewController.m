//
//  ViewController.m
//  CYloginSystem
//
//  Created by qianfeng on 15/11/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"


#import "ForgetViewController.h"
/** 屏幕的宽高 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
{

    UIButton *buttonSutra;
    UIButton *buttonArcade;
    UIButton *buttonViolent;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    
    buttonSutra = [[UIButton alloc]initWithFrame:CGRectMake(w/2-90, SCREEN_HEIGHT*0.2, 180, 80)];
    buttonArcade = [[UIButton alloc] initWithFrame:CGRectMake(w/2-90, SCREEN_HEIGHT*0.4, 180, 80)];
    buttonViolent = [[UIButton alloc] initWithFrame:CGRectMake(w/2-90, SCREEN_HEIGHT*0.6, 180, 80)];
    
    [buttonSutra setTitle:@"经典模式" forState:UIControlStateNormal];
    [buttonArcade setTitle:@"街机模式" forState:UIControlStateNormal];
    [buttonViolent setTitle:@"暴力模式" forState:UIControlStateNormal];
    
    buttonSutra.titleLabel.font = [UIFont systemFontOfSize:42];
    buttonArcade.titleLabel.font = [UIFont systemFontOfSize:42];
    buttonViolent.titleLabel.font = [UIFont systemFontOfSize:42];
    
    [buttonSutra setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonArcade setTitleColor:[UIColor purpleColor]forState:UIControlStateNormal];
    [buttonViolent setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
//    [button2 setBackgroundColor:[UIColor purpleColor]];
    

    [buttonSutra addTarget:self action:@selector(forget) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor whiteColor];
    [buttonViolent addTarget:self action:@selector(violenceGame) forControlEvents:(UIControlEventTouchUpInside)];
    [buttonArcade addTarget:self action:@selector(arcadeGame) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"game"]];
    [self.view addSubview:buttonArcade];
    [self.view addSubview:buttonSutra];
    [self.view addSubview:buttonViolent];
}

- (void)forget{
    ForgetViewController *forget = [[ForgetViewController alloc]init];
    forget.time = 30;
    forget.side = 2;
    forget.tag = NO;
    forget.clarity = 0.6;
    forget.gameTitle = buttonSutra.titleLabel.text;
    [self.navigationController pushViewController:forget animated:YES];
}

- (void)violenceGame{
    ForgetViewController *forget = [[ForgetViewController alloc]init];
    forget.time = 30;
    forget.side = 6;
    forget.tag = NO;
    forget.clarity = 0.4;
    forget.gameTitle = buttonViolent.titleLabel.text;
    [self.navigationController pushViewController:forget animated:YES];

}

- (void)arcadeGame{
    ForgetViewController *forget = [[ForgetViewController alloc]init];
    forget.time = 90;
    forget.side = 2;
    forget.tag = YES;
    forget.clarity = 0.4;
    forget.gameTitle = buttonArcade.titleLabel.text;
    [self.navigationController pushViewController:forget animated:YES];
}


@end
