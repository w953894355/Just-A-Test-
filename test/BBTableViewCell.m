//
//  BBTableViewCell.m
//  test
//
//  Created by wangzhiwei on 2017/10/18.
//  Copyright © 2017年 wangzhiwei. All rights reserved.
//

#import "BBTableViewCell.h"


@interface BBTableViewCell ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITableView *tableView1;
@property (nonatomic, strong) UITableView *tableView2;
@end




@implementation BBTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _scrollView.contentSize = CGSizeMake(500, 300);
    _scrollView.bounces = NO;
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 500, 300) style:UITableViewStylePlain];
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    [_scrollView addSubview:_tableView2];
    
//    UITableView *tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 500, self.bounds.size.height) style:UITableViewStylePlain];
//    tableView2.delegate = self;
//    tableView2.dataSource = self;
//    [_scrollView addSubview:tableView2];

    // Initialization code
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }

    if (tableView == _tableView1) {
        cell.textLabel.text  =[NSString stringWithFormat:@"左边%ld",indexPath.row];
        cell.backgroundColor = [UIColor grayColor];
        return  cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        cell.textLabel.text  =[NSString stringWithFormat:@"右边%ld",indexPath.row];
        cell.backgroundColor = [UIColor blueColor];
        return  cell;

    }
    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
     _tableView2.contentOffset  = scrollView.contentOffset;
    _tableView1.contentOffset = scrollView.contentOffset;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
