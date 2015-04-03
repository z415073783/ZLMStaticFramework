//
//  SharedManage.m
//  New_Target
//
//  Created by Zlm on 14-9-1.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import "SharedManage.h"
//#import "JSON.h"
@implementation SharedManage
@synthesize mainLayer;
static SharedManage* shared = nil;

+(SharedManage*)getInstance
{
    if(shared == nil)
    {
        shared = [[SharedManage alloc]init];
        
        UIWindow* window = [[UIApplication sharedApplication] keyWindow];
        
        if (!window)
        {
            window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
        }
        shared->activityIndicator = nil;
    }
    return shared;
}

-(id)openNewLayer:(UIViewController*)sender type:(PushNewLayerType)type
{
    switch (type)
    {
        case PUSHNEWLAYER_PUSH:
        {
//            正常推入
            [mainLayer pushViewController:sender animated:TRUE];
        }
            break;
        case PUSHNEWLAYER_PRESENT:
        {
//            present推入
            [mainLayer presentViewController:sender animated:TRUE completion:^{
                
            }];

        }
            break;
        case PUSHNEWLAYER_PUSH_AND_REMOVETABBAR:
        {
//            推入新界面且不带tabbar
            sender.hidesBottomBarWhenPushed = YES;
            [mainLayer pushViewController:sender animated:TRUE];
        }
            break;
            
        default:
            break;
    }
    
    _currentLayer = sender;

    return sender;
}

-(void)popCurrentLayer:(BOOL)action
{
    [mainLayer popToRootViewControllerAnimated:action];
    
}
-(void)dismissCurrentLayer:(BOOL)action
{
    [mainLayer dismissViewControllerAnimated:action completion:^{
        
    }];
}


@end
