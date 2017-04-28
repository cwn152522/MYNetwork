//
//  MYGetUserInfoResponed.m
//  MYNetworkReview
//
//  Created by ios 3 on 2017/1/13.
//  Copyright © 2017年 chenweinan. All rights reserved.
//

#import "MYGetUserInfoResponed.h"

@implementation GetUserInfoResult

@end

@implementation MYGetUserInfoResponed

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"result":[GetUserInfoResult class]
             };
}

@end

