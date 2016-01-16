//
//  CYScoreModel.h
//  CYloginSystem
//
//  Created by qianfeng on 16/1/12.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYScoreModel : NSObject
/*
 UIButton *buttonSutra;
 UIButton *buttonArcade;
 UIButton *buttonViolent;
 */

// 经典模式成绩
@property(nonatomic, assign)NSInteger sutraScore;
//  街机模式成绩
@property(nonatomic, assign)NSInteger  arcadeScore;
// 暴力模式成绩
@property(nonatomic, assign)NSInteger violentScore;

@end

