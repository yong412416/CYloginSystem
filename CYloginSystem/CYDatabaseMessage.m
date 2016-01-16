//
//  CYDatabaseMessage.m
//  CYloginSystem
//
//  Created by qianfeng on 16/1/12.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CYDatabaseMessage.h"
#import "CYScoreModel.h"

@implementation CYDatabaseMessage

+ (instancetype)sharedManager{
    static CYDatabaseMessage *_manager = nil;
    if (_manager == nil) {
        //Document路径
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        
        _manager = [[CYDatabaseMessage alloc] initWithPath:[path stringByAppendingString:@"/data.db"]];
        [_manager open];
        
        NSLog(@"%@",path);
        
        NSString *sql = @"create table if not exists CYGame2(ID integer primary key,sutraScore integer, arcadeScore integer, violentScore integer)";
        
        if ([_manager executeUpdate:sql]) {
            NSLog(@"建表成功");
        }
            [_manager executeUpdate:@"insert into CYGame2(ID,sutraScore,arcadeScore,violentScore) values (? ,?, ?, ?)",@1,@1,@1,@1];
        
    }
    
    
    
    return _manager;
}



- (CYScoreModel *)allScore{
    NSString *sql = @"select *from CYGame2";
    FMResultSet *set = [self executeQuery:sql];
    CYScoreModel *model = [[CYScoreModel alloc] init];
    while (set.next) {
        model.sutraScore = [[set objectForColumnIndex:1] integerValue];
        model.arcadeScore = [[set objectForColumnIndex:2] integerValue];
        model.violentScore = [[set objectForColumnIndex:0] integerValue];
    }
    return model;
}

- (void)updateScore:(CYScoreModel *)score{
    NSString *sql = @"update CYGame2 set sutraScore=?,arcadeScore=?,violentScore=? where ID =1";
    if ([self executeUpdate:sql,@(score.sutraScore),@(score.arcadeScore),@(score.violentScore)]) {
        NSLog(@"修改成功");
    }else{
        NSLog(@"修改失败");
    }
}


@end
