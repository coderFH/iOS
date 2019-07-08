//
//  ViewController.m
//  10-手势识别(平移,旋转,缩放)
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //一个手势默认是不能够同时支持多个手势
    //可以通过代理进行设置
    [self pinchGes];
    [self rotationGes];
}

//是否允许同时支持多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


#pragma mark -----捏合手势-----
- (void)pinchGes {
    //添加手势
    //1.创建捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    
    //2.添加手势
    [self.imageV addGestureRecognizer:pinch];
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    //放大, 缩小
    //获取缩放比例(相对于最原始的比例)
    CGFloat scale = pinch.scale;
    self.imageV.transform = CGAffineTransformScale(self.imageV.transform, scale, scale);
    [pinch setScale:1];
}


#pragma mark -----旋转手势-----
- (void)rotationGes {
    //1.创建旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self; //如果想让一个视图支持两个手势,就需要通过代理实现
    //2.添加手势
    [self.imageV addGestureRecognizer:rotation];
}

- (void)rotation:(UIRotationGestureRecognizer *)rotationGes {
    //获取旋转角度(已经是弧度)
    //相对于最原始的弧度
    CGFloat rotatinon = rotationGes.rotation;
    self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, rotatinon);
    //清0
    [rotationGes setRotation:0];
}

#pragma mark -----平移手势-----
- (void)panGes {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageV addGestureRecognizer:pan];
}

//当拖动时持续调用
- (void)pan:(UIPanGestureRecognizer *)pan {
    //获取偏移量
    //获取的偏移量是相对于最原始的点
    CGPoint transP = [pan translationInView:self.imageV];
    NSLog(@"%@",NSStringFromCGPoint(transP));
    self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, transP.x, transP.y);
    
    //清0操作,因为每次平移都是相对于最开始位置,所以对导致数值都累加 (不让偏移量进行累加,获取的是相对于上一次的值,每一次走的值.)
    [pan setTranslation:CGPointMake(0, 0) inView:self.imageV];
}

@end
