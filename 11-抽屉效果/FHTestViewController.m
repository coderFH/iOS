//
//  FHTestViewController.m
//  11-抽屉效果
//
//  Created by wangfh on 2019/7/9.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "FHTestViewController.h"

@interface FHTestViewController ()

@end

@implementation FHTestViewController

/*
 如果外边想添加自己的view到我封装的这个视图上,只需要自定义一个控制器,并且继承DragerViewController
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    //如果想要在原始封装通用当中添加一些属性自己的业务逻辑,继承原来的类.自己的业务逻辑写到子类当中.
    UITableViewController *tableVC = [[UITableViewController alloc] init];
    tableVC.view.frame = self.mainView.bounds;
    //如果说一个控制器的View成为另一个控制器View的子控件.
    //那么当前控制器也要成为另一个控制器的子控制器.
    [self.mainView addSubview:tableVC.view];
    [self addChildViewController:tableVC];
    [self open];
}

@end
