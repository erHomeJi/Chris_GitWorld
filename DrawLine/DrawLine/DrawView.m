//
//  DrawView.m
//  DrawLine
//
//  Created by 陈超 on 2016/12/7.
//  Copyright © 2016年 陈超. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(0.0, self.bounds.size.height)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width,self.bounds.size.height)];
//        [path addLineToPoint:CGPointMake(300.0, 40.0)];
//        [path addLineToPoint:CGPointMake(400.0, 60.0)];
    [path stroke];
}

-(void)setZongArray:(NSArray *)zongArray{
    _zongArray = zongArray;
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    if(self.count){
        //对X轴坐标的处理
        CGFloat aveX = (self.bounds.size.width-20)/ (self.count-1);
        
        //对纵轴坐标的处理
        NSMutableArray* zongSecondArray = [NSMutableArray array];
        CGFloat cha = [self.range[1] floatValue] - [self.range[0] floatValue];
        CGFloat pingjunzhi = self.bounds.size.height / cha;
        for (NSInteger i = 0; i < self.zongArray.count; i++) {
            CGFloat newData =  ([self.range[1] floatValue] - [self.zongArray[i] floatValue]) * pingjunzhi;
            [zongSecondArray addObject:[NSString stringWithFormat:@"%f",newData]];
            NSLog(@"%f",newData);
        }
//        NSLog(@"%zd",zongSecondArray[])
        for (NSInteger i = 0; i < self.count; i++) {
            if(i == 0){
               [path moveToPoint:CGPointMake(0.0, [zongSecondArray[i] floatValue])];
            }else{
               [path addLineToPoint:CGPointMake(aveX * i, [zongSecondArray[i] floatValue])];
            }
        }
        
        CAShapeLayer* pathLayer = [CAShapeLayer layer];
        pathLayer.frame = self.bounds;
        pathLayer.path = path.CGPath;
        pathLayer.strokeColor = [[UIColor redColor] CGColor];
        pathLayer.fillColor = nil;
        pathLayer.lineWidth = 2.0f;
        pathLayer.lineJoin = kCALineJoinRound;
        
        [self.layer addSublayer:pathLayer];
        
        
        
        CABasicAnimation* pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = 2.0;
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
        
//        [self setNeedsDisplay];
        
    }
//        [path moveToPoint:CGPointMake(0.0, 20.0)];
//        [path addLineToPoint:CGPointMake(200.0, 60.0)];
//        [path addLineToPoint:CGPointMake(300.0, 40.0)];
//        [path addLineToPoint:CGPointMake(400.0, 60.0)];
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

}
@end
