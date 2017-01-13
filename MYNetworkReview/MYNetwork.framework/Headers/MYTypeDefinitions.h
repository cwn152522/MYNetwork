//
//  MYTypeDefinitions.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/16.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#ifndef MYTypeDefinitions_h
#define MYTypeDefinitions_h
@class MYNetworkResponse;

typedef void (^MYNetworkResponseBlock)(MYNetworkResponse *response);
typedef void (^MYNetworkImageFetchBlock)(UIImage *fetchImage, BOOL isCache);//fetchImage为nil说明缓存里没找着、图片url请求失败

typedef NS_ENUM(NSInteger, MYNetworkTaskType){//task队列管理
    MYNetworkTaskTypeData,
    MYNetworkTaskTypeUpload,
    MYNetworkTaskTypeDownload
};

typedef NS_ENUM(NSUInteger, MYNetworkLinkStatus) {//网络连接状态
    MYNetworkLinkStatusUnknown,              //未知
    MYNetworkLinkStatusNotReachable,      //无连接
    MYNetworkLinkStatusWifi,                      //Wifi
    MYNetworkLinkStatusCellular                 //蜂窝
};

typedef NS_ENUM(NSUInteger, MYNetworkResponseStatus) {//网络请求状态
    MYNetworkResponseStatusSuccessed,
    MYNetworkResponseStatusDowning,
    MYNetworkResponseStatusUploading,
    MYNetworkResponseStatusCancelled,
    MYNetworkResponseStatusFailed
};

typedef void (^MYNetworkLinkStatusFetchBlock)(MYNetworkLinkStatus status);

#endif /* MYTypeDefinitions_h */
