//
//  PieView.m
//  14-Quartz2D-饼图
//
//  Created by wangfh on 2019/7/11.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "PieView.h"

@implementation PieView

- (void)drawRect:(CGRect)rect {
    NSArray *arr = [self arrRandom];
    CGFloat radius = rect.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    for (int i = 0; i < arr.count; i++) {
        startA = endA;
        angle = [arr[i] integerValue] / 100.0 * M_PI *2;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
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
