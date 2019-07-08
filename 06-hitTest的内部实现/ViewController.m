//
//  ViewController.m
//  06-hitTest的内部实现
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@----touch",[self class]);
    [super touchesBegan:touches withEvent:event];
}


@end
