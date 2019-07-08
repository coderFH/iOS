//
//  ViewController.m
//  11-抽屉效果
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *mainView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bgView];
    self.bgView.frame = self.view.bounds;
    [self.view addSubview:self.mainView];
    self.mainView.frame = self.view.bounds;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor blueColor];
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
    CGPoint panP = [pan translationInView:self.mainView];
    
    CGRect frame = self.mainView.frame;
    frame.origin.x += panP.x;
    self.mainView.frame = frame;
    
    if (self.mainView.frame.origin.x <= 0) {
        self.mainView.frame = self.view.bounds;
    }
    [pan setTranslation:CGPointZero inView:self.mainView];
}

@end
