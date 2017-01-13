//
//  MYNetworkUtility.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/18.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MYURLSessionTask;
@class AFHTTPResponseSerializer;

@interface MYNetworkUtility : NSObject

+ (UIImage *)changeImageToFitScreenScale:(UIImage *)image;//图片等比例截取适应屏幕

+ (NSString *)getPathFromRequestObject:(MYRequestObj *)requestObj;//从请求模型中获取请求的接口地址

+ (NSDictionary *)getParamsDictionaryFromRequestObject:(MYRequestObj *)requestObj;//从请求模型中获取参数字典

+ (AFHTTPResponseSerializer *)getHttpResponseSerializerFromRequestObject:(MYRequestObj *)requestObj;//从请求模型中获取请求响应的解析器

//+ (void)setHttpHeadersWithRequestObject:(MYRequestObj *)requestObj  request:(NSMutableURLRequest *)request;//设置http请求头部信息

//+ (NSString *)getEncodedParamsFromDictionary:(NSDictionary *)dic;//从参数字典中获取编码后的参数字符串

//+ (NSString*) mk_urlEncodedString:(NSString *)string;//url参数编码逻辑

//+ (NSString *)getContentTypeWithFilePath:(NSString *)filePath;//获取文件的MIME

//+ (NSMutableURLRequest *)getPostRequestWithRequestObj:(MYRequestObj *)requestObj;//构建post请求
//+ (NSMutableURLRequest *)getGetRequestWithRequestObj:(MYRequestObj *)requestObj;//构建get请求
//+ (NSMutableURLRequest *)getMultipartFormDataRequestWithRequestObj:(MYRequestObj *)requestObj filePath:(NSString *)filePath;//构建multipart/form-data请求
//+ (NSURLRequest *)getDownloadRequestWithUrl:(NSURL *)url;//构建download请求

+ (void)responseBlock:(MYNetworkResponseBlock)responseBlock withTask:(MYURLSessionTask *)task;//在主线程返回最终请求结果
+ (void)handleError:(NSError *)error withTask:(MYURLSessionTask *)task taskType:(MYNetworkTaskType)taskType;//请求错误处理逻辑
+ (void)handleSuccessWithData:(NSData *)data entity:(NSString *)entityName sessionTask:(MYURLSessionTask *)task taskType:(MYNetworkTaskType)taskType;//请求成功处理逻辑

+ (void)checkIfAllTheBackgroundTasksFinishedWithSession:(NSURLSession *)session handler:(void(^)())backgroundSessionCompletionHandler;//检查后台任务完成状态
+ (void)checkIfTheBackgroundEnvironmentIsSettedCorrectly;//检查后台任务环境配置

+ (void)getNetworkStates:(MYNetworkLinkStatusFetchBlock)networkFetchBlock;//获取网络状态

+ (void)cancelRequestWithRequestId:(NSInteger)requestId taskType:(MYNetworkTaskType)taskType;//取消请求，0 means all

@end
