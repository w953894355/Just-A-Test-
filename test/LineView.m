//
//  LineView.m
//  test
//
//  Created by wangzhiwei on 2017/10/23.
//  Copyright © 2017年 wangzhiwei. All rights reserved.
//

#import "LineView.h"
#define UIColorFromRGB(rgbValue)            [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kMAINGREEN  UIColorFromRGB(0x3CDC46)

@implementation LineView

CGFloat x;
CGFloat y;

- (UIBezierPath *)movePath{
    if (!_movePath) {
        _movePath = [UIBezierPath bezierPath];
    }
    return _movePath;
}

-(UIBezierPath *)originPath
{
    if (_originPath == nil)
    {
        CGFloat width = self.frame.size.width;
        _originPath = [UIBezierPath bezierPath];
        [_originPath moveToPoint:CGPointMake(0,0)];
        [_originPath addLineToPoint:CGPointMake(width, 0)];
        [_originPath addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:CGPointMake(width /2.0 + x<width/2.0?(-x/2.0):(x), 0)];
    }
    return _originPath;
}  // Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [touches.anyObject locationInView:self];
    
    x = point.x;
    y = point.y;
    [self setNeedsDisplayView];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    y = 0;
    [self animation];
}
-(void)animation
{
    return ;
    CABasicAnimation *morph = [CABasicAnimation animationWithKeyPath:@"path"];
    morph.duration = 0.5;
    morph.fromValue = (__bridge id _Nullable)(self.movePath.CGPath);
    morph.toValue = (__bridge id _Nullable)(self.originPath.CGPath);
    //移动后位置保持结束后的状态
    morph.fillMode=kCAFillModeForwards;
    morph.removedOnCompletion = NO;

    [self.shapeLayer addAnimation:morph forKey:nil];
}

//刷新path
- (void)setNeedsDisplayView{
    if (!self.shapeLayer) {
        self.shapeLayer = [CAShapeLayer layer];
        self.shapeLayer.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.5].CGColor;
        self.shapeLayer.lineWidth  =1.0f;
        self.shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
        self.shapeLayer.path = [self createPath].CGPath;
        [self.layer addSublayer:self.shapeLayer];
    }else{
            self.shapeLayer.path = [self createPath].CGPath;
    }
//    [self.shapeLayer removeFromSuperlayer];
//    self.shapeLayer = [CAShapeLayer layer];
//    self.shapeLayer.frame = self.bounds;
//    self.shapeLayer.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.5].CGColor;
//    self.shapeLayer.lineWidth  =1.0f;
//    self.shapeLayer.strokeColor = [UIColor clearColor].CGColor;
//    self.shapeLayer.path = [self createPath].CGPath;
//    [self.layer addSublayer:self.shapeLayer];
}
- (UIBezierPath *)createPath{
    CGFloat width = self.frame.size.width;

    [self.movePath removeAllPoints];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle: - M_PI_2 endAngle:0.5 * 2.0 * M_PI clockwise:YES];
    self.movePath = path;
//    [self.movePath moveToPoint:CGPointMake(0, 0 )];
//    [self.movePath addLineToPoint:CGPointMake(width, 0)];
//    [self.movePath addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:CGPointMake(x, y)];

//    [self.movePath addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:CGPointMake(width /2.0 + x<width/2.0?(-x/2.0):(x), y)];
    return self.movePath;
}
- (void)setupWithSliderValue:(CGFloat)value{
    if (!self.shapeLayer) {
        CAShapeLayer *shape = [CAShapeLayer layer];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle: - M_PI_2 endAngle:value * 2.0 * M_PI clockwise:YES];
        shape.path = path.CGPath;
        shape.lineWidth = 3;
        
        shape.fillColor = [UIColor blueColor].CGColor;
        shape.strokeColor = [UIColor greenColor].CGColor;
//        shape.strokeStart = 0;

//        self.layer.mask = shape;
//        shape.strokeEnd = 0.9;
        [self.layer addSublayer:shape];
        _shapeLayer = shape;
        [self addAnimation];
    }else{
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:- M_PI_2 endAngle:(value * 2.0- 0.5) * M_PI clockwise:YES];

        _shapeLayer.path = path.CGPath;
        [self addAnimation];

    }
}
- (void)addAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 2;
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.repeatDuration = NSIntegerMax;
    [_shapeLayer addAnimation:animation forKey:nil];
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.创建文字

//    NSString * str = @"纸巾艺术";
//    //会知道上下文
//    [str drawInRect:rect withAttributes:nil];
////    CGContextStrokePath(contextRef);
//    
//    //这里顺便咯嗦一句：使用imageNamed加载图片是会有缓存的
//    //我们这里只需要加载一次就够了，不需要多次加载，所以不应该保存这个缓存
//    //    UIImage * image = [UIImage imageNamed:@"222"]; //所以可以换一种方式去加载
////
////
////    //    //绘制的大小位置    CGContextFillPath(contextRef);
////
//    UIImage *imgae1 = [UIImage imageNamed:@"2.png"];
//    UIImage *image2 = [UIImage imageNamed:@"3.png"];
////    UIGraphicsBeginImageContext(rect.size);
//    [imgae1 drawInRect:CGRectMake(0, 0, 200, 100)];
//    [image2 drawInRect:CGRectMake(0, 100, 200, 100)];
////    UIGraphicsEndImageContext();
//    CGContextFillPath(UIGraphicsGetCurrentContext());
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    // 首先设置一个起始点
//    CGPoint startPoint = CGPointMake(rect.size.width/2, 120);
//    // 以起始点为路径的起点
//    [path moveToPoint:startPoint];
//    // 设置一个终点
//    CGPoint endPoint = CGPointMake(rect.size.width/2, rect.size.height-40);
//    // 设置第一个控制点
//    CGPoint controlPoint1 = CGPointMake(100, 20);
//    // 设置第二个控制点
//    CGPoint controlPoint2 = CGPointMake(0, 180);
//    // 添加三次贝塞尔曲线
//    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
//    // 设置另一个起始点
//    [path moveToPoint:endPoint];
//    // 设置第三个控制点
//    CGPoint controlPoint3 = CGPointMake(rect.size.width-100, 20);
//    // 设置第四个控制点
//    CGPoint controlPoint4 = CGPointMake(rect.size.width, 180);
//    // 添加三次贝塞尔曲线
//    [path addCurveToPoint:startPoint controlPoint1:controlPoint4 controlPoint2:controlPoint3];
//    // 设置线宽
//    path.lineWidth = 3;
//    // 设置线断面类型
//    path.lineCapStyle = kCGLineCapRound;
//    // 设置连接类型
//    path.lineJoinStyle = kCGLineJoinRound;
//    // 设置画笔颜色
    
    
}


@end
