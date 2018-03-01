//
//  SecondVC.m
//  test
//
//  Created by wangzhiwei on 2017/12/14.
//  Copyright © 2017年 wangzhiwei. All rights reserved.
//

#import "SecondVC.h"
#import "BBCell.h"
#define NAVIGATION_HEIGHT (CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) + CGRectGetHeight(self.navigationController.navigationBar.frame))

#define ADD self.navigationController.navigationBar.frame.size.height
@interface SecondVC ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) NSIndexPath* editingIndexPath;  //当前左滑cell的index，在代理方法中设置


@end

@implementation SecondVC
- (void)configSwipeButtons
{
    // 获取选项按钮的reference
    if ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)
    {
        // iOS 11层级 (Xcode 9编译): UITableView -> UISwipeActionPullView
        for (UIView *subview in self.tableView.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UISwipeActionPullView")] && [subview.subviews count] >= 2)
            {
                // 和iOS 10的按钮顺序相反
                UIButton *deleteButton = subview.subviews[1];
                UIButton *readButton = subview.subviews[0];
                
                [self configDeleteButton:deleteButton];
                [self configReadButton:readButton];
            }
        }
    }
    else
    {
        // iOS 8-10层级: UITableView -> UITableViewCell -> UITableViewCellDeleteConfirmationView
        BBCell *tableCell = [self.tableView cellForRowAtIndexPath:self.editingIndexPath];
        for (UIView *subview in tableCell.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")] && [subview.subviews count] >= 2)
            {
                UIButton *deleteButton = subview.subviews[0];
                UIButton *readButton = subview.subviews[1];
                
                [self configDeleteButton:deleteButton];
                [self configReadButton:readButton];
            }
        }
    }
    
//    [self configDeleteButton:deleteButton];
//    [self configReadButton:readButton];
    
}
- (void)configDeleteButton:(UIButton*)deleteButton
{
    if (deleteButton)
    {
        [deleteButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [deleteButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [deleteButton setImage:[UIImage imageNamed:@"icon-buy.png"] forState:UIControlStateNormal];
        // 调整按钮上图片和文字的相对位置（该方法的实现在下面）
        [self centerImageAndTextOnButton:deleteButton];
    }
}

- (void)configReadButton:(UIButton*)readButton
{
    if (readButton)
    {
        [readButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [readButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        // 根据当前状态选择不同图片
        [readButton setImage:[UIImage imageNamed:@"icon-col.png"] forState:UIControlStateNormal];
        
        // 调整按钮上图片和文字的相对位置（该方法的实现在下面）
        [self centerImageAndTextOnButton:readButton];
    }
}
- (void)centerImageAndTextOnButton:(UIButton*)button{
    // this is to center the image and text on button.
    // the space between the image and text
    CGFloat spacing = 35.0;
    
    // lower the text and push it left so it appears centered below the image
    CGSize imageSize = button.imageView.image.size;
    button.titleEdgeInsets = UIEdgeInsetsMake(- imageSize.width, 0, - (imageSize.height + spacing), 0.0);
    
    // raise the image and push it right so it appears centered above the text
    CGSize titleSize = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: button.titleLabel.font}];
    button.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
    
    // increase the content height to avoid clipping
    CGFloat edgeOffset = (titleSize.height - imageSize.height) / 2.0;
    button.contentEdgeInsets = UIEdgeInsetsMake(edgeOffset, 0.0, edgeOffset, 0.0);
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"没有什么";
    
    [self Action1];
    [self Action2];
    [self Action3];
    [self Action4];
//    [self Action10];
    // Do any additional setup after loading the view.
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    SecondVC *v = [[SecondVC alloc] init];
//    v.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:v animated:YES];
//
//}
- (void)Action1{
    CAShapeLayer *lay = [CAShapeLayer layer];
    lay.frame = CGRectMake(0, 100, 100, 100);
    lay.backgroundColor = [UIColor lightGrayColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50,50) radius:50 startAngle:-M_PI_2 endAngle:M_PI  clockwise:YES];
    [path closePath];
    lay.path = path.CGPath;
    lay.lineWidth = 3;
    lay.fillRule = kCAFillRuleEvenOdd;
    lay.fillColor =[UIColor clearColor].CGColor;
    lay.strokeColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:lay];
}
- (void)Action2{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(250,100) radius:50 startAngle:-M_PI_2 endAngle:M_PI  clockwise:YES];
    [path closePath];
    CAShapeLayer *lay = [CAShapeLayer layer];
    [lay setLineDashPattern:@[@10,@10]];
    lay.path = path.CGPath;
    lay.lineWidth = 3;
    lay.fillRule = kCAFillRuleEvenOdd;
    lay.fillColor =[UIColor clearColor].CGColor;
    lay.strokeColor = [UIColor greenColor].CGColor;
    lay.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:lay];
    
}
- (void)Action3{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    

//    CAShapeLayer *lay = [CAShapeLayer layer];
//    lay.frame = CGRectMake(30, 30, 50, 50);
//    lay.backgroundColor = [UIColor lightGrayColor].CGColor;
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0,0) radius:50 startAngle:-M_PI_2 endAngle:M_PI_2  clockwise:YES];
//    [path closePath];
//    lay.path = path.CGPath;
//    lay.lineWidth = 3;
//    lay.fillRule = kCAFillRuleEvenOdd;
//    lay.fillColor =[UIColor clearColor].CGColor;
//    lay.strokeColor = [UIColor greenColor].CGColor;
//
//    view.layer.mask = lay;
    
}
- (void)Action4{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 250)];
    [path addCurveToPoint:CGPointMake(300, 250) controlPoint1:CGPointMake(72, 200) controlPoint2:CGPointMake(228, 300)];
    [path addQuadCurveToPoint:CGPointMake(200, 250) controlPoint:CGPointMake(100, 300)];
    CAShapeLayer *lay = [CAShapeLayer layer];
    lay.path = path.CGPath;
    lay.lineCap= kCALineCapRound;
    lay.lineJoin = kCALineJoinRound;
    lay.fillColor = [UIColor clearColor].CGColor;
    lay.strokeColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:lay];
    [lay addAnimation:[self createAnimation:1] forKey:nil];

    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(10, 300)];
    [path1 addQuadCurveToPoint:CGPointMake(200, 300) controlPoint:CGPointMake(100, 350)];
    CAShapeLayer *lay1 = [CAShapeLayer layer];
    lay1.path = path1.CGPath;
    lay1.fillColor = [UIColor clearColor].CGColor;
    lay1.strokeColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:lay1];
    [lay1 addAnimation:[self createAnimation:2] forKey:nil];

    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(10, 350)];
    [path2 addQuadCurveToPoint:CGPointMake(200, 350) controlPoint:CGPointMake(100, 400)];
    CAShapeLayer *lay2 = [CAShapeLayer layer];
    lay2.path = path2.CGPath;
    lay2.fillColor = [UIColor clearColor].CGColor;
    lay2.strokeColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:lay2];
    [lay2 addAnimation:[self createAnimation:3] forKey:nil];
//     [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
//         [UIView animateWithDuration:3 animations:^{
//             self.view.backgroundColor = RAND_COLOR;
//         }];
//    }];
}
- (CAAnimation *)createAnimation:(NSInteger)tag{
    CABasicAnimation *ani;
    
    switch (tag) {
        case 1:
//            ani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//            ani.fromValue = @0;
//            ani.toValue = @1;
//            ani.removedOnCompletion = NO;
//            ani.fillMode = kCAFillModeForwards;
        {
            ani = [CABasicAnimation animationWithKeyPath:@"path"];
            UIBezierPath *path1 = [UIBezierPath bezierPath];
            [path1 moveToPoint:CGPointMake(10, 300)];
            [path1 addQuadCurveToPoint:CGPointMake(200, 300) controlPoint:CGPointMake(100, 350)];
            ani.toValue = (__bridge id)path1.CGPath;
            ani.removedOnCompletion = NO;
            ani.fillMode = kCAFillModeForwards;
        }
            break;
        case 2:
        {
            CAAnimationGroup *group = [CAAnimationGroup animation];
            CABasicAnimation *first = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            first.fromValue = @0.5;
            first.toValue = @1;
            CABasicAnimation *second = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
            second.fromValue = @0.5;
            second.toValue = @0;
            CABasicAnimation *thrid = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
            thrid.fromValue = @1;
            thrid.toValue = @5;
            
            group.animations = @[first ,second,thrid];
            group.repeatCount = NSIntegerMax;
            group.duration = 3;

            return group;
        }
            

            break;
        case 3:
            ani = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
            ani.fromValue = @1;
            ani.toValue = @15;
            break;

        default:
            break;
    }
    ani.duration = 3;
    ani.repeatCount = NSIntegerMax;

    return ani;
    
}
- (void)Action10{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight ) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[BBCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, NAVIGATION_HEIGHT, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, KHeight  - 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    self.editingIndexPath = indexPath;
    [self.view setNeedsLayout];   // 触发-(void)viewDidLayoutSubviews
}
- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.editingIndexPath = nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondVC *v = [[SecondVC alloc] init];
    v.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:v animated:YES];
}
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"加入购物车" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"-------1----------");
        tableView.editing = YES;

    }];

    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"加入购物车" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"-------2----------");
    }];
    
    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"加入购物车" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"-------3----------");
    }];
    
    return @[action1,action2,action3];
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
