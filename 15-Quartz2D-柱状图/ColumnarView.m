//
//  ColumnarView.m
//  15-Quartz2D-柱状图
//
//  Created by wangfh on 2019/7/11.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ColumnarView.h"

@implementation ColumnarView

- (void)drawRect:(CGRect)rect {
    NSArray *arr = [self arrRandom];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    for (int i = 0; i<arr.count; i++) {
        w = rect.size.width / (2 * arr.count -1);
        x = 2 * w * i;
        h = [arr[i] floatValue] / 100.0 * rect.size.height;
        y = rect.size.height - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        [[self colorRandom] set];
        [path fill];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

- (NSArray *)arrRandom {
    int total = 100;
    NSMutableArray *arrM = [NSMutableArray array];
    int temp = 0;
    //arc4random_uniform(10) 生成0-9的随记数
    //arc4random_uniform(10) + 1 生成1 -10随机数
    for (int i=0; i<arc4random_uniform(10) + 1; i++) {
        temp = arc4random_uniform(total) + 1;
        [arrM addObject:@(temp)];
        if (temp == total) {
            break;
        }
        total -= temp;
    }
    if (total) {
        [arrM addObject:@(total)];
    }
    return arrM;
}

- (UIColor *)colorRandom {
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

@end
