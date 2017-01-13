//
//  MYURLSession.m
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/1.
//  Copyright © 2016年 chenweinan. All rights reserved.
//
#import "MYNetworkProxy.h"
#import "MYDataRequester.h"
#import "MYUploadRequester.h"
#import "MYDownloadRequester.h"
#import "MYImageRequester.h"

static MYNetworkProxy *instance;

@interface MYNetworkProxy()<NSCopying>

@property (strong, nonatomic) MYDataRequester *dataRequester;
@property (strong, nonatomic) MYUploadRequester *uploadRequester;
@property (strong, nonatomic) MYDownloadRequester *downloadRequester;
@property (strong, nonatomic) MYImageRequester *imageRequester;

@end

@implementation MYNetworkProxy

+ (instancetype)defaultProxy{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MYNetworkProxy alloc] init];
    });
    return instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}
- (id)copyWithZone:(NSZone *)zone{
    return self;
}

- (MYDataRequester *)dataRequester{
    if(!_dataRequester){
        _dataRequester = [[MYDataRequester alloc] init];
    }
    return _dataRequester;
}

- (MYUploadRequester *)uploadRequester{
    if(!_uploadRequester){
        _uploadRequester = [[MYUploadRequester alloc] init];
    }
    return _uploadRequester;
}

- (MYDownloadRequester *)downloadRequester{
    if(!_downloadRequester){
        _downloadRequester = [[MYDownloadRequester alloc] init];
    }
    return _downloadRequester;
}

- (MYImageRequester *)imageRequester{
    if(!_imageRequester){
        _imageRequester = [[MYImageRequester alloc] init];
    }
    return _imageRequester;
}

//- (void)setBackgroundSessionCompletionHandler:(void (^)())backgroundSessionCompletionHandler{
//    [self.downloadRequester setBackgroundSessionCompletionHandler:^{
//        backgroundSessionCompletionHandler();
//    }];
//}

#pragma mark 公有方法

- (void)cancelRequestWithRequestId:(NSInteger)requestId taskType:(MYNetworkTaskType)taskType{
    if(requestId < 0)
        return;
    [MYNetworkUtility cancelRequestWithRequestId:requestId taskType:taskType];
}

- (void)getNetworkStates:(MYNetworkLinkStatusFetchBlock)networkFetchBlock{
    [MYNetworkUtility getNetworkStates:networkFetchBlock];
}

#pragma mark 数据请求相关

- (NSInteger)httpPostWithRequestObj:(MYRequestObj *)requestObj entityClass:(NSString *)entityName withCompleteBlock:(MYNetworkResponseBlock)responseBlock{
    if(!requestObj){
        NSLog(@"requestObj can't null!");
        return 0;
    }
    return [self.dataRequester httpPostWithRequestObj:requestObj entityClass:entityName withCompleteBlock:responseBlock];
}

- (NSInteger)httpGetWithRequestObj:(MYRequestObj *)requestObj entityClass:(NSString *)entityName withCompleteBlock:(MYNetworkResponseBlock)responseBlock{
    if(!requestObj){
        NSLog(@"requestObj can't be null!");
        return 0;
    }
    return [self.dataRequester httpGetWithRequestObj:requestObj entityClass:entityName withCompleteBlock:responseBlock];
}

#pragma mark 文件上传下载相关

- (NSInteger)upLoadFileWithRequestObj:(MYRequestObj *)requestObj filePath:(NSString *)filePath entityClass:(NSString *)entityName withUpLoadBlock:(MYNetworkResponseBlock)responseBlock{
    if(!requestObj || !filePath){
        NSLog(@"requestObj or filePath can't be null!");
        return 0;
    }
    return [self.uploadRequester upLoadFileWithRequestObj:requestObj filePath:filePath entityClass:entityName withUpLoadBlock:responseBlock];
}

- (NSInteger)downLoadFileFrom:(NSURL *)remoteURL toFile:(NSString *)filePath withDownLoadBlock:(MYNetworkResponseBlock)responseBlock{
    if(!remoteURL||!filePath){
        NSLog(@"remoteURL or filePath can't be null!");
        return 0;
    }
    return [self.downloadRequester downLoadFileFrom:remoteURL toFile:filePath withDownLoadBlock:responseBlock];
}

#pragma mark 图片加载及缓存相关

- (void)autoLoadImageWithURL:(NSURL *)url placeholderImage:(UIImage *)holdImage toImageView:(UIImageView *)imageView{
    if(!url||!imageView)
        return;
    [self.imageRequester autoLoadImageWithURL:url placeholderImage:holdImage toImageView:imageView];
}

- (void)fetchImageWithURL:(NSURL *)url withFetchResultBlock:(MYNetworkImageFetchBlock)fetchBlock{
    if(!url)
        return;
    [self.imageRequester fetchImageWithURL:url withFetchResultBlock:fetchBlock];
}

- (UIImage *)getImageIfExisted:(NSURL *)imageURL{
    if(!imageURL)
        return nil;
    return [self.imageRequester getImageIfExisted:imageURL];
}

- (NSUInteger)getImageCachesSize{
    return [self.imageRequester getImageCachesSize];
}

- (BOOL)clearImageCaches{
    return [self.imageRequester clearImageCaches];
}

- (void)setMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)diskPath{
    [self.imageRequester setMemoryCapacity:memoryCapacity diskCapacity:diskCapacity diskPath:diskPath];
}

@end
