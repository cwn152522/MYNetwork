//
//  MYGetJobDetailResponed.h
//  MayiW
//
//  Created by 陈伟南 on 16/8/31.
//  Copyright © 2016年 Jam. All rights reserved.
//

@interface SameJobs : MYResponedObj//该节点下为相似职位的信息

@property (copy, nonatomic) NSString *area;//区域，只显示行政区
@property (assign, nonatomic) CGFloat baiduCoordLat;//百度纬度;
@property (assign, nonatomic) CGFloat baiduCoordLng;//百度经度;
@property (copy, nonatomic) NSString *category;//1.今日招聘 2.打工预约 3.普通招聘
@property (copy, nonatomic) NSString *companyName;//入职企业名称
@property (assign, nonatomic) NSInteger ID;//职位ID
@property (copy, nonatomic) NSString *jobDate;//职位发布日期
@property (copy, nonatomic) NSString *name;//职位名称
@property (copy, nonatomic) NSString *recruitType;//录用类型
@property (copy, nonatomic) NSString *wages;//薪资描述

@end

@interface MYGetJobDetailResponed : MYResponedObj

@property (strong, nonatomic) NSArray *sameJobs;
@property (copy, nonatomic) NSString *ageRange; //年龄要求
@property (assign, nonatomic) NSInteger category;//1.今日招聘 2.打工预约 3.普通招聘
@property (copy, nonatomic) NSString *contract;//联系人
@property (copy, nonatomic) NSString *desAccom;//食宿怎么样（食宿描述）
@property (copy, nonatomic) NSString *desRequire;//有啥要求（要求描述）
@property (copy, nonatomic) NSString *desWages;//工资多少（薪资描述）
@property (copy, nonatomic) NSString *desWelfare;//福利待遇（福利待遇描述）
@property (copy, nonatomic) NSString *desWork;//干活多少（干活描述）
@property (copy, nonatomic) NSString *edu;//学历要求
@property (copy, nonatomic) NSString *examResult;//职位匹配结果，未匹配时显示未匹配
@property (assign, nonatomic) BOOL hasCollect;//是否已收藏？
@property (assign, nonatomic) BOOL hasExam;//是否已匹配？
@property (assign, nonatomic) BOOL hasShare;// 是否已分享？
@property (copy, nonatomic) NSString *jobBanci;//工作班次
@property (copy, nonatomic) NSString *jobExp;//工作经历要求
@property (strong, nonatomic) NSArray *jobTagList;//职位亮点
@property (copy, nonatomic) NSString *name;//职位名称
@property (assign, nonatomic) NSString *orgLibID;//企业id
@property (copy, nonatomic) NSString *phone;//联系电话
@property (copy, nonatomic) NSString *reMark;//职位描述，非今日招聘或今日招聘的“薪资描述、干活描述、要求描述、食宿描述、福利待遇描述”都为空的职位显示该描述
@property (copy, nonatomic) NSString *recruitNum;//招聘人数
@property (copy, nonatomic) NSString *sex;//性别要求，全男显示为男，全女显示为女，其他显示为不限
@property (strong, nonatomic) NSArray *tags;//职位下的标签
@property (copy, nonatomic) NSString *wages;//薪资描述
@property (copy, nonatomic) NSString *workAddArea;//工作地点区
@property (copy, nonatomic) NSString *workAddCity;//工作地点市
@property (copy, nonatomic) NSString *workAddProv;// 工作地点省

@end
