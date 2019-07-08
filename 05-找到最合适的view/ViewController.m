//
//  ViewController.m
//  05-找到最合适的view
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 时间传递到时间的响应形成了一个封闭的圆环
 
 /上一个响应者是谁?
 //1.判断当前View是否为控制器的view,如果是,那么它上一个响应者就是它所在的控制器
 //2.如果不是,上一个响应者就是它的父控件.
 //3.如果当前响应者是控制器.会判断当前是不是窗口的根控制器,如果是,那么上一个响应者是窗口
 //4.如果不是,它上一个响应者,就是它的父控制器.
 //5.如果当前响应者是窗口,上一个响应者, 就是UIApplicaiton.
 //6.如果把事件传递UiApplication时,UIApplicaiton会把此事件给丢弃.
 */

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@----touch",[self class]);
    [super touchesBegan:touches withEvent:event];
}

@end
