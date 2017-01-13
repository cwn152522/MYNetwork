//
//  MYGetUserInfoRequest.m
//  MYNetworkReview
//
//  Created by ios 3 on 2017/1/13.
//  Copyright © 2017年 chenweinan. All rights reserved.
//

#import "MYGetUserInfoRequest.h"

@implementation MYGetUserInfoRequest

- (instancetype)init{
    if(self = [super init]){
        self.hostName = GLOBAL_REQUEST_LOCAL_HOSTNAME;
        self.path = @"/userInfo.php";
    }
    return self;
}

@end
