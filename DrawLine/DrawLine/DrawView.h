//
//  DrawView.h
//  DrawLine
//
//  Created by 陈超 on 2016/12/7.
//  Copyright © 2016年 陈超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
//纵轴数据
@property (nonatomic, strong) NSArray *zongArray;

//横轴数据
@property (nonatomic, assign) NSInteger count;


//纵轴范围
@property (nonatomic, strong) NSArray *range;
@end
