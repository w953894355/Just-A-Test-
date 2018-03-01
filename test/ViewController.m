//
//  ViewController.m
//  test
//
//  Created by wangzhiwei on 2017/7/24.
//  Copyright © 2017年 wangzhiwei. All rights reserved.
//

#import "ViewController.h"
#import "LTSCircleView.h"
#import "LineView.h"
#import "BBVC.h"
#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height


typedef NSString *(^BLO)(NSString *);

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImagePickerController *pickerController;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) BLO  block;
@property (nonatomic, copy)  NSString* (^bbb) (NSString *) ;

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIImageView *image2;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) LineView *lineVew;
@property (nonatomic, assign) CGFloat Angle;
@end

@implementation ViewController
- (void)viewDidAppear:(BOOL)animated{
 
    [super viewDidAppear:animated];
//    self.tabBarController.tabBar.frame = CGRectMake(10, 100, 200, 100);
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    double  saleMoneyInt = 1898000.0990926000384;
    NSDecimalNumber *num = [[NSDecimalNumber alloc] initWithDouble:saleMoneyInt];
    NSDecimalNumberHandler *handel = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *result = [num decimalNumberByRoundingAccordingToBehavior:handel];
    
    NSLog(@"---^---\%@",[NSString stringWithFormat:@"%.2f",[result doubleValue]]);

    self.block = ^NSString *(NSString *a) {
      
        return  @"";
    };
    NSString *(^ccc)(NSString *) = ^(NSString *a){
        return  @"";
    };
    
    _bbb = ccc;
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 400, 200, 50);
    [btn setTitle:@"Push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(btnAction1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _image = [[UIImageView alloc] initWithFrame:CGRectMake(100, 450 ,100, 100)];
    _image.backgroundColor = [UIColor lightGrayColor];
    _image.image =[self imageWithRedraw];
    
    [self.view addSubview:_image];
    _image2 = [[UIImageView alloc] initWithFrame:CGRectMake(210, 550 ,100, 100)];
    _image2.backgroundColor = [UIColor orangeColor];
    _image2.image =[UIImage imageNamed:@"3.png"];
    [self.view addSubview:_image2];
    
    CAShapeLayer *lay = [CAShapeLayer layer];
    lay.frame = CGRectMake(0, 0, 100, 100);
    UIBezierPath *pa = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:29];
    lay.path = pa.CGPath;
    lay.fillColor = [UIColor blueColor].CGColor;
    lay.strokeColor = [UIColor greenColor].CGColor;
    _image2.layer.mask = lay;

    LineView *vv = [[LineView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:vv];
    vv.backgroundColor = [UIColor grayColor];
    _lineVew = vv;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    label.layer.cornerRadius = 5;
    label.layer.borderWidth = 1;
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.borderColor = [UIColor greenColor].CGColor;
    [self.view addSubview:label];
    label.text = @"aa";
    _label = label;
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(100, 350, 200, 60)];
    slider.backgroundColor =[UIColor grayColor];
    slider.tintColor = [UIColor orangeColor];
    slider.thumbTintColor = [UIColor blueColor];
    slider.minimumTrackTintColor = [UIColor greenColor];
    slider.maximumTrackTintColor = [UIColor cyanColor];
    [self.view addSubview:slider];
    slider.minimumValue = 0;
    slider.maximumValue  =1.f;
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    slider.continuous = YES;
    
}
- (UIImage *)imageWithRedraw{
    UIImage *image = [UIImage imageNamed:@"2.png"];
    UIImage *image1 = [UIImage imageNamed:@"menu_0@2x2_1.png"];
    UIGraphicsBeginImageContext(CGSizeMake(100, 100));
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    
    CGContextSaveGState(UIGraphicsGetCurrentContext());
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    
//    CGContextAddPath(context, path.CGPath);
    [[UIColor redColor] set];
    CGContextStrokePath(context);
    CGContextSetLineWidth(context, 2);
    [path addClip];
//    [image drawInRect:CGRectMake(20,20, 60,60)];
//    [image1 drawInRect:CGRectMake(0,0,100, 100)];
    [[UIImage imageNamed:@"23.png"] drawInRect:CGRectMake(0,0,100, 100)];
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
    [@"This is a test" drawInRect:CGRectMake(0, 0, 100, 20) withAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSUnderlineColorAttributeName:[UIColor blueColor],NSUnderlineStyleAttributeName:@(NSUnderlineStyleDouble)}];
    UIImage *new = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  new;
}
- (void)sliderAction:(UISlider *)sender{
    [_lineVew setupWithSliderValue:sender.value];
    _label.text = [NSString stringWithFormat:@"%f",sender.value];
    NSLog(@"%%f--%f",12123.45678);
    NSLog(@"%%.3f--%.3f",12123.45678);
    NSLog(@"%%4f--%4f",3.48);
    NSLog(@"%%4.3f--%4.3f",321.45);
    NSLog(@"%5d",1213);
    NSLog(@"");
}
- (void)btnAction{
        

    NSLog(@"----------------button-click--------------\n");
        @try {
            NSLog(@"-------------1--------------\n");
            [self tryTwo];
        } @catch (NSException *exception) {
            NSLog(@"-------------2--------------\n");
            NSLog(@"%s\n%@",__FUNCTION__,exception);
            @throw exception;
        } @finally {
            NSLog(@"-------------3--------------\n");
        }
    NSLog(@"---=-------4-------------\n");
//    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0);
//    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    CGImageRef ima = image.CGImage;
//    CGImageRef result = CGImageCreateWithImageInRect(ima,CGRectMake(0, 0, KWidth, 300));
//
//    UIImage *resultImage = [UIImage imageWithCGImage:result];
//    NSData  *data= UIImagePNGRepresentation(resultImage);
//    NSFileManager *manager = [NSFileManager defaultManager];
//
//    [data writeToFile:@"/Users/wangzhiwei/Desktop/123.png" atomically:YES];
//    _image.image = image;
//    _image2.image = resultImage;
//
}
- (void)tryTwo{
    @try {
        NSLog(@"-------------5--------------\n");
        NSDictionary *str=  @"123";
        [str objectForKey:@"aa"];
    } @catch (NSException *exception) {
        NSLog(@"-------------6--------------\n");
        @throw exception;
    } @finally {
        NSLog(@"-------------7--------------\n");
    }
    NSLog(@"-------------8--------------\n");

}
- (void)btnAction1{
    
    BBVC *vv = [[BBVC alloc] init];
    vv.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:vv animated:YES];
    
}
- (void)startAnimation{
    [UIView animateWithDuration:0.02 animations:^{
        _image.transform = CGAffineTransformRotate(_image.transform, _Angle *M_PI / 180.0 );
    } completion:^(BOOL finished) {
        [self startAnimation];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self openPhotoLibrary];
}

- (void)openPhotoLibrary
{
    BOOL isAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    
    if (!isAvailable) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"请开启" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    
    self.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:self.pickerController animated:YES completion:NULL];
}
- (UIImagePickerController *)pickerController
{
    if (!_pickerController) {
        _pickerController = [[UIImagePickerController alloc] init];
        _pickerController.delegate = self;
    }
    return _pickerController;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    
    NSLog(@"");
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"111");

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)aavb:(id)sender {
//    dispatch_semaphore_t sem = dispatch_semaphore_create(1);
    dispatch_queue_t queue = dispatch_queue_create("testBlock", NULL);
    dispatch_async(queue, ^{
        
            dispatch_semaphore_t sem = dispatch_semaphore_create(0);

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"1");
            dispatch_semaphore_signal(sem);
            
        });
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

    });
    dispatch_async(queue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);

        NSLog(@"2");
        dispatch_semaphore_signal(sem);
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

    });
    dispatch_async(queue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"3");
            dispatch_semaphore_signal(sem);
            
        });
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

    });
    dispatch_async(queue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);

        NSLog(@"4");
        dispatch_semaphore_signal(sem);
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

    });
    
}

- (IBAction)aaa:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);

    dispatch_group_async(group, queue, ^{
        NSLog(@"任务1开始");
//        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        int sleepInterval = arc4random() % 10;
        sleep(sleepInterval);
                    NSLog(@"任务1结束");

//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sleepInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"任务1结束");
//            dispatch_semaphore_signal(sem);
//        });
//        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"任务2开始");
//        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        int sleepInterval = arc4random() % 10;
        sleep(sleepInterval);
        NSLog(@"任务1结束");

//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sleepInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"任务2结束");
//            dispatch_semaphore_signal(sem);
//        });
//        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"任务3开始");
        
//        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        int sleepInterval = arc4random() % 10;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sleepInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"任务3结束");
            dispatch_semaphore_signal(sem);
        });
//        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    //在分组的所有任务完成后触发

    NSLog(@"-------------");
    dispatch_group_notify(group, queue, ^{
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

        NSLog(@"所有任务完成");
    });
    NSLog(@"continue,........");
}

@end
