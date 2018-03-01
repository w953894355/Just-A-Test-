//
//  LineView.h
//  test
//
//  Created by wangzhiwei on 2017/10/23.
//  Copyright © 2017年 wangzhiwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineView : UIView

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong) UIBezierPath *movePath, *originPath;

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, assign) CFTimeInterval beginTime;


-(void)setupWithSliderValue:(CGFloat )value;
@end
