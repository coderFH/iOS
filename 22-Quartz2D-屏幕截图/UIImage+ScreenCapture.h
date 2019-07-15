//
//  UIImage+ScreenCapture.h
//  22-Quartz2D-屏幕截图
//
//  Created by wangfh on 2019/7/15.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ScreenCapture)

+ (UIImage *)imageWithCaputure:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
