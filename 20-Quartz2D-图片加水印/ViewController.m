//
//  ViewController.m
//  20-Quartz2D-图片加水印
//
//  Created by wangfh on 2019/7/15.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载图片
    UIImage *image = [UIImage imageNamed:@"timg.jpeg"];
    
    /*
     获取上下文,之前的上文文都是在view的drawRect方法中获取(跟view相关联的上下文layer上下文)
     目前我们需要绘制图片到新的图片上,因此需要用到位图上下文
     怎么获取位图上下文?
     注意位图上下文的获取方式跟layer上下文不一样,位图上下文需要我们手动创建
     开启一个位图上下文,注意位图上下文跟view无关联,所以不需要在drawRect
     size:位图上下文的尺寸(新图片的尺寸)
     opaque:不透明度 YES: 不透明 NO: 透明,通常我们一般逗弄透明的上下文
     scale: 通常不需要缩放上下文,取值为0,表示不缩放
     */
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //1.绘制原生的图片
    [image drawAtPoint:CGPointZero];
    
    //2.给原生的图片添加文字
    NSString *str = @"@wangfuhao";
    
    //创建字典属性
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blueColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    //3.绘制文字
    [str drawAtPoint:CGPointMake(image.size.width - 300, image.size.height - 100) withAttributes:dict];
    
    //4.生成一张图片给我们,从上下文获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.关闭上下文
    UIGraphicsEndImageContext();
    
    self.imageView.image = newImage;
}


@end
