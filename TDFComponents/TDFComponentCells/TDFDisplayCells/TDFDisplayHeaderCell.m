//
//  TDFDisplayHeaderCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/2/17.
//
//

#import "TDFDisplayHeaderCell.h"
#import "TDFDisplayHeaderView.h"
#import "Masonry.h"

@interface TDFDisplayHeaderCell()

@property (nonatomic,strong) TDFDisplayHeaderView *displayHeaderView;

@end

@implementation TDFDisplayHeaderCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.displayHeaderView];
    [self.displayHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.mas_equalTo(22);
    }];
}

- (TDFDisplayHeaderView *)displayHeaderView {
    if(!_displayHeaderView) {
        _displayHeaderView = [[TDFDisplayHeaderView alloc] init];
    }
    return _displayHeaderView;
}

- (void)configCellWithItem:(TDFDisplayHeaderItem *)item {
    [self.displayHeaderView configureViewWithModel:item];
}

+ (CGFloat)heightForCellWithItem:(TDFDisplayHeaderItem *)item
{
    return 32;
}


@end
