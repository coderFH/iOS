//
//  ViewController.m
//  03-transform
//
//  Created by wangfh on 2019/7/5.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:1 animations:^{
        //平移
        self.testView.transform = CGAffineTransformMakeTranslation(50, 50);
    }];
    
   
}


@end
