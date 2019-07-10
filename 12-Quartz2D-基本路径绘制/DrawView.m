//
//  DrawView.m
//  12-Quartz2D-基本路径绘制
//
//  Created by wangfh on 2019/7/10.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

//作用:专门用来绘图
//什么时候调用:当View显示时调用
//参数:当前View的bounds
- (void)drawRect:(CGRect)rect {
    NSLog(@"%s",__func__);
    [self drawArc:rect];
}

#pragma mark -----5.绘制圆弧--------
- (void)drawArc:(CGRect)rect {
    //Center:弧所在圆的圆心
    //radius:弧所在圆的半径
    //startAngle:开始角度 ;0度是在圆的最右侧,向上,度数是负的,向下,度数是正的.
    //endAngle:截至角度  (哪个位置)
    //clockwise:是否为顺时针 (怎么样到这个位置)
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:-M_PI_2 clockwise:NO];
    
    //添加一根线到圆形
    [path addLineToPoint:center];
    
    //关闭路径(从路径的终点连接一根到到路径的起点)
    [path closePath];
    
    [[UIColor redColor] set];
    
    [path fill]; //当使用填充时,会自动关闭路径
}

#pragma mark -----4.绘制圆形--------
/*之前的三个例子都是先获取上下文,然后描述路径,然后添加路径到上下文,最后渲染到layer上
 其实1.3步 系统已经帮我们做了,但是我们需要了解他是怎么画的,所以之前的例子都是一步步的去画
 现在开始就不用那些步骤了,直接描述路径,然后绘制
 */
- (void)drawShape {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 200, 200)  cornerRadius:100];
    [[UIColor yellowColor] set];
    [path stroke];
    
    //当宽高一致的时候,就是一个圆形
    UIBezierPath *ovaPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 350, 100, 50)];
    [[UIColor redColor] set];
    [ovaPath fill];
}


#pragma mark -----3.绘制矩形--------
- (void)drawRect {
    //1. 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 200, 100)];
    
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    //4.把上下文的内容渲染到view的layer;
    CGContextStrokePath(ctx);
}

#pragma mark -----2.绘制曲线--------
- (void)drawCurveLine {
    //1. 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //画曲线
    [path moveToPoint:CGPointMake(50, 250)];
    //添加一根曲线到某个点
    [path addQuadCurveToPoint:CGPointMake(250, 250) controlPoint:CGPointMake(50, 50)];
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文的内容渲染到view的layer;
    CGContextStrokePath(ctx);
}

#pragma mark -----1.绘制线--------
- (void)drawLine {
    //1.获取当前跟View相关联的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPath]; //一个路径可以描述多条线
    
    //2.1 设置起点
    //坐标原点是以当前绘制view的左上角为(0,0)
    [path moveToPoint:CGPointMake(50, 50)];
    //2.2 添加一根线到某个点
    [path addLineToPoint:CGPointMake(150, 150)];
    
    //添加另外一条线
    [path moveToPoint:CGPointMake(100, 50)];
    [path addLineToPoint:CGPointMake(150, 250)];
    
    //把上一路径的终点作为下一个路径的起点
    [path addLineToPoint:CGPointMake(250, 50)];
    
    
    //设置上下文的状态
    //设置线的宽度
    CGContextSetLineWidth(ctx, 10);
    //设置上下文的连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    //设置顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    //设置线的颜色
    //setStroke setFill
    //如果直接使用set,会自动匹配渲染的模式.
    [[UIColor redColor] set];
    
    //4. 把上下文的当中绘制的所有路径渲染到view相关联的layer当中
    //渲染的方式有两种:
    //描边:stroke
    //填充:fill
    CGContextStrokePath(ctx);
    
}

@end
