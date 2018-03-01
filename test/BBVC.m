//
//  BBVC.m
//  test
//
//  Created by wangzhiwei on 2017/11/22.
//  Copyright © 2017年 wangzhiwei. All rights reserved.
//

#import "BBVC.h"

@interface BBVC ()<UIGestureRecognizerDelegate>

@end

@implementation BBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 300)];
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.contentInset = UIEdgeInsetsMake(60, 00, 0, 0);
    scrollView.contentSize = CGSizeMake(KWidth, 1000);
    [self.view addSubview:scrollView];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 940)];
    view.backgroundColor= [UIColor redColor];
    [scrollView addSubview:view];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0,-60, 100, 40)];
    view1.backgroundColor= [UIColor blueColor];
    [scrollView addSubview:view1];
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftBarBtn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];;
    //创建UIBarButtonSystemItemFixedSpace
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //将宽度设为负值
    spaceItem.width = -45;
    //将两个BarButtonItem都返回给NavigationItem
    self.navigationItem.leftBarButtonItems = @[spaceItem,leftBarBtn];
    
    // 获取系统自带滑动手势的target对象
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return  YES;
}
- (void)backItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
