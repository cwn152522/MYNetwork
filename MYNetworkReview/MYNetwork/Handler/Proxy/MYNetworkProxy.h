//
//  MYURLSession.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/1.
//  Copyright © 2016年 chenweinan. All rights reserved.

#import <Foundation/Foundation.h>
#import "MYTypeDefinitions.h"
@class MYRequestObj;
@class MYResponedObj;

@interface MYNetworkProxy : NSObject

+ (instancetype)defaultProxy;

#pragma mark 公有方法
- (void)getNetworkStates:(MYNetworkLinkStatusFetchBlock)networkFetchBlock;//获取网络状态

- (void)cancelRequestWithRequestId:(NSInteger)requestId taskType:(MYNetworkTaskType)taskType;//取消请求，0 means all

#pragma mark 数据请求相关
- (NSInteger)httpGetWithRequestObj:(MYRequestObj *)requestObj entityClass:(NSString *)entityName withCompleteBlock:(MYNetworkResponseBlock)responseBlock;//返回值为请求id

- (NSInteger)httpPostWithRequestObj:(MYRequestObj *)requestObj  entityClass:(NSString *)entityName withCompleteBlock:(MYNetworkResponseBlock)responseBlock;

#pragma mark 文件上传下载相关
- (NSInteger)upLoadFileWithRequestObj:(MYRequestObj *)requestObj filePath:(NSString *)filePath entityClass:(NSString *)entityName withUpLoadBlock:(MYNetworkResponseBlock)responseBlock;

- (NSInteger)downLoadFileFrom:(NSURL *)remoteURL toFile:(NSString*)filePath  withDownLoadBlock:(MYNetworkResponseBlock)responseBlock; //filePath: 完整文件路径

//- (void)setBackgroundSessionCompletionHandler:(void (^)())backgroundSessionCompletionHandler;//目的是在后台请求任务全部完成时通知，用法：在AppDelegate对应代理中调用

#pragma mark 图片加载及缓存处理相关

- (void)autoLoadImageWithURL:(NSURL *)url placeholderImage:(UIImage *)holdImage toImageView:(UIImageView*)imageView;//自动加载网络图片到imageView，请求前只判断内存缓存，自动缓存

- (void)fetchImageWithURL:(NSURL *)url withFetchResultBlock:(MYNetworkImageFetchBlock)fetchBlock;//从网络或缓存中取一张图片，请求前只判断内存缓存，自动缓存

- (UIImage *)getImageIfExisted:(NSURL *)imageURL;//从内存或硬盘缓存中取一张图片

- (NSUInteger)getImageCachesSize;//内存缓存，单位：字节（获取硬盘缓存异常，未解决）

- (BOOL)clearImageCaches;//内存缓存、硬盘缓存

- (void)setMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)diskPath;//设置NSURLCache内存和硬盘缓存大小以及缓存保存的相对子路径，根路径在Library->Caches目录下，eg.memoryCapacity:20*1024*1024

@end
