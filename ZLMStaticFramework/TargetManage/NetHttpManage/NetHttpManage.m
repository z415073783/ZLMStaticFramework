//
//  NetHttpManage.m
//  ModuleProject
//
//  Created by Zlm on 15-3-6.
//  Copyright (c) 2015年 xmjw. All rights reserved.
//

#import "NetHttpManage.h"

@implementation NetHttpManage
+(NetHttpManage*)getInstance
{
    static NetHttpManage* shared = nil;
    if (shared == nil)
    {
        shared = [[NetHttpManage alloc]init];
        shared.manager = [AFHTTPRequestOperationManager manager];
        [shared setUserName:nil];
        [shared setPassword:nil];
        [shared.manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    }
    return shared;
}

+(void)setUserName:(NSString*)userName PassWord:(NSString*)password
{
    [[NetHttpManage getInstance] setUserName:userName];
    [[NetHttpManage getInstance] setPassword:password];
    [[[NetHttpManage getInstance] manager].requestSerializer setAuthorizationHeaderFieldWithUsername:[[NetHttpManage getInstance] userName]  password:[[NetHttpManage getInstance] password]];
}
+(void)setNetHttpContentType:(NSSet*)data
{
    [[[NetHttpManage getInstance] manager].responseSerializer setAcceptableContentTypes: data];
}


+(void)sendRequest:(NSDictionary*)data Trade:(NSString*) trade HttpType:(HttpType)httpType Black:(void(^)(id))black
{
    NSMutableString* url = [NSMutableString stringWithFormat:@"http://%@/",[NetHttpManage getInstance].ipconfig];
    [url appendFormat:@"%@",trade];
    AFHTTPRequestOperationManager* manager = [[NetHttpManage getInstance] manager];
    
    switch (httpType)
    {
        case HttpType_Get:
        {
            [manager GET:url parameters:data success:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 black(responseObject);
             } failure:^(AFHTTPRequestOperation *operation, NSError *error)
             {
                 black(nil);
             }];
        }
            break;
        case HttpType_Post:
        {
            [manager POST:url parameters:data success:^(AFHTTPRequestOperation *operation, id responseObject)
            {
                black(responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error)
            {
                black(nil);
            }];
        }
            break;
        default:
            break;
    }
}

+(void)sendPostDataRequest:(NSDictionary*) data Files:(NSDictionary*) files Trade:(NSString*) trade Black:(void(^)(id data))black
{
    NSMutableString* url = [NSMutableString stringWithFormat:@"http://%@/",[NetHttpManage getInstance].ipconfig];
    [url appendFormat:@"tradeUrl:%@",trade];
    AFHTTPRequestOperationManager* manager = [[NetHttpManage getInstance] manager];
    
    [manager POST:url parameters:data constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSArray* allKey = [files allKeys];
        for (int i = 0; i<[allKey count]; i++)
        {
            [formData appendPartWithFileURL:[NSURL URLWithString:[files objectForKey:[allKey objectAtIndex:i]]] name:[allKey objectAtIndex:i] error:nil];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        black(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        black(nil);
    }];
}
//返回失败
+(void)resultFailWithTarget:(id)inTarget Action:(SEL)inAction Error:(NSError*)error
{
    if (inTarget == nil || inAction == nil) {
        NSLog(@"inTarget or inAction is nil");
        return;
    }
    [inTarget performSelector:inAction
                   withObject:@{@"error" : [NSNumber numberWithBool:YES]}
                   withObject:@{@"msg" : @"error"}];
    
}
//返回成功
+(void)dealResultWithTarget:(id)inTarget Action:(SEL)inAction Response:(id)responseObject
{
    if (inTarget == nil || inAction == nil)
    {
        NSLog(@"inTarget or inAction is nil");
        return;
    }
    if (inTarget && inAction)
    {
        if ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject valueForKey:@"error"] && [[responseObject valueForKey:@"error"] boolValue]) {
            [inTarget performSelector:inAction
                           withObject:@{@"error" : [NSNumber numberWithBool:YES]}
                           withObject:responseObject];
        } else {
            [inTarget performSelector:inAction
                           withObject:@{@"error" : [NSNumber numberWithBool:NO]}
                           withObject:responseObject];
        }
    }
}

@end
