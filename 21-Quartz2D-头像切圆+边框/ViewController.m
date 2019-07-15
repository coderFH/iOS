//
//  ViewController.m
//  21-Quartz2D-头像切圆+边框
//
//  Created by wangfh on 2019/7/15.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extension.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithClip:[UIImage imageNamed:@"ali"] borderWidth:10 borderColor:[UIColor blueColor]];
}

@end
