//
//  GreenView.m
//  07-hideTest练习01
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "GreenView.h"

@interface GreenView()

/**
 小tips:因为btn在sb中,不能直接拖线过来进行属性关联,所以可以先写出来,去反向关联
 */
@property (nonatomic, weak) IBOutlet UIButton *redBtn;

@end

@implementation GreenView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint btnP = [self convertPoint:point toView:self.redBtn];
    if ([self.redBtn pointInside:btnP withEvent:event]) {
        return self.redBtn;
    }else {
        return [super hitTest:point withEvent:event];
    }
}

@end
