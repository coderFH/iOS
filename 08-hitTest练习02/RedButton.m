//
//  RedButton.m
//  08-hitTest练习02
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "RedButton.h"

@implementation RedButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //判断点在不在blueBtn身上
    CGPoint blueBtnP = [self convertPoint:point toView:self.blueBtn];
    if ([self.blueBtn pointInside:blueBtnP withEvent:event]) {
        //点在blueBtn身上
        return self.blueBtn;
    }
    //如果不在,保持原有做法
    return [super hitTest:point withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取UITouch对象
    UITouch *touch = [touches anyObject];
    //获取上一个点
    CGPoint preP = [touch previousLocationInView:self];
    //获取当前点
    CGPoint curP = [touch locationInView: self];
    //计算偏移量
    CGFloat offsetX = curP.x  - preP.x;
    CGFloat offsetY = curP.y  - preP.y;
    //平移
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

@end
