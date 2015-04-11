//
//  BaseTabbarController.m
//  ZLMStaticFramework
//
//  Created by Zlm on 15-3-31.
//  Copyright (c) 2015年 zlm. All rights reserved.
//

#import "BaseTabbarController.h"
#import "SharedManage.h"
#import "AdaptiveDeviceManage.h"
@implementation BaseTabbarController
-(void)viewDidLoad
{
    
    
    
    
    
}
+(BaseTabbarController *)createCustomTabbarControllerWithTabbarName:(NSArray*)nameArr BaseViewNC:(NSArray*)baseNC TabbarNormalImage:(UIImage*)normalImage
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [[SharedManage getInstance] setMainLayer:[baseNC objectAtIndex:0]];//注册视图
    
    BaseTabbarController* tabBarVC = [[BaseTabbarController alloc]init];
    [[SharedManage getInstance] setTabbarController:tabBarVC];//注册视图
    [tabBarVC setViewControllers:baseNC];
    [[UITabBar appearance] setSelectedImageTintColor: [UIColor colorWithRed:0.2 green:0.6 blue:0.6 alpha:1]];
//    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"底栏.png"]];
    
    for (int i = 0; i < [nameArr count]; i++)
    {
        UIImageView* background = [[UIImageView alloc]initWithImage:normalImage];
        [background setCenter:ZZPoint_Foot(CGPointMake(40+i*80, 475))];
        if (i != 0)
        {
            background.hidden = YES;
        }
        background.tag = 10+i;
        [tabBarVC.view addSubview:background];
        
        UIImageView* backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[nameArr objectAtIndex:i]]]];
        [backImage setCenter:ZZPoint_Foot(CGPointMake(40+i*80, 468))];
        [tabBarVC.view addSubview:backImage];
        
        UILabel* backTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
        backTitle.text = [nameArr objectAtIndex:i];
        [backTitle setCenter:ZZPoint_Foot(CGPointMake(40+i*80, 489))];
        [backTitle setBackgroundColor:[UIColor clearColor]];
        [backTitle setTextAlignment:NSTextAlignmentCenter];
        [backTitle setFont:[UIFont fontWithName:[SharedManage getInstance].textFont size:12]];
        [backTitle setTextColor:[UIColor whiteColor]];
        [tabBarVC.view addSubview:backTitle];
    }
    return tabBarVC;
}
//+(UINavigationController *)createNavigationWithName:(NSString *)name ImagePath:(NSString *)path Target:(int)target
//{
//    UIViewController* NewVC;
//    NSString* navigationTitle;
//    switch (target)
//    {
//        case 0:
//        {
//            NewVC = [[MainViewController alloc]init];
//            navigationTitle = @"公职Get";
//        }
//            break;
//        case 1:
//        {
//            NewVC = [[PracticeViewController alloc]init];
//            navigationTitle = @"公职Get";
//        }
//            break;
//        case 2:
//        {
//            NewVC = [[FindViewController alloc]init];
//            navigationTitle = @"公职Get";
//        }
//            break;
//        case 3:
//        {
//            NewVC = [[PersonCenterController alloc]init];
//            navigationTitle = @"公职Get";
//        }
//            break;
//        default:
//            break;
//    }
//    NewVC.tabBarItem.image = [UIImage imageNamed:@"1a.png"];
//    UINavigationController* NewNC = [[UINavigationController alloc]initWithRootViewController:NewVC];
//    [NewNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"底栏64.png"] forBarMetrics:UIBarMetricsDefault];//顶部条图片
//    //设置标题
//    UILabel* titleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
//    titleView.text = navigationTitle;
//    titleView.font = [UIFont fontWithName:[SharedManage getInstance].textFont size:20];
//    titleView.textAlignment = NSTextAlignmentCenter;
//    titleView.textColor = [UIColor whiteColor];
//    
//    titleView.backgroundColor = [UIColor clearColor];
//    NewNC.navigationBar.topItem.titleView = titleView;
//    
//    return NewNC;
//}


@end
