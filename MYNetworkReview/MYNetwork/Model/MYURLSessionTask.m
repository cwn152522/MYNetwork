//
//  MYURLSessionTask.m
//  MYRongCloudDemo
//
//  Created by chenweinan on 16/10/7.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import "MYURLSessionTask.h"
#import <objc/runtime.h>

@interface NSURLSessionTask (RequestId)

@property (assign, nonatomic) NSInteger requestId;

@end

@implementation NSURLSessionTask (RequestId)

- (NSInteger)requestId{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setRequestId:(NSInteger)requestId{
    objc_setAssociatedObject(self, @selector(requestId), [NSNumber numberWithInteger:requestId], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

static int myRequestId = 0;
static NSObject *obj;

@implementation MYURLSessionTask

- (MYNetworkResponse *)netWorkResponse{
    if(!_netWorkResponse){
        _netWorkResponse = [[MYNetworkResponse alloc] init];
    }
    return _netWorkResponse;
}

- (void)setTask:(NSURLSessionTask *)task{
    if(!obj)
        obj = [[NSObject alloc] init];
    @synchronized (obj) {
        _task = task;
       task.requestId = (++myRequestId);
        _requestId = myRequestId;
        self.netWorkResponse.requestId = myRequestId;
    }
}

- (BOOL)isEqual:(id)object{
    MYURLSessionTask *task = (MYURLSessionTask *)object;
    if(task == self)
        return YES;
    if([task isMemberOfClass:[self class]]){
        if(task.requestId == self.requestId)
            return YES;
    }
    return [super isEqual:object];
}

- (NSUInteger)hash{
    return _requestId ^ [_task hash] ^ [_netWorkResponse hash];
}

@end
