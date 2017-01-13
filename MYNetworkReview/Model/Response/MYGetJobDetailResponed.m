//
//  MYGetJobDetailResponed.m
//  MayiW
//
//  Created by 陈伟南 on 16/8/31.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "MYGetJobDetailResponed.h"

@implementation SameJobs

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{
             @"area":@"Area",
             @"baiduCoordLat":@"BaiduCoordLat",
             @"baiduCoordLng":@"BaiduCoordLng",
             @"category":@"Category",
             @"jobDate":@"JobDate",
             @"companyName":@"CompanyName",
             @"name":@"Name",
             @"recruitType":@"RecruitType",
             @"wages":@"Wages"
             };
}

@end

@implementation MYGetJobDetailResponed

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{
             @"ageRange":@"AgeRange",
             @"category":@"Category",
             @"contract":@"Contract",
             @"desAccom":@"DesAccom",
             @"desRequire":@"DesRequire",
             @"desWages":@"DesWages",
             @"desWelfare":@"DesWelfare",
             @"desWork":@"DesWork",
             @"edu":@"Edu",
             @"examResult":@"ExamResult",
             @"hasCollect":@"HasCollect",
             @"hasExam":@"HasExam",
             @"hasShare":@"HasShare",
             @"jobBanci":@"JobBanci",
             @"jobExp":@"JobExp",
             @"jobTagList":@"JobTagList",
             @"name":@"Name",
             @"orgLibID":@"OrgLibID",
             @"phone":@"Phone",
             @"reMark":@"ReMark",
             @"recruitNum":@"RecruitNum",
             @"sex":@"Sex",
             @"tags":@"Tags",
             @"wages":@"Wages",
             @"workAddArea":@"WorkAddArea",
             @"workAddCity":@"WorkAddCity",
             @"workAddProv":@"WorkAddProv"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"sameJobs":[SameJobs class]
             };
}

@end
