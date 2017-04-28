//
//  MYGetUserInfoResponed.h
//  MYNetworkReview
//
//  Created by ios 3 on 2017/1/13.
//  Copyright © 2017年 chenweinan. All rights reserved.
//

#import "MYResponedObj.h"

@interface  GetUserInfoResult: MYResponedObj

@property (assign, nonatomic)  NSInteger age;
@property (strong, nonatomic) NSString *headerImage;
@property (strong, nonatomic) NSString *name;

@end

@interface MYGetUserInfoResponed : MYResponedObj

@property (assign, nonatomic) NSInteger error_code;
@property (strong, nonatomic) NSString *reason;
@property (strong, nonatomic) GetUserInfoResult *result;

@end

/**
 * Json格式
 {
 "error_code" = 200;
 reason = success;
 result =     {
 age = 24;
 headerImage = "http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg";
 name = "\U9648\U4f1f\U5357";
 };
 }
 */
