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

/**
 * Json格式
 {
     AgeRange = "18-40";
     Category = 1;
     Contract = "<null>";
     DesAccom = "<p>1\U3001\U4f19\U98df\Uff1a\U5305\U4e09\U9910\Uff1b 2\U3001\U4f4f\U5bbf\Uff1a\U516c\U53f8\U63d0\U4f9b\U5bbf\U820d\Uff0c\U6c34\U7535\U8d39\U5e73\U644a\Uff0c\U5bbf\U820d\U79bb\U516c\U53f8\U4e0d\U592a\U8fdc\Uff0c\U6ca1\U6709\U5382\U8f66 3\U3001\U4fdd\U9669\Uff1a\U5165\U804c\U7f34\U7eb3\U4e59\U7c7b\U4fdd\U9669\Uff0c2\U4e2a\U6708\U540e\U7f34\U7eb3\U793e\U4fdd\Uff1b</p>\n";
     DesRequire = "<p>1\U3001\U5e74\U9f84\Uff1a18-35\U5c81\Uff0c\U7537\U5973\U7537\U5973\U4e0d\U9650\Uff1b</p>\n\n<p>2\U3001\U5b66\U5386\U8981\U6c42\Uff1a\U4e0d\U9650\Uff1b</p>\n\n<p>3\U3001\U8ba4\U8bc626\U4e2a\U82f1\U6587\U5b57\U6bcd\Uff0c\U7eb9\U8eab\U548c\U70df\U75a4\U4e0d\U660e\U663e\U5c31\U53ef\U4ee5\Uff1b 4\U3001\U8eab\U4f53\U5065\U5eb7\Uff0c\U89c6\U529b\U548c\U8eab\U9ad8\U6ca1\U6709\U8981\U6c42_</p>\n";
     DesWages = "<p>1\U3001\U57fa\U672c\U5de5\U8d44\Uff1a1820\U5143\Uff1b 2\U3001\U8bd5\U7528\U671f2\U6708\Uff1b 3\U3001\U57f9\U8bad\U6d25\U8d34\Uff1a120\U5143/\U6708\Uff1b 4\U3001\U52a0\U73ed\U8d39\Uff1a1820\U5143\U4e3a\U57fa\U6570\U8ba1\U7b97\Uff0c\U5e73\U65f61.5\U500d\Uff0c\U5468\U672b2\U500d\Uff0c\U8282\U5047\U65e53\U500d\U5de5\U8d44</p>\n";
     DesWelfare = "<p>\U52a0\U85aa\U3001\U5956\U91d1\U3001\U516c\U53f8\U6d3b\U52a8\U3001\U5e73\U65f6\U56fd\U5bb6\U8282\U5047\U65e5\U793c\U54c1\U53d1\U653e\U3001\U751f\U65e5\U793c\U54c1\U3001\U4f53\U68c0\U7b49\U7b49</p>\n\n<p>\U516c\U53f8\U5458\U5de5\U4eab\U6709\U6700\U9ad811\U5929\U5e26\U85aa\U5e74\U5047</p>\n";
     DesWork = "<p>\U516c\U53f8\U4e3b\U8981\U505a\U7cbe\U5bc6\U673a\U68b0\U91d1\U5c5e\U51b2\U538b\U53ca\U6a21\U5177\U8bbe\U8ba1 1\U30012\U73ed\U5012\Uff0c5\U59298\U5c0f\U65f6\Uff0c8\U5c0f\U65f6\U5916\U7b97\U52a0\U73ed\Uff1b 2\U3001\U4e0d\U7a7f\U65e0\U5c18\U8863</p>\n";
     Edu = "\U521d\U4e2d";
     ExamResult = "0%";
     HasCollect = 0;
     HasExam = 0;
     HasShare = 0;
     JobBanci = "\U4e8c\U73ed\U5012";
     JobExp = "1-5\U5e74";
     JobTagList =     (
     "\U4e0d\U7a7f\U65e0\U5c18\U670d",
     "\U7ba1\U5403",
     "\U8282\U65e5\U798f\U5229",
     "\U9ad8\U6e29\U8865\U8d34",
     "\U5458\U5de5\U65c5\U6e38",
     "\U533b\U7597\U4fdd\U9669"
     );
     Name = "\U4f5c\U4e1a\U5458";
     OrgLibID = 2716;
     Phone = 4008584008;
     ReMark = "<null>";
     RecruitNum = "10\U4eba";
     SameJobs =     (
     {
     Area = "\U74a7\U5c71\U53bf";
     BaiduCoordLat = "29.5705";
     BaiduCoordLng = "106.228777";
     Category = 1;
     CompanyName = "\U91cd\U5e86\U5942\U946b\U79d1\U6280\U6709\U9650\U516c\U53f8";
     ID = 1999;
     JobDate = "2017-01-13 09:18:03";
     Name = "\U5942\U946b-\U4ea7\U7ebf\U4f5c\U4e1a\U5458";
     RecruitType = "\U957f\U671f\U5de5";
     Wages = "3000-3999";
     },
     {
     Area = "\U5408\U5ddd\U533a";
     BaiduCoordLat = "29.941848";
     BaiduCoordLng = "106.299625";
     Category = 1;
     CompanyName = "\U91cd\U5e86\U8fbe\U65b9\U7535\U5b50\U6709\U9650\U516c\U53f8";
     ID = 1998;
     JobDate = "2017-01-13 09:18:03";
     Name = "\U8fbe\U65b9-\U4ea7\U7ebf\U4f5c\U4e1a\U5458";
     RecruitType = "\U957f\U671f\U5de5";
     Wages = "2000-2999";
     },
     {
     Area = "\U5317\U4ed1\U533a";
     BaiduCoordLat = "29.90164";
     BaiduCoordLng = "121.775001";
     Category = 1;
     CompanyName = "\U5b81\U6ce2\U74a8\U5b87\U5149\U7535";
     ID = 2439;
     JobDate = "2017-01-13 09:18:03";
     Name = "\U74a8\U5b87-\U4f5c\U4e1a\U5458";
     RecruitType = "\U957f\U671f\U5de5";
     Wages = "3000-3999";
     },
     {
     Area = "\U74a7\U5c71\U53bf";
     BaiduCoordLat = "29.5705";
     BaiduCoordLng = "106.228777";
     Category = 1;
     CompanyName = "\U91cd\U5e86\U5942\U946b\U79d1\U6280\U6709\U9650\U516c\U53f8";
     ID = 2469;
     JobDate = "2017-01-13 09:18:03";
     Name = "\U64cd\U4f5c\U5de5";
     RecruitType = "\U4e0d\U9650";
     Wages = "\U9762\U8bae";
     }
     );
     Sex = "\U4e0d\U9650";
     Tags =     (
     );
     Wages = "3000-3999";
     WorkAddArea = "\U5de5\U4e1a\U56ed\U533a";
     WorkAddCity = "\U82cf\U5dde\U5e02";
     WorkAddProv = "\U6c5f\U82cf\U7701";
 }
 
 */

@end
