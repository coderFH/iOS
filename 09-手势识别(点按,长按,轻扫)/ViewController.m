//
//  ViewController.m
//  09-手势识别(点按,长按,轻扫)
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SwipeGes];
}

#pragma mark -----轻扫手势-----
- (void)SwipeGes {
    //添加手势
    //1.创建轻扫
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGes:)];
    
    //默认是向右轻扫
    //设置轻扫的方向
    //注意:  一个轻扫手势只能对应一个方向
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    //2.添加手势
    [self.image addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipe2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGes:)];
    swipe2.direction = UISwipeGestureRecognizerDirectionRight;
    [self.image addGestureRecognizer:swipe2];
}

- (void)swipeGes:(UISwipeGestureRecognizer *)swipe {
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"UISwipeGestureRecognizerDirectionLeft");
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"UISwipeGestureRecognizerDirectionRight");
    }
}

#pragma mark -----长按手势-----
- (void)pressGes {
    //1.创建长按
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGes:)];
    //2.添加手势
    [self.image addGestureRecognizer:longP];
}

//长按手势分状态,长按移动时,会持续调用
- (void)longGes:(UILongPressGestureRecognizer *)longP {
    if (longP.state == UIGestureRecognizerStateBegan) {
        NSLog(@"UIGestureRecognizerStateBegan");
    }else if (longP.state == UIGestureRecognizerStateChanged) {
        NSLog(@"UIGestureRecognizerStateChanged");
    }else if (longP.state == UIGestureRecognizerStateEnded) {
        NSLog(@"UIGestureRecognizerStateEnded");
    }
}

#pragma mark -----点按手势-----
- (void)tapGes {
    //1.创建点按手势
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    tapGes.delegate = self;
    //2.添加手势
    [self.image addGestureRecognizer:tapGes];
}

//可以实现该代理方法,来控制点击区域是否响应事件
//是否允许接收手指
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //获取当前的点
    CGPoint curP = [touch locationInView:self.image];
    //判断点在图片的左边还是右边;
    if (curP.x > self.image.bounds.size.width * 0.5) {
        //如果在右边,返回YES;
        return YES;
    }else {
        //否则返回NO;
        return NO;
    }
}

//实现手势方法
- (void)tap {
    NSLog(@"%s",__func__);
}

@end
