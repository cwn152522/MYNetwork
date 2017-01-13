//
//  MYUpdateInfo.h
//  MYLabor
//
//  Created by 贾淼 on 15-6-27.
//  Copyright (c) 2015年 milestone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYGetJsonMd5Responed : MYResponedObj

@property (nonatomic, strong) NSMutableArray *updateInfo;

@end

/*
 更新信息类
 */

@interface jsonUpdateInfo : MYResponedObj

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *md5;
@property (nonatomic, strong) NSString *url;

@end