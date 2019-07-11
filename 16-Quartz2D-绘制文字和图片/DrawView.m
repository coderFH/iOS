//
//  DrawView.m
//  16-Quartz2D-绘制文字和图片
//
//  Created by wangfh on 2019/7/11.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


- (void)drawRect:(CGRect)rect {
    [self drawPic:rect];
}

#pragma mark ----------- 3.绘图 -----------
- (void)drawPic:(CGRect)rect {
    //1.加载图片
    UIImage *image = [UIImage imageNamed:@"001"];
    
    //设置一个裁剪区域(超过裁剪区域以外的内容全部裁剪掉)
    UIRectClip(CGRectMake(20, 40, 100, 50));
    
    //绘制图片的三种方法:
    //1.drawAtPoint:绘制的是原始图片的尺寸大小.
    //[image drawAtPoint:CGPointZero];
    
    //2.把图片填充到指定的区域
    //[image drawInRect:CGRectMake(10, 10, 100, 100)];
    
    //3.把图片平铺到指定的区域
    [image drawAsPatternInRect:rect];
    
    
//    [[UIColor redColor] set];
//    UIRectFill(CGRectMake(50, 50, 100, 100));
}

#pragma mark ----------- 2.drawInRect 和  drawAtPoint 的区别 -----------
- (void)drawInRectDrawAtPoint:(CGRect)rect {
    NSString *str = @"hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello";
//    [str drawAtPoint:CGPointZero withAttributes:nil]; //不会换行
    [str drawInRect:rect withAttributes:nil];
}

#pragma mark ----------- 1.绘制文字 -----------
- (void)drawCharacter {
    //绘制文字
    NSString *str = @"wangfh";
    NSMutableDictionary *textDict = [NSMutableDictionary dictionary];
    
    //设置文字颜色
    textDict[NSForegroundColorAttributeName] = [UIColor purpleColor];
    //设置文字字体
    textDict[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    //设置文字的空心颜色和宽度
    textDict[NSStrokeColorAttributeName] = [UIColor yellowColor];
    textDict[NSStrokeWidthAttributeName] = @3;
    
    //设置阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor redColor];
    //设置阴影的偏移量
    shadow.shadowOffset = CGSizeMake(10, 10);
    shadow.shadowBlurRadius = 3; //模糊i效果
    textDict[NSShadowAttributeName] = shadow;
    
    [str drawAtPoint:CGPointZero withAttributes:textDict];
}

@end
