//
//  ViewController.m
//  22-Quartz2D-屏幕截图
//
//  Created by wangfh on 2019/7/15.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ScreenCapture.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //点击屏幕截图
    
    UIImage *image = [UIImage imageWithCaputure:self.view];
    self.imageView.image = image;
    
    //image转data
    //compressionQuality： 图片质量 1:最高质量
    NSData *data = UIImageJPEGRepresentation(image, 1);
    
    [data writeToFile:@"/Users/wangfh/Desktop/view.png" atomically:YES];
}

@end
