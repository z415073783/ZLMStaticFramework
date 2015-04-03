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
+(BaseTabbarController*)createCustomTabbarControllerWithTabbarName:(NSArray*)nameArr BaseViewNC:(NSArray*)baseNC TabbarNormalImage:(UIImage*)normalImage;

@end
