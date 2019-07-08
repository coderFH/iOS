//
//  FHWindow.m
//  05-找到最合适的view
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "FHWindow.h"

@implementation FHWindow

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@----touch",[self class]);
    [super touchesBegan:touches withEvent:event];
}

//作用:专门来寻找最适合的view
//什么时候调用:当一个事件传递给当前View时调用.
//返回谁,谁就是最适合的View
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //1.判断自己能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
        return nil;
    }
    //2.点在不在自己身上
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    //3.从后往前遍历自己的子控件,把事件传递给子控件,让子控件判断自己是否是最适合的view.
    int count = (int)self.subviews.count;
    for (int i = count - 1; i >= 0; i--) {
        //取出子控件
        UIView *childView = self.subviews[i];
        
        //把当前点转换成子控件上的坐标系.
        CGPoint childP = [self convertPoint:point toView:childView];
        UIView *fitView = [childView hitTest:childP withEvent:event];
        if (fitView) {
            return fitView;
        }
    }
    
    //4.没有找到比自己更适合的View,自己就是最适合的view.
    return self;
}

//判断点在不在当前View.
//在hitTest内部调用.
//传入的point,必须得是跟方法调用者在同一个坐标系.
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return YES;
}


@end
