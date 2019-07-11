//
//  ViewController.m
//  13-Quartz2D-下载进度案例
//
//  Created by wangfh on 2019/7/11.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@property (weak, nonatomic) IBOutlet DrawView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)sliderScroll:(UISlider *)sender {
    self.valueLabel.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    self.progressView.progressValue = sender.value;
}

@end
