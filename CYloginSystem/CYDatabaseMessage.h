//
//  CYDatabaseMessage.h
//  CYloginSystem
//
//  Created by qianfeng on 16/1/12.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "FMDatabase.h"
@class CYScoreModel;
@interface CYDatabaseMessage : FMDatabase

+ (instancetype) sharedManager;

- (void) addScore:(CYScoreModel*)score;

- (CYScoreModel *)allScore;

- (void) updateScore:(CYScoreModel *)score;

@end
