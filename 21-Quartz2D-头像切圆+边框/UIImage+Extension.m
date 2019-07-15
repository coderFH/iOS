//
//  UIImage+Extension.m
//  21-Quartz2D-头像切圆+边框
//
//  Created by wangfh on 2019/7/15.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)imageWithClip:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color {
    //获取图片的宽度和高度
    CGFloat imageWH = image.size.width;
    
    //设置圆环的宽度
    CGFloat border = borderWidth;
    
    //图形的宽度和高度
    CGFloat ovalWH = imageWH + 2 * border;
    
    //1.开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), NO, 0);
    
    //2.画大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];
    [color set];
    [path fill];
    
    //3.设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageWH, imageWH)];
    [clipPath addClip];
    
    //4.绘制图片
    [image drawAtPoint:CGPointMake(border, border)];
    
    //5.获取图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //6.关闭上下文
    UIGraphicsEndImageContext();
    
    return clipImage;
}

@end
