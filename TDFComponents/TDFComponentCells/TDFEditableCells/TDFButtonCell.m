//
//  TDFButtonCell.m
//  TDFComponents
//
//  Created by guozhi on 2017/10/24.
//

#import "TDFButtonCell.h"
#import "DHTTableViewCellProtocol.h"
#import "Masonry.h"
#import "TDFButtonItem.h"
#import "TDFButtonView.h"
#import "TDFEditIntervalView.h"

@interface TDFButtonCell ()<DHTTableViewCellDelegate>
/** <#注释#> */
@property (nonatomic, strong) TDFButtonView *view;
/** <#注释#> */
@property (nonatomic, strong) TDFButtonItem *item;
@end

@implementation TDFButtonCell

- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.view];
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
}

- (void)configCellWithItem:(TDFButtonItem *)item {
    self.item = item;
    self.hidden = !item.shouldShow;
    if (item.shouldShow) {
        [self.view configureViewWithModel:item];
    }
}

+ (CGFloat)heightForCellWithItem:(TDFButtonItem *)item {
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFEditIntervalView getHeightWithModel:item];
    }
    
    return height;
}

- (TDFButtonView *)view {
    if (!_view) {
        _view = [[TDFButtonView alloc] init];
    }
    return _view;
}

@end
