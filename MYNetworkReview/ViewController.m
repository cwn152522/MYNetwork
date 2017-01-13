//
//  ViewController.m
//  MYNetworkReview
//
//  Created by chenweinan on 16/11/20.
//  Copyright © 2016年 chenweinan. All rights reserved.
//

#import "ViewController.h"
#import "MYGetJsonMd5Request.h"
#import "MYGetJsonMd5Responed.h"

#import "MYGetJobDetailRequest.h"
#import "MYGetJobDetailResponed.h"

static NSString *kImageUrl = @"http://pic7.nipic.com/20100609/5136651_124423001651_2.jpg";
static NSString *kDownloadUrl = @"http://a3.pc6.com/hw1/MaYiDaGong.pc6.apk";

@interface ViewController ()

@property (assign, nonatomic) NSInteger requestId;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getNetworkStatus];
    for(int n = 1; n < 8; n ++){//模拟连点按钮发起多个网络请求情况，只执行最后一次请求
        [self httpGetRequest];
    }
    [self httpPostRequest];
//    [self httpImageRequest];
//    [self httpDownLoadRequest];

//    NSLog(@"%@", NSHomeDirectory());
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)getNetworkStatus{
    [[MYNetworkProxy defaultProxy] getNetworkStates:^(MYNetworkLinkStatus status) {
        switch (status) {
            case 0:
                NSLog(@"当前网络：未知");
                break;
            case 1:
                NSLog(@"当前网络：无连接");
                break;
            case 2:
                NSLog(@"当前网络：Wifi");
                break;
            case 3:
                NSLog(@"当前网络：蜂窝");
                break;
            default:
                break;
        }
    }];
}

- (void)httpGetRequest{//json为数组
    if(_requestId){//取消未完成的请求
        [[MYNetworkProxy defaultProxy] cancelRequestWithRequestId:_requestId taskType:MYNetworkTaskTypeData];
    }
    
    MYGetJsonMd5Request *request = [[MYGetJsonMd5Request alloc] init];
    request.responseSerializer = MYHTTPResponseSerializerTypeData;
//    request.requestCachePolicy = NSURLRequestReloadIgnoringCacheData;//忽略本地缓存，直接请求服务器
    _requestId = [[MYNetworkProxy defaultProxy] httpGetWithRequestObj:request entityClass:nil withCompleteBlock:^(MYNetworkResponse *response) {
        if(response.status == MYNetworkResponseStatusSuccessed){
            NSArray *content = (NSArray *)response.content;
            MYGetJsonMd5Responed *responed = [MYGetJsonMd5Responed modelWithDictionary:@{@"updateInfo":content}];
            NSLog(@"请求成功Id:%ld", response.requestId);
            return ;
        }
        if(response.status == MYNetworkResponseStatusFailed){
            NSLog(@"%@", response.error);
        }
        if (response.status == MYNetworkResponseStatusCancelled) {
            NSLog(@"请求取消Id:%ld", response.requestId);
        }
    }];
}

- (void)httpPostRequest{//json为字典
    MYGetJobDetailRequest *request = [[MYGetJobDetailRequest alloc] init];
    request.ID = [@"5865" integerValue];
   _requestId = [[MYNetworkProxy defaultProxy] httpPostWithRequestObj:request entityClass:@"MYGetJobDetailResponed" withCompleteBlock:^(MYNetworkResponse *response) {
        if(response.status == MYNetworkResponseStatusSuccessed){
            MYGetJobDetailResponed *responed = (MYGetJobDetailResponed *)response.content;
            NSLog(@"请求成功Id:%ld", response.requestId);
            return ;
        }
       if(response.status == MYNetworkResponseStatusFailed){
           NSLog(@"%@", response.error);
       }
       if (response.status == MYNetworkResponseStatusCancelled) {
           NSLog(@"请求取消Id:%ld", response.requestId);
       }
    }];
}

- (void)httpImageRequest{
    //自动加载图片
//    [[MYNetworkProxy defaultProxy] autoLoadImageWithURL:[NSURL URLWithString:kImageUrl] placeholderImage:nil toImageView:_imageView];
    
    //从缓存中取图片
    UIImage *image = [[MYNetworkProxy defaultProxy] getImageIfExisted:[NSURL URLWithString:kImageUrl]];
    if(image){//取到缓存图片
        [_imageView setImage:image];
        NSLog(@"从缓存中取到了图片");
    }else{ //图片未缓存，发送请求
        [[MYNetworkProxy defaultProxy] fetchImageWithURL:[NSURL URLWithString:kImageUrl] withFetchResultBlock:^(UIImage *fetchImage, BOOL isCache) {
            if(isCache){
                NSLog(@"从缓存中取到了图片");
            }else{
                NSLog(@"从网络加载了图片");
            }
            [_imageView setImage:fetchImage];
        }];
    }
    
    
    //获取图片缓存大小
        NSLog(@"%ld", [[MYNetworkProxy defaultProxy] getImageCachesSize]);

    //清除图片缓存
//    [[MYNetworkProxy defaultProxy] clearImageCaches];
}

- (void)httpDownLoadRequest{
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    [[MYNetworkProxy defaultProxy] downLoadFileFrom:[NSURL URLWithString:kDownloadUrl] toFile:[document stringByAppendingPathComponent:[kDownloadUrl lastPathComponent]] withDownLoadBlock:^(MYNetworkResponse *response) {
        if(response.status == MYNetworkResponseStatusSuccessed){
            NSLog(@"下载完成，path：%@", document);
        }else if(response.status == MYNetworkResponseStatusDowning){
            NSLog(@"正在下载，progress：%.2lf", response.progress);
        }else if(response.status == MYNetworkResponseStatusFailed){
            NSLog(@"下载失败，reason：%@", response.error);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
