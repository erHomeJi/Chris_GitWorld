//
//  ViewController.m
//  DrawLine
//
//  Created by 陈超 on 2016/12/7.
//  Copyright © 2016年 陈超. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "DrawView.h"

#define k_count dateCount
#define k_width self.view.bounds.size.width
@interface ViewController ()

@property (nonatomic, strong) UIView *bakegroundView;

//纵轴数据
@property (nonatomic, strong) NSArray *zongArray;

//横轴数据
@property (nonatomic, assign) NSInteger count;


//纵轴范围
@property (nonatomic, strong) NSArray *range;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpUI];
    
    [self drawView];
}

CGFloat marginY;
-(void)setUpUI{

//    UIBezierPath* path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(100.0, 20.0)];
//    [path addLineToPoint:CGPointMake(200.0, 60.0)];
//    [path addLineToPoint:CGPointMake(300.0, 40.0)];
//    [path addLineToPoint:CGPointMake(400.0, 60.0)];
//    
//    CAShapeLayer* pathLayer = [CAShapeLayer layer];
//    pathLayer.frame = self.view.bounds;
//    pathLayer.path = path.CGPath;
//    pathLayer.strokeColor = [[UIColor redColor] CGColor];
//    pathLayer.fillColor = nil;
//    pathLayer.lineWidth = 2.0f;
//    pathLayer.lineJoin = kCALineJoinRound;
//    
//    [self.view.layer addSublayer:pathLayer];
//    
//    
//    
//    CABasicAnimation* pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    pathAnimation.duration = 2.0;
//    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
//    [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];

    NSInteger dateCount = 6;
    self.count = dateCount;
    NSArray* dataArray = @[@"17500",@"25000",@"23000",@"14200",@"22345",@"19000"];
    NSArray* zongArray = @[@"11,000",@"14,000",@"17,000",@"20,000",@"23,000",@"26,000"];
    self.range = [NSArray arrayWithObjects:@"11000", @"26000", nil];
    self.zongArray = dataArray;
    //创建一个背景的View
    UIView* bkView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width-20, 250)];
    self.bakegroundView = bkView;
    [self.view addSubview:bkView];
//    bkView.layer.masksToBounds = YES;
//    bkView.layer.borderColor = [UIColor blackColor].CGColor;
//    bkView.layer.cornerRadius = 10;
//    bkView.layer.borderWidth = 0.5;
    
    //循环创建月份label
    for (NSInteger i = 0; i < k_count; i++) {
        UILabel* dateLabel = [[UILabel alloc] init];
        dateLabel.textAlignment = NSTextAlignmentCenter;
        //        dateLabel.frame = CGRectMake(k_width/k_count, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        [bkView addSubview:dateLabel];
        dateLabel.text = [NSString stringWithFormat:@"%ld月",i+1];
        dateLabel.font = [UIFont systemFontOfSize:11];
        CGFloat centerX = (bkView.bounds.size.width-60-20)/(k_count-1) * i + 60;
        [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(bkView.mas_left).offset(centerX);
            make.bottom.equalTo(bkView);
            
        }];
    }
    
    //循环创建纵轴label
    for (NSInteger i = 0; i < 6; i++) {
        UILabel* zongLabel = [[UILabel alloc] init];
        zongLabel.textAlignment = NSTextAlignmentCenter;
        [bkView addSubview:zongLabel];
        zongLabel.text = zongArray[5-i];
        zongLabel.font = [UIFont systemFontOfSize:11];
        CGFloat centerY = (bkView.bounds.size.height-30-20)/5 * i + 30;
        marginY = 30;
        [zongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(bkView.mas_top).offset(centerY);
            make.left.equalTo(bkView);
            make.width.equalTo(@60);
        }];
    }
}

-(void)drawView{
    DrawView* drawView = [[DrawView alloc] initWithFrame:CGRectMake(60, marginY, self.bakegroundView.bounds.size.width - 60, self.bakegroundView.bounds.size.height - marginY - 20)];
    drawView.backgroundColor = [UIColor whiteColor];
    [self.bakegroundView addSubview:drawView];
    
    drawView.count = self.count;
    drawView.range = self.range;
    drawView.zongArray = self.zongArray;
}

@end
