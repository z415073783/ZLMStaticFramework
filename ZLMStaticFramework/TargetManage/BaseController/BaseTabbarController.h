//
//  BaseTabbarController.h
//  ZLMStaticFramework
//
//  Created by Zlm on 15-3-31.
//  Copyright (c) 2015年 zlm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabbarController : UITabBarController
{
    
    
}
//创建自定义按钮的tabbarController
/*
 nameArr: 标题数组 (tabbar中的标题图片以该标题命名)
 baseNC: NavigationController数组
 normalImage: tabbar中的正常状态图片
 
 */
+(BaseTabbarController*)createCustomTabbarControllerWithTabbarName:(NSArray*)nameArr BaseViewNC:(NSArray*)baseNC TabbarNormalImage:(UIImage*)normalImage;

@end
