//
//  ViewController.m
//  02-hitText
//
//  Created by wangfh on 2019/7/5.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"
#import "YellowView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YellowView *test = [[YellowView alloc] init];
    test.frame = CGRectMake(10, 100, 50, 50);
    test.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:test];
}


@end
