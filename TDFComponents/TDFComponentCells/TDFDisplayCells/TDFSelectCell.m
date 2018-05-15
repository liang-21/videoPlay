//
//  TDFSelectCell.m
//  RestApp
//
//  Created by chaiweiwei on 2016/11/4.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFSelectCell.h"
#import "TDFSelectItem.h"
#import "TDFSelectView.h"
#import "Masonry.h"

@interface TDFSelectCell()

@property (nonatomic, strong) TDFSelectView *selectView;

@end
@implementation TDFSelectCell

- (void)cellDidLoad
{
    UIView *view =[[UIView alloc] init];
    view.backgroundColor =[UIColor whiteColor];
    view.alpha =0.6;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.selectView];
    [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFSelectItem *)item
{
    CGFloat height = [TDFSelectView getHeightWithModel:item];
    
    return ceil(height);
}

- (void)configCellWithItem:(TDFSelectItem *)item
{
    [self.selectView configureViewWithModel:item];
}

- (TDFSelectView *)selectView {
    if(!_selectView) {
        _selectView = [[TDFSelectView alloc] init];
    }
    return _selectView;
}

@end
