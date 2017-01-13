//
//  MYUpdateInfo.m
//  MYLabor
//
//  Created by 贾淼 on 15-6-27.
//  Copyright (c) 2015年 milestone. All rights reserved.
//

#import "MYGetJsonMd5Responed.h"

@implementation MYGetJsonMd5Responed

- (id)init {
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"updateInfo":NSStringFromClass([jsonUpdateInfo class])
             };
}

@end


@implementation jsonUpdateInfo

- (id)init {
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

@end