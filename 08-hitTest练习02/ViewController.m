//
//  ViewController.m
//  08-hitTest练习02
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"
#import "RedButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)redBtnClick:(RedButton *)sender {
    //添加按钮
    UIButton *blueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [blueBtn setImage:[UIImage imageNamed:@"对话框"] forState:UIControlStateNormal];
    [blueBtn setImage:[UIImage imageNamed:@"小孩"] forState:UIControlStateHighlighted];
    blueBtn.frame = CGRectMake(100, -100, 200, 100);
    sender.blueBtn = blueBtn;
    [sender addSubview:blueBtn];
}

@end
