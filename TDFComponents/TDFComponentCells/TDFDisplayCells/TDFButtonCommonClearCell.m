//
//  TDFButtonCommonClearCell.m
//  Pods
//
//  Created by 刘红琳 on 2017/6/5.
//
//

#import "TDFButtonCommonClearCell.h"

@implementation TDFButtonCommonClearCell
- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor =[UIColor clearColor];
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top).with.offset(1);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.contentView addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UIView *spliteView = [[UIView alloc] init];
    spliteView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    [self.contentView addSubview:spliteView];
    
    [spliteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(10);
        make.trailing.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@(1));
    }];
}

@end
