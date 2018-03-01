//
//  BBCell.m
//  test
//
//  Created by wangzhiwei on 2017/12/22.
//  Copyright © 2017年 wangzhiwei. All rights reserved.
//

#import "BBCell.h"
#import "Masonry.h"

@interface BBCell  ()

@property (nonatomic, strong )UIButton *btn;

@end




@implementation BBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)willTransitionToState:(UITableViewCellStateMask)state
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setupSlideBtn];
    });
}
- (void)setupSlideBtn
{
    // 判断系统是否是iOS11及以上版本
    if ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f) {
        for (UIView *subView in self.superview.subviews) {
            if (![NSStringFromClass([subView class]) isEqualToString:@"UISwipeActionPullView"]) {
                continue;
            }
            
            for (UIView *buttonViews in subView.subviews) {
                if (![NSStringFromClass([buttonViews class]) isEqualToString:@"UISwipeActionStandardButton"]) {
                    continue;
                }
                
                // 修改备注
                UIView *remarkContentView = subView.subviews[0];
                [self setupRowActionView:remarkContentView imageName:@"menu_0@2x4_1"];
                
                // 删除
                UIView *deleteContentView = subView.subviews[1];
                [self setupRowActionView:deleteContentView imageName:@"2"];
            }
        }
        
    } else {
        // iOS11以下做法
        for (UIView *subView in self.subviews) {
            if(![subView isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")]) {
                continue;
            }
            
            // 删除
            UIView *deleteContentView = subView.subviews[0];
            [self setupRowActionView:deleteContentView imageName:@"left_slide_delete_button2"];
            
            // 修改备注
            UIView *remarkContentView = subView.subviews[1];
            [self setupRowActionView:remarkContentView imageName:@"3"];
        }
    }
}
- (void)setupRowActionView:(UIView *)rowActionView imageName:(NSString *)imageName
{
    rowActionView.backgroundColor = [UIColor grayColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [rowActionView insertSubview:imageView atIndex:0];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(rowActionView);
        make.width.equalTo(@80);

    }];
}

//- (void)layoutSubviews{
//    [super layoutSubviews];
//    [self configCell];
//}
- (void)configCell{
    NSArray *TsubView;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f) {
        for (UIView *subview in self.superview.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UITableViewWrapperView")])
            {//Xocde8
                for (UIView *subsubview in subview.subviews)
                {
                    if ([subsubview isKindOfClass:NSClassFromString(@"UISwipeActionPullView")])
                    {
                        TsubView = subsubview.subviews;
                    }
                }
            }else if([subview isKindOfClass:NSClassFromString(@"UISwipeActionPullView")]){//Xcode9
                TsubView = subview.subviews;
            }
        }
    }else{
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")]) {
                TsubView = subView.subviews;
            }
        }
    }
    if (TsubView.count == 3) {
        UIButton *btn = TsubView[0];
        UIButton *btn1 = TsubView[1];
        [self configCollecBtn:btn];
        [self configBuyBtn:btn1];
    }else if (TsubView.count == 1){
        UIButton *btn = TsubView[0];
        [self configCollecBtn:btn];
    }
    
}
//收藏夹按钮
- (void)configCollecBtn:(UIButton *)button{
    [button setBackgroundImage: [UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
    return;
    [button setTitle: @"加入\n收藏夹" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon-col.png"] forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    CGSize size = button.imageView.frame.size;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, size.width/2, 0, size.width/2);
    
//    CGRect frame = button.titleLabel.frame;
//    UIImageView *imagView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 33, 33)];
//    imagView1.image  =[UIImage imageNamed:@"2.png"];
//    [button addSubview:imagView1];
//    CGSize SZ = button.frame.size;
    
//    CGSize textSZ = [@"加入\n收藏夹" boundingRectWithSize:SZ options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
//    UIImageView *imagView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 33, 33)];
//    imagView.image  =[UIImage imageNamed:@"icon3.png"];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SZ.width, textSZ.height)];
//    label.text = @"加入\n收藏夹";
//    label.font  = [UIFont systemFontOfSize:12];
//    label.textColor = [UIColor blackColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    imagView.center = CGPointMake(SZ.width/2, (SZ.height - textSZ.height)/2);
//    label.center  = CGPointMake(SZ.width/2,(SZ.height +imagView.bounds.size.height)/2);
//    imagView.userInteractionEnabled = label.userInteractionEnabled = NO;
//    [button addSubview:imagView];
//    [button addSubview:label];
    
    
}
//购物车按钮
- (void)configBuyBtn:(UIButton *)button{
    [button setBackgroundImage:[UIImage imageNamed:@"23.png"] forState:UIControlStateNormal];
    return;
    [button setTitle: @"加入\n购物车" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon-buy.png"] forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    return ;

    CGSize SZ;
    CGSize textSZ = [@"加入\n购物车" boundingRectWithSize:SZ options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    UIImageView *imagView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 33, 33)];
    imagView.image  =[UIImage imageNamed:@"3.png"];
    [button addSubview:imagView];
    imagView.center = CGPointMake(SZ.width/2/3, (SZ.height - textSZ.height)/2);

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SZ.width, textSZ.height)];
    label.text = @"加入\n购物车";
    label.font  = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    imagView.userInteractionEnabled = label.userInteractionEnabled = NO;
    [button addSubview:label];
    label.center  = CGPointMake(SZ.width/2,(SZ.height +imagView.bounds.size.height)/2);

    
}



@end
