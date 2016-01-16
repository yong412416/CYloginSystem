//
//  CYGameOverViewController.h
//  CYloginSystem
//
//  Created by qianfeng on 15/12/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYGameOverViewController : UIViewController

@property(nonatomic, copy)NSString *titleLable;

@property(nonatomic, assign)int score;

@property(nonatomic, assign)NSInteger time;
// 边长
@property(nonatomic, assign)NSInteger side;
//透明度
@property(nonatomic, assign)CGFloat clarity;
// 判断是否
@property(nonatomic, assign)BOOL tag;

@property(nonatomic, copy)NSString *gameTitle;

@end
