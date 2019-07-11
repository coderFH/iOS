//
//  DrawView.m
//  18-Quartz2D-上下文的状态
//
//  Created by wangfh on 2019/7/11.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.====================绘制第一条线====================
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 150)];
    [path addLineToPoint:CGPointMake(280, 150)];
    CGContextAddPath(ctx, path.CGPath);
    
    //把当前上下文的状态保存到上下文状态栈
    CGContextSaveGState(ctx);   //先存了一个系统默认的上下文
    
    CGContextSetLineWidth(ctx, 10);
    [[UIColor redColor] set];
    
    //把当前上下文的状态保存到上下文状态栈
    CGContextSaveGState(ctx);  //然后存了一个线宽是10 红色的上下文
    
    //取出上下文当中所有绘制的路径
    //把上下文当中的状态应用到所有路径当中.
    CGContextStrokePath(ctx); // 绘制的时候就是线宽是10,红色线
    
    //3.====================绘制第二条线====================
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(150, 20)];
    [path2 addLineToPoint:CGPointMake(150, 280)];
    CGContextAddPath(ctx, path2.CGPath);
    

    CGContextSetLineWidth(ctx, 5);
    [[UIColor yellowColor] set];  //在这里,我又设置了ctx线宽是5 黄色的状态
    
    //从上下文状态栈中取出状态
    //从当前的上下文状态栈中取出栈顶的状态,覆盖掉当前的上下文状态
    CGContextRestoreGState(ctx); //取出 线宽是10 红色的ctx  覆盖了 线宽是5 黄色的ctx  所以黄色的没起作用
    CGContextRestoreGState(ctx); //取出 默认的ctx


    //取出上下文当中所有绘制的路径
    //把上下文当中的状态应用到所有路径当中.
    CGContextStrokePath(ctx);   // 用默认的ctx进行绘制
}

@end
