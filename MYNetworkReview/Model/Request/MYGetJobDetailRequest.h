//
//  MYGetJobDetailRequest.h
//  MayiW
//
//  Created by 陈伟南 on 16/8/31.
//  Copyright © 2016年 Jam. All rights reserved.
//

@interface MYGetJobDetailRequest : MYRequestObj

@property (assign, nonatomic) NSInteger ID;//职位id
@property (assign, nonatomic) NSInteger PageIndex;//评论当前页码
@property (assign, nonatomic) NSInteger PageSize;//评论每页条数

@end
