//
//  TDFMultiDisplayHeaderCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/2/17.
//
//

#import "TDFMultiDisplayHeaderCell.h"
#import "TDFMultiDisplayHeaderView.h"
#import "Masonry.h"

@interface TDFMultiDisplayHeaderCell()

@property (nonatomic,strong) TDFMultiDisplayHeaderView *displayHeaderView;

@end

@implementation TDFMultiDisplayHeaderCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.displayHeaderView];
    [self.displayHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor blackColor];
    lineView.alpha = 0.1;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.mas_equalTo(1);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (TDFMultiDisplayHeaderView *)displayHeaderView {
    if(!_displayHeaderView) {
        _displayHeaderView = [[TDFMultiDisplayHeaderView alloc] init];
    }
    return _displayHeaderView;
}

- (void)configCellWithItem:(DHTTableViewItem *)item {
    [self.displayHeaderView configureViewWithModel:item];
}

+ (CGFloat)heightForCellWithItem:(TDFMultiDisplayHeaderItem *)item
{
    return 45;
}

@end
