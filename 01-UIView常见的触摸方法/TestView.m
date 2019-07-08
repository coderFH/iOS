//
//  TestView.m
//  01-UIView常见的触摸方法
//
//  Created by wangfh on 2019/7/5.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "TestView.h"

@implementation TestView

#pragma mark -----当手指开始触摸view
//NSSet 无序
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%ld",touches.count);
    NSLog(@"%s",__func__);
}

#pragma mark -----当手指在view上移动的时候
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s",__func__);
    // 获取UITouch对象
    UITouch *touch = [touches anyObject];
    
    //获取当前点
    CGPoint curP = [touch locationInView:self];
    
    //获取上一个点
    CGPoint preP = [touch previousLocationInView:self];
    
    //获取x轴偏移量
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

#pragma mark -----当手指离开的时候
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
}

#pragma mark -----当触摸事件被打断的时候调用(电话打入)
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     NSLog(@"%s",__func__);
}

//普通的 iphone 应用开发中不会用到这个方法，这个方法是为了 Apple Pencil 的特性设计的，主要见于 Apple Pencil 和 iPad 的联动应用中，例如用 Apple Pencil 在 iPad 上画画
//主要的原因是 Apple Pencil 产生的 touch 事件的部分信息（如 Pencil 的方向等）传递到 iPad 或 iPhone 上会有一定的延时
- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {}

@end
