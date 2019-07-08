//
//  YellowView.m
//  02-hitText
//
//  Created by wangfh on 2019/7/5.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "YellowView.h"

@interface YellowView()


@end
@implementation YellowView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    return nil;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    return YES;
}


@end
