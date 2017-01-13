//
//  MYURLSessionTasksQueue.m
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/8.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import "MYTasksOperationQueue.h"

static MYTasksOperationQueue *instance;

@interface MYTasksOperationQueue ()

@property (strong, nonatomic, readonly) NSMutableArray *dataTaskQueue;
@property (strong, nonatomic, readonly) NSMutableArray *uploadTaskQueue;
@property (strong, nonatomic, readonly) NSMutableArray *downloadTaskQueue;

@end

@implementation MYTasksOperationQueue

@synthesize dataTaskQueue = _dataTaskQueue;
@synthesize uploadTaskQueue = _uploadTaskQueue;
@synthesize downloadTaskQueue = _downloadTaskQueue;

+ (instancetype)defaultQueue{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MYTasksOperationQueue alloc] init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone: zone];
    });
    return instance;
}

- (instancetype)init{
    if(self = [super init]){
    }
    return self;
}

- (NSMutableArray *)dataTaskQueue{
    if(!_dataTaskQueue){
        _dataTaskQueue = [NSMutableArray array];
    }
    return _dataTaskQueue;
}

- (NSMutableArray *)uploadTaskQueue{
    if(!_uploadTaskQueue){
        _uploadTaskQueue = [NSMutableArray array];
    }
    return _uploadTaskQueue;
}

- (NSMutableArray *)downloadTaskQueue{
    if(!_downloadTaskQueue){
        _downloadTaskQueue = [NSMutableArray array];
    }
    return _downloadTaskQueue;
}

#pragma mark public methods

- (MYURLSessionTask *)getTaskWithRequestId:(NSInteger)requestId taskType:(MYNetworkTaskType)taskType{
    NSEnumerator *enumerator;
    switch (taskType) {
        case MYNetworkTaskTypeData:
           enumerator = [self.dataTaskQueue objectEnumerator];
            break;
        case MYNetworkTaskTypeUpload:
            enumerator = [self.uploadTaskQueue objectEnumerator];
            break;
        case MYNetworkTaskTypeDownload:
            enumerator = [self.downloadTaskQueue objectEnumerator];
            break;
        default:
            break;
    }
    
    MYURLSessionTask *task;
    while (task = [enumerator nextObject]) {
        if (task.requestId == requestId) {
            break;
        }
    }
    return task;
}

- (void)startSessionTaskFromTasksQueueWithTask:(MYURLSessionTask *)task  taskType:(MYNetworkTaskType)taskType{
//    [task.task resume];
    NSMutableArray *taskQueue;
    switch (taskType) {
        case MYNetworkTaskTypeData:
            taskQueue = self.dataTaskQueue;
            break;
        case MYNetworkTaskTypeUpload:
            taskQueue = self.uploadTaskQueue;
            break;
        case MYNetworkTaskTypeDownload:
            taskQueue = self.downloadTaskQueue;
            break;
        default:
            break;
    }
    
    if([taskQueue containsObject:task])
        [taskQueue removeObject:task];
    [taskQueue addObject:task];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)sessionTaskDidCompleteSuccessfully:(MYURLSessionTask *)task taskType:(MYNetworkTaskType)taskType{
    switch (taskType) {
        case MYNetworkTaskTypeData:
                [self.dataTaskQueue removeObject:task];
            break;
        case MYNetworkTaskTypeUpload:
            [self.uploadTaskQueue removeObject:task];
            break;
        case MYNetworkTaskTypeDownload:
            [self.downloadTaskQueue removeObject:task];
            break;
        default:
            break;
    }
    
    if([_dataTaskQueue count] + [_uploadTaskQueue count] + [_downloadTaskQueue count] == 0)
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)cancelSessionTaskFromTasksQueueWithRequestId:(NSInteger)requestId taskType:(MYNetworkTaskType)taskType{
    NSEnumerator *enumerator;
    switch (taskType) {
        case MYNetworkTaskTypeData:
            enumerator = [self.dataTaskQueue objectEnumerator];
            break;
        case MYNetworkTaskTypeUpload:
            enumerator = [self.uploadTaskQueue objectEnumerator];
            break;
        case MYNetworkTaskTypeDownload:
            enumerator = [self.downloadTaskQueue objectEnumerator];
            break;
        default:
            break;
    }
    
    MYURLSessionTask *task;
    if(requestId == 0){
        while (task = [enumerator nextObject]) {
            [task.task cancel];
        }
        return;
    }
    while (task = [enumerator nextObject]) {
        if (task.requestId == requestId) {
            [task.task cancel];
            break;
        }
    }
}

@end
