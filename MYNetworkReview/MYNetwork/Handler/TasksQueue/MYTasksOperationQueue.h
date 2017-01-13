//
//  MYURLSessionTasksQueue.h
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/8.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MYURLSessionTask.h"

@interface MYTasksOperationQueue : NSObject

+ (instancetype)defaultQueue;

- (MYURLSessionTask *)getTaskWithRequestId:(NSInteger)requestId taskType:(MYNetworkTaskType)taskType;//获取目标task

- (void)startSessionTaskFromTasksQueueWithTask:(MYURLSessionTask *)task taskType:(MYNetworkTaskType)taskType;//开始某个task

- (void)sessionTaskDidCompleteSuccessfully:(MYURLSessionTask *)task taskType:(MYNetworkTaskType)taskType;//task完成后必须调用此方法更新队列信息

- (void)cancelSessionTaskFromTasksQueueWithRequestId:(NSInteger)requestId taskType:(MYNetworkTaskType)taskType;//取消某个task

@end
