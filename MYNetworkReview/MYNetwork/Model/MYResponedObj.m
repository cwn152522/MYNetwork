//
//  YYResponedModel.m
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/4.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import "MYResponedObj.h"
#import "YYModel.h"

@implementation MYResponedObj

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    return [self yy_modelWithDictionary:dictionary];
}

+ (NSDictionary *)modelCustomPropertyMapper{
    return nil;
}

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return nil;
}

- (id)modelToJSONObject{
    return [self yy_modelToJSONObject];
}

@end
