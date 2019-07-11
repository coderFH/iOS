//
//  DrawView.m
//  13-Quartz2D-下载进度案例
//
//  Created by wangfh on 2019/7/11.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    
    //注意,这里为什么能不能使用[self drawRect:self.bounds];
    //当系统调用drawRect方法时 在drawRect:内部会自动创建跟View相关联的上下文
    //手动调用,是不会创建上下文.
    
    //通知系统,调用drawRect
    //重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    //M_PI 180度
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.height * 0.5 - 50;
    CGFloat startAngle = -M_PI_2;
    //结束角度 = -90 + 进度 * 180 * 2
    CGFloat endAngle = startAngle + self.progressValue * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor colorWithWhite:1 alpha:0.5] set];
    [path fill];
}

@end
