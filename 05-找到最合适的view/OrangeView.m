//
//  OrangeView.m
//  05-找到最合适的view
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "OrangeView.h"

@implementation OrangeView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@----touch",[self class]);
    [super touchesBegan:touches withEvent:event];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *fitView = [super hitTest:point withEvent:event];
    return fitView;
}

@end
