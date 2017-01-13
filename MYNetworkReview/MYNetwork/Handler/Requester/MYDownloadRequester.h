//
//  MYDownloadRequester.h
//  MYNetworkReview
//
//  Created by chenweinan on 16/11/20.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYDownloadRequester : NSObject

//@property (copy, nonatomic) void (^backgroundSessionCompletionHandler)();

- (NSInteger)downLoadFileFrom:(NSURL *)remoteURL toFile:(NSString *)filePath withDownLoadBlock:(MYNetworkResponseBlock)responseBlock;

@end
