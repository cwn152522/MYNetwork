//
//  MYImageRequest.m
//  MYNetworkReview
//
//  Created by chenweinan on 16/11/20.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import "MYImageRequester.h"

@implementation MYImageRequester

- (void)autoLoadImageWithURL:(NSURL *)url placeholderImage:(UIImage *)holdImage toImageView:(UIImageView *)imageView{
//    [imageView sd_setImageWithURL:url placeholderImage:holdImage];
     [imageView setImageWithURL:url placeholderImage:holdImage];
}

- (void)fetchImageWithURL:(NSURL *)url withFetchResultBlock:(MYNetworkImageFetchBlock)fetchBlock{
    UIImage *image = [self getImageIfExisted:url];
    if(image)
    return fetchBlock([MYNetworkUtility changeImageToFitScreenScale:image], YES);
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    [manager downloadImageWithURL:url options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        
//    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//        return fetchBlock([MYNetworkUtility changeImageToFitScreenScale:image], NO);
//    }];
    AFImageDownloader *imageDownloader = [AFImageDownloader defaultInstance];
    [imageDownloader downloadImageForURLRequest:[NSURLRequest requestWithURL:url] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
        return fetchBlock([MYNetworkUtility changeImageToFitScreenScale:responseObject], NO);
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        return fetchBlock([MYNetworkUtility changeImageToFitScreenScale:nil], NO);
    }];
}

- (UIImage *)getImageIfExisted:(NSURL *)imageURL{
    NSURLRequest *request = [NSURLRequest requestWithURL:imageURL];
    
    AFImageDownloader *downloader = [AFImageDownloader defaultInstance];
    // 内存缓存
    UIImage *cachedImage = [downloader.imageCache imageforRequest:request withAdditionalIdentifier:nil];
    if (!cachedImage) {
        // 内存缓存没有，读取硬盘缓存
        NSURLCache *urlCache = downloader.sessionManager.session.configuration.URLCache;
        NSCachedURLResponse *cacheResponse = [urlCache cachedResponseForRequest:request];
        if (cacheResponse.data) {//硬盘缓存有，返回硬盘缓存图片
            cachedImage = [UIImage imageWithData:cacheResponse.data];
            return cachedImage;
        }
        return nil;//硬盘缓存没有，返回nil
    }
    return cachedImage;//内存缓存有，返回内存缓存图片
     
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    if([manager diskImageExistsForURL:imageURL]){
//        return [[manager imageCache] imageFromDiskCacheForKey:imageURL.absoluteString];
//    }
//    return nil;
}

- (NSUInteger)getImageCachesSize;{
//    [[SDImageCache sharedImageCache] calculateSizeWithCompletionBlock:^(NSUInteger fileCount, NSUInteger totalSize) {
//        responseBlock(totalSize);
//    }];
    AFImageDownloader *downloader = [UIImageView sharedImageDownloader];
    
    NSURLCache *urlCache = downloader.sessionManager.session.configuration.URLCache;
    NSUInteger urlCacheSize = urlCache.currentMemoryUsage;
    
    return urlCacheSize;
}

- (BOOL)clearImageCaches{
//    [[SDImageCache sharedImageCache] clearDisk];
//    [[SDImageCache sharedImageCache] clearMemory];
//    [self getImageCachesSizeWithResponseBlock:^(NSUInteger cacheSize) {
//        responseBlock(cacheSize);
//    }];
    AFImageDownloader *downloader = [AFImageDownloader defaultInstance];
    //清理硬盘缓存
    NSURLCache *urlCache = downloader.sessionManager.session.configuration.URLCache;
    [urlCache removeAllCachedResponses];
    //清理内存缓存
    return [downloader.imageCache removeAllImages];
}

- (void)setMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)diskPath{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024
                                                             diskCapacity:20 * 1024 * 1024
                                                                 diskPath:diskPath];
        [NSURLCache setSharedURLCache:URLCache];
    });
}

@end
