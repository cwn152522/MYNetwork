//
//  RongCloudHeader.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/8/3.
//  Copyright © 2016年 chenweinan. All rights reserved.
//
#define version 1

#ifndef RongCloudHeader_h
#define RongCloudHeader_h

#if  version == 1//(公司有线)

#define GLOBAL_REQUEST_HOSTNAME @"http://app.mayiw.com"
#define GLOBAL_REQUEST_LOCAL_HOSTNAME @"http://192.168.1.162:8888"
#define GLOBAL_REQUEST_PATH(string)  [NSString stringWithFormat:@"/%@", string]

#elif version == 2//(宿舍无线)

#define GLOBAL_REQUEST_HOSTNAME @"http://192.168.1.108:8888"
#define GLOBAL_REQUEST_PATH(string)  [NSString stringWithFormat:@"/%@", string]

#elif version == 3//(公司cmcc无线)

#define GLOBAL_REQUEST_HOSTNAME @"http://192.168.2.27:8888"
#define GLOBAL_REQUEST_PATH(string)  [NSString stringWithFormat:@"/%@", string]

#endif


#endif /* RongCloudHeader_h */
