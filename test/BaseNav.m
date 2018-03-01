//
//  BaseNav.m
//  test
//
//  Created by wangzhiwei on 2017/11/27.
//  Copyright © 2017年 wangzhiwei. All rights reserved.
//

#import "BaseNav.h"

@implementation BaseNav

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate  = self;
}
@end
