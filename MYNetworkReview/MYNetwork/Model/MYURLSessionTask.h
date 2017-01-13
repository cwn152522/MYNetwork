//
//  MYURLSessionTask.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/7.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MYNetworkResponse.h"
@class MYURLSessionTask;

@interface MYURLSessionTask : NSObject

@property (assign, nonatomic) NSInteger requestId;//记录请求的id, 在task初始化后自动生成
@property (strong, nonatomic) NSURLSessionTask *task;//请求的session任务
@property (strong, nonatomic) MYNetworkResponse *netWorkResponse;//请求返回的信息(状态+内容)
@property (copy, nonatomic) MYNetworkResponseBlock responseBlock;//请求相应的block

@property (copy, nonatomic) NSString *savePath;//文件下载保存地址

//对象等同性判断
- (BOOL)isEqual:(id)object;
- (NSUInteger)hash;

@end
