//
//  SnowView.m
//  17-CADisPlayLink-下雪动画
//
//  Created by wangfh on 2019/7/11.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "SnowView.h"

static CGFloat _sonwY = 0;

@implementation SnowView

- (void)awakeFromNib {
    [super awakeFromNib];
    //每次屏幕刷新的时候就会调用,屏幕一般一秒刷新60次
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"snow"];
    [image drawAtPoint:CGPointMake(50, _sonwY)];
    _sonwY += 10;
    if (_sonwY > rect.size.height) {
        _sonwY = 0;
    }
}

- (void)timeChange {
    //注意:这个方法并不会马上调用drawRect,其实这个方法只是给当前控件添加刷新的标记,等下一次屏幕刷新的时候才会调用drawRect
    [self setNeedsDisplay];
}

@end
