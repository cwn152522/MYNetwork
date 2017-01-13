//
//  MYTestViewController.m
//  MYNetworkReview
//
//  Created by ios 3 on 2017/1/13.
//  Copyright © 2017年 chenweinan. All rights reserved.
//

#import "MYTestViewController.h"
#import "MYGetUserInfoRequest.h"

static NSString *kUploadPath= @"/User/index.php/Home/UploadImage/uploadimage";

@interface MYTestViewController ()

@end

@implementation MYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"本地服务器测试";
    [self testGetRequest];
//        [self httpUploadRequest];
    // Do any additional setup after loading the view.
}

- (void)testGetRequest{
    MYGetUserInfoRequest *request = [[MYGetUserInfoRequest alloc] init];
    request.userInfoId = 1;
    [[MYNetworkProxy defaultProxy] httpGetWithRequestObj:request entityClass:nil withCompleteBlock:^(MYNetworkResponse *response) {
        if(response.status == MYNetworkResponseStatusSuccessed){
            NSDictionary *info = (NSDictionary *)response.content;
            return ;
        }
    }];
}

- (void)httpUploadRequest{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"MaYiDaGong.pc6.apk"];
    MYRequestObj *request = [[MYRequestObj alloc] init];
    request.hostName = GLOBAL_REQUEST_LOCAL_HOSTNAME;
    request.path = kUploadPath;
    request.paramsDic = @{@"phone":@"13123323395"};
    request.responseSerializer = MYHTTPResponseSerializerTypeData;
    [[MYNetworkProxy defaultProxy] upLoadFileWithRequestObj:request filePath:path entityClass:nil withUpLoadBlock:^(MYNetworkResponse *response) {
        if(response.status == MYNetworkResponseStatusSuccessed){
            NSLog(@"上传完成，path：%@", response.content);
        }else if(response.status == MYNetworkResponseStatusUploading){
            NSLog(@"正在上传，progress：%.2lf", response.progress);
        }else if(response.status == MYNetworkResponseStatusFailed){
            NSLog(@"上传失败，reason：%@", response.error);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
