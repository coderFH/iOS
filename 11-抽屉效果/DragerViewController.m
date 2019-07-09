//
//  DragerViewController.m
//  11-抽屉效果
//
//  Created by wangfh on 2019/7/9.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "DragerViewController.h"

#define ScreenW  [UIScreen mainScreen].bounds.size.width
#define Targent [UIScreen mainScreen].bounds.size.width * 0.8

@interface DragerViewController ()

@end

@implementation DragerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addchildView];
}

- (void)addchildView {
    [self.view addSubview:self.bgView];
    self.bgView.frame = self.view.bounds;
    [self.view addSubview:self.mainView];
    self.mainView.frame = self.view.bounds;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor blueColor];
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
        [_bgView addGestureRecognizer:tapGes];
    }
    return _bgView;
}

- (UIView *)mainView {
    if (!_mainView) {
        _mainView = [[UIView alloc] init];
        _mainView.backgroundColor = [UIColor redColor];
        UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(userPanView:)];
        [_mainView addGestureRecognizer:panGes];
    }
    return _mainView;
}

- (void)userPanView:(UIPanGestureRecognizer *)pan {
    //获取偏移量
    CGPoint panP = [pan translationInView:self.mainView];
    //根据偏移量,计算当前位置的大小
    [self positionWithOffSet:panP.x];
    if(pan.state == UIGestureRecognizerStateEnded) {
        if (self.mainView.frame.origin.x < ScreenW * 0.5) { //如果当前x值小于屏幕宽度一半时,自动定位到左侧
            [self close];
        } else {// //如果当前x值大于屏幕宽度一半时,自动定位到右侧
            [UIView animateWithDuration:0.25 animations:^{
                CGFloat offset = Targent - self.mainView.frame.origin.x;
                [self positionWithOffSet:offset];
            }];
        }
    }
    [pan setTranslation:CGPointZero inView:self.mainView];
}

- (void)positionWithOffSet:(CGFloat)offset {
    //平移
    CGRect frame = self.mainView.frame;
    frame.origin.x += offset;
    self.mainView.frame = frame;
    
    //不可以向左滑
    if (self.mainView.frame.origin.x <=0) {
        self.mainView.frame = self.view.bounds;
    }
    //不能超过目标值
    if (self.mainView.frame.origin.x >= Targent) {
        CGRect frame = self.mainView.frame;
        frame.origin.x = Targent;
        self.mainView.frame = frame;
    }
    CGFloat scale = self.mainView.frame.origin.x * 0.3 / ScreenW;
    scale = 1 - scale;
    self.mainView.transform = CGAffineTransformMakeScale(scale, scale);
    
}

- (void)open {
    [UIView animateWithDuration:0.25 animations:^{
        [self positionWithOffSet:Targent];
        CGRect frame = self.mainView.frame;
        frame.origin.x = Targent;
        self.mainView.frame = frame;
    }];
}

- (void)close {
    [UIView animateWithDuration:0.5 animations:^{
        //清空形变
        self.mainView.transform = CGAffineTransformIdentity;
        //位置复位
        self.mainView.frame = self.view.bounds;
    }];
}

@end
