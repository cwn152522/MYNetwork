//
//  MYUpdateInfoRequest.m
//  MYLabor
//
//  Created by 贾淼 on 15-6-27.
//  Copyright (c) 2015年 milestone. All rights reserved.
//

#import "MYGetJsonMd5Request.h"

@implementation MYGetJsonMd5Request

- (id)init{
    self = [super init];
    if (self) {
        self.hostName = GLOBAL_REQUEST_HOSTNAME;
        self.path = GLOBAL_REQUEST_PATH(@"json/dic_indexV4.txt");
    }
    return self;
}

@end