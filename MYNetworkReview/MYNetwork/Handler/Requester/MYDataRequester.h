//
//  MYDataRequester.h
//  MYNetworkReview
//
//  Created by chenweinan on 16/11/20.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYDataRequester : NSObject

- (NSInteger)httpGetWithRequestObj:(MYRequestObj *)requestObj entityClass:(NSString *)entityName withCompleteBlock:(MYNetworkResponseBlock)responseBlock;

- (NSInteger)httpPostWithRequestObj:(MYRequestObj *)requestObj entityClass:(NSString *)entityName withCompleteBlock:(MYNetworkResponseBlock)responseBlock;

@end
