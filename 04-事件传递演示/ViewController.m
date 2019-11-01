//
//  ViewController.m
//  04-事件传递演示
//
//  Created by wangfh on 2019/7/8.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
触摸事件的传递是从父控件传递到子控件
    点击了绿色的view：
    UIApplication -> UIWindow -> 白色 -> 绿色
    点击了蓝色的view：
    UIApplication -> UIWindow -> 白色 -> 橙色 -> 蓝色
    点击了黄色的view：
    UIApplication -> UIWindow -> 白色 -> 橙色 -> 蓝色 -> 黄色
 
如何找到最合适的控件来处理事件？
    1.自己是否能接收触摸事件？
    2.触摸点是否在自己身上？
    3.从后往前遍历子控件，重复前面的两个步骤
    4.如果没有符合条件的子控件，那么就自己最适合处理

简要说出点击黄色view,系统是如何找到最合适的控件来处理事件?
    UIApplication将触摸事件传递给了UIWindow, UIWindow -> 白色的view. 此时 whiteView 判断能接受触摸事件, 触摸点在自己身上,然后从后往前遍历子控件,先遍历到橙色的view,然后再去重复1,2步的检测,然后遍历到蓝色的view,蓝色view再重复1,2步的检测,会遍历到黄色的view,发现黄色的view都满足这些条件,并且没有子控件,所以黄色的view就是最佳的响应者
 
如果我点击蓝色和红色的重叠部分,谁会响应?
    因为遍历子视图的时候,是从后往前遍历,会先遍历到红色view,红色的view发现自己都满足条件,就直接响应时间了
 
如果一个控件隐藏,那么子控件也跟着隐藏
如果一个控件透明,那么子控件也跟着透明
 */
- (void)viewDidLoad {
    [super viewDidLoad];
}


@end
