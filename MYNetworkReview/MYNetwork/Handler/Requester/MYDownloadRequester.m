//
//  MYDownloadRequester.m
//  MYNetworkReview
//
//  Created by chenweinan on 16/11/20.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import "MYDownloadRequester.h"
#import "MYURLSessionTask.h"
#import "MYTasksOperationQueue.h"

@interface MYDownloadRequester ()
//<NSURLSessionDataDelegate, NSURLSessionDownloadDelegate>

//@property (strong, nonatomic) NSURLSession *downwloadSession;

@end

@implementation MYDownloadRequester

//- (NSURLSession *)downwloadSession{
//    static NSURLSession *session = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSDictionary *infoDic =[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"]];
//        NSString *bundleIdy = [infoDic valueForKey:@"CFBundleIdentifier"];
//        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:bundleIdy];
//        session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
//        
//        [MYNetworkUtility checkIfTheBackgroundEnvironmentIsSettedCorrectly];
//    });
//    return session;
//}

- (NSInteger)downLoadFileFrom:(NSURL *)remoteURL toFile:(NSString *)filePath withDownLoadBlock:(MYNetworkResponseBlock)responseBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:remoteURL];
    
    MYURLSessionTask *task = [[MYURLSessionTask alloc] init];
    task.task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        CGFloat progress = downloadProgress.fractionCompleted;
        task.netWorkResponse.progress = progress;
        task.netWorkResponse.status = MYNetworkResponseStatusDowning;
        [MYNetworkUtility responseBlock:task.responseBlock withTask:task];
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if(error){
            [MYNetworkUtility handleError:error withTask:task taskType:MYNetworkTaskTypeDownload];
            return ;
        }else{
            [[MYTasksOperationQueue defaultQueue] sessionTaskDidCompleteSuccessfully:task taskType:MYNetworkTaskTypeDownload];
            task.netWorkResponse.status = MYNetworkResponseStatusSuccessed;
            [MYNetworkUtility responseBlock:task.responseBlock withTask:task];
        }
    }];
    
    task.responseBlock = responseBlock;
    task.savePath = filePath;
    
    [task.task resume];
    [[MYTasksOperationQueue defaultQueue] startSessionTaskFromTasksQueueWithTask:task taskType:MYNetworkTaskTypeDownload];
    
//    NSURLRequest *request = [MYNetworkUtility getDownloadRequestWithUrl:remoteURL];
//    
//    MYURLSessionTask *task = [[MYURLSessionTask alloc] init];
//    task.task = [self.downwloadSession downloadTaskWithRequest:request];
//    
//    task.responseBlock = responseBlock;
//    task.savePath = filePath;
//    [[MYTasksOperationQueue defaultQueue] startSessionTaskFromTasksQueueWithTask:task taskType:MYNetworkTaskTypeDownload];
    return task.requestId;
}

#pragma mark NSURLSessionDownloadDelegate

//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
//    MYURLSessionTask *task = [[MYTasksOperationQueue defaultQueue] getTaskWithRequestId:downloadTask.taskIdentifier taskType:MYNetworkTaskTypeDownload];
//    if(task == nil)
//    return;
//    
//    task.netWorkResponse.status = MYNetworkResponseStatusDowning;
//    task.netWorkResponse.progress = 1.0*totalBytesWritten/totalBytesExpectedToWrite;
//    
//    [MYNetworkUtility responseBlock:task.responseBlock withTask:task];
//}
//
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
//    MYURLSessionTask *task = [[MYTasksOperationQueue defaultQueue] getTaskWithRequestId:downloadTask.taskIdentifier taskType:MYNetworkTaskTypeDownload];
//    if(!task)
//    return;
//    
//    //根据URL获取到下载的文件名
//    NSString *fileName = [downloadTask.originalRequest.URL.absoluteString lastPathComponent];
//    NSString *path = [task.savePath stringByAppendingPathComponent:fileName];
//    NSURL *toURL = [NSURL fileURLWithPath:path];
//    
//    //从下载的临时文件夹把文件copy过去
//    NSError *error_operation;
//    if([[NSFileManager defaultManager] fileExistsAtPath:path]){
//        [[NSFileManager defaultManager] removeItemAtPath:path error:&error_operation];
//    }
//    [[NSFileManager defaultManager] copyItemAtURL:location toURL:toURL error:&error_operation];
//    if(!error_operation){ //文件保存成功
//        task.netWorkResponse.status = MYNetworkResponseStatusSuccessed;
//        task.netWorkResponse.progress = 1.00;
//        NSDictionary *infoDic = @{
//                                  @"path":path
//                                  };
//        task.netWorkResponse.content = (MYResponedObj *)infoDic;
//        [[MYTasksOperationQueue defaultQueue] sessionTaskDidCompleteSuccessfully:task taskType:MYNetworkTaskTypeDownload];
//        [MYNetworkUtility responseBlock:task.responseBlock withTask:task];
//        return;
//    }
//    [MYNetworkUtility handleError:[NSError errorWithDomain:@"文件保存失败" code:11111 userInfo:nil] withTask:task taskType:MYNetworkTaskTypeDownload];
//}

#pragma mark NSURLSessionDataDelegate

//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler{//连接成功
//    if([NSStringFromClass([dataTask class]) containsString:@"Download"]){
//        MYURLSessionTask *task = [[MYTasksOperationQueue defaultQueue] getTaskWithRequestId:dataTask.taskIdentifier taskType:MYNetworkTaskTypeDownload];
//        if(task == nil)
//            return;
//        
//        if([(NSHTTPURLResponse *)response statusCode] == 500){
//            NSError *error = [NSError errorWithDomain:@"服务器内部错误" code:500 userInfo:nil];
//            [MYNetworkUtility handleError:error withTask:task taskType:MYNetworkTaskTypeDownload];
//        }
//    }
//    completionHandler(NSURLSessionResponseAllow);
//}

#pragma mark NSURLSessionTaskDelegate

//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
//    MYURLSessionTask *sessionTask = [[MYTasksOperationQueue defaultQueue] getTaskWithRequestId:task.taskIdentifier taskType:MYNetworkTaskTypeDownload];
//    if(!sessionTask)
//    return;
//    if(error)
//    [MYNetworkUtility handleError:error withTask:sessionTask taskType:MYNetworkTaskTypeDownload];
//    
//    __weak typeof(self) weakSelf = self;
//    [MYNetworkUtility checkIfAllTheBackgroundTasksFinishedWithSession:self.downwloadSession handler:^{
//        void (^backgroundSessionCompletionHandlerCopy)() = weakSelf.backgroundSessionCompletionHandler;
//        if(weakSelf.backgroundSessionCompletionHandler){
//            weakSelf.backgroundSessionCompletionHandler = nil;
//            backgroundSessionCompletionHandlerCopy();
//        }
//    }];
//}

#pragma mark NSURLSessionDelegate

//- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler//通过调用block，来告诉NSURLSession要不要收到这个证书
//{
//    //(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
//    //NSURLSessionAuthChallengeDisposition （枚举）如何处理这个证书
//    //NSURLCredential 授权
//    
//    //证书分为好几种：服务器信任的证书、输入密码的证书  。。，所以这里最好判断
//    
//    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){//服务器信任证书
//        
//        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];//服务器信任证书
//        if(completionHandler)
//        completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
//    }
//    NSLog(@"....completionHandler---:%@",challenge.protectionSpace.authenticationMethod);
//}

@end
