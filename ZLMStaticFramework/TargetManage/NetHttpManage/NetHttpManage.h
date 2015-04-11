//
//  NetHttpManage.h
//  ModuleProject
//
//  Created by Zlm on 15-3-6.
//  Copyright (c) 2015年 xmjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
typedef enum
{
    HttpType_Get,
    HttpType_Post
}HttpType;

@interface NetHttpManage : NSObject
{

}
@property(nonatomic)AFHTTPRequestOperationManager* manager;
@property(nonatomic)NSString* userName;//用户名
@property(nonatomic)NSString* password;//密码
@property(nonatomic)NSString* ipconfig;//设置ip
+(NetHttpManage*)getInstance;
//设置登录用户名及密码
+(void)setUserName:(NSString*)userName PassWord:(NSString*)password;
//设置请求数据类型
+(void)setNetHttpContentType:(NSSet*)data;

+(void)sendRequest:(NSDictionary*) data Trade:(NSString*)trade HttpType:(HttpType)httpType Black:(void(^)(id data))black;
//data:数据  files:文件路径  trade:请求头   inTarget:代理   inAction:返回方法
+(void)sendPostDataRequest:(NSDictionary*) data Files:(NSDictionary*) files Trade:(NSString*) trade Black:(void(^)(id data))black;
@end
