//
//  ViewController.m
//  01-UIView常见的触摸方法
//
//  Created by wangfh on 2019/7/5.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    TestView *test = [[TestView alloc] init];
    test.frame = CGRectMake(10, 100, 50, 50);
    test.backgroundColor = [UIColor redColor];
    [self.view addSubview:test];
}

@end
