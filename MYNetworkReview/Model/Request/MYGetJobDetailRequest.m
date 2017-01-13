//
//  MYGetJobDetailRequest.m
//  MayiW
//
//  Created by 陈伟南 on 16/8/31.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "MYGetJobDetailRequest.h"

@implementation MYGetJobDetailRequest

- (instancetype)init{
    if(self = [super init]){
        self.hostName = GLOBAL_REQUEST_HOSTNAME;
        self.path = GLOBAL_REQUEST_PATH(@"Job/Detail");
    }
    return self;
}

@end
