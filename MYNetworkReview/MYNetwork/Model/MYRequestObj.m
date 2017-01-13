//
//  MYURLRequestObj.m
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/5.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import "MYRequestObj.h"

@implementation MYRequestObj

- (instancetype)init{
    if(self = [super init]){
        self.hostName = nil;
        self.path = nil;
        self.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
        self.shouldSendCookies = YES;
        self.responseSerializer = MYHTTPResponseSerializerTypeJson;
    }
    return self;
}

@end
