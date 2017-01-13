//
//  MYNetworkResponse.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/5.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MYTypeDefinitions.h"

@class MYResponedObj;

@interface MYNetworkResponse : NSObject

@property (assign, nonatomic) NSInteger requestId;
@property (assign, nonatomic) MYNetworkLinkStatus linkStatus;
@property (assign, nonatomic) MYNetworkResponseStatus status;
@property (assign, nonatomic) CGFloat progress;//eg.  0.01~1.00
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) MYResponedObj *content;

@end
