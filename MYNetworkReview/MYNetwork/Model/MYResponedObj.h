//
//  YYResponedModel.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/4.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYResponedObj : NSObject

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;
+ (NSDictionary *)modelCustomPropertyMapper;
+ (NSDictionary *)modelContainerPropertyGenericClass;

- (id)modelToJSONObject;

@end
