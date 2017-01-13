//
//  MYImageRequest.h
//  MYNetworkReview
//
//  Created by chenweinan on 16/11/20.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYImageRequester : NSObject

- (void)autoLoadImageWithURL:(NSURL *)url placeholderImage:(UIImage *)holdImage toImageView:(UIImageView *)imageView;

- (void)fetchImageWithURL:(NSURL *)url withFetchResultBlock:(MYNetworkImageFetchBlock)fetchBlock;

- (UIImage *)getImageIfExisted:(NSURL *)imageURL;

- (NSUInteger)getImageCachesSize;

- (BOOL)clearImageCaches;

- (void)setMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)diskPath;

@end
