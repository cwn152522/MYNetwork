//
//  MYURLRequestObj.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/5.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYRequestObj : NSObject

@property (copy, nonatomic) NSString *hostName;//eg. "http://192.168.1.69:8888"
@property (copy, nonatomic) NSString *path;//eg. "/a/b/c"
@property (strong, nonatomic) NSDictionary *paramsDic;
@property (strong, nonatomic) NSDictionary *httpHeaderDic;//httpHeader参数

@property (assign, nonatomic) NSURLRequestCachePolicy requestCachePolicy;//请求cache策略，决定请求时如何处理本地缓存
@property (assign, nonatomic) BOOL shouldSendCookies;//请求是否带上本地cookies
@property (assign, nonatomic) MYHTTPResponseSerializerType responseSerializer;///返回数据解析类型

@end
