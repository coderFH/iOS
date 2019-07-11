//
//  VcView.m
//  19-Quartz2D-形变操作
//
//  Created by wangfh on 2019/7/11.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "VcView.h"

@implementation VcView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 100)];
    //形变操作
    //CGContextTranslateCTM(ctx, 0, 100);
    //CGContextScaleCTM(ctx, 1.5, 1.5);
    CGContextRotateCTM(ctx, M_PI_4);
    
    CGContextAddPath(ctx, path.CGPath);
    [[UIColor redColor] set];
    CGContextFillPath(ctx);
}


@end
