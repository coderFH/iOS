//
//  DragerViewController.h
//  11-抽屉效果
//
//  Created by wangfh on 2019/7/9.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DragerViewController : UIViewController

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *mainView;

- (void)open;
- (void)close;

@end

NS_ASSUME_NONNULL_END
