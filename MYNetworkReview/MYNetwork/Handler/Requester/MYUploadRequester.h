//
//  MYUploadRequester.h
//  MYNetworkReview
//
//  Created by chenweinan on 16/11/20.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYUploadRequester : NSObject

- (NSInteger)upLoadFileWithRequestObj:(MYRequestObj *)requestObj filePath:(NSString *)filePath entityClass:(NSString *)entityName withUpLoadBlock:(MYNetworkResponseBlock)responseBlock;

@end
