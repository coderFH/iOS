//
//  UIImage+Extension.h
//  21-Quartz2D-头像切圆+边框
//
//  Created by wangfh on 2019/7/15.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

+ (UIImage *)imageWithClip:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
