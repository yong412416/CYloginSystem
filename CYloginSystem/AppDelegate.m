//
//  AppDelegate.m
//  CYloginSystem
//
//  Created by qianfeng on 15/11/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self navigationContoller];
    
    return YES;
}

- (void)navigationContoller{
    
    ViewController *vierc = [[ViewController alloc]init];
    UINavigationController *nviewc = [[UINavigationController alloc]initWithRootViewController:vierc];
    self.window.rootViewController = nviewc;
    
    

}








@end
