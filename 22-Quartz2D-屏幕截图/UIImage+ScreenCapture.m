//
//  UIImage+ScreenCapture.m
//  22-Quartz2D-屏幕截图
//
//  Created by wangfh on 2019/7/15.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "UIImage+ScreenCapture.h"

@implementation UIImage (ScreenCapture)

+ (UIImage *)imageWithCaputure:(UIView *)view {
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //把控件上的图层渲染到上下文,layer只能渲染
    [view.layer renderInContext:ctx];
    
    //生成一张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
