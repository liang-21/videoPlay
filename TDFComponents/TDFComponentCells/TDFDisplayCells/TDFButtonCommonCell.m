//
//  TDFButtonCommonCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/6/3.
//
//

#import "TDFButtonCommonCell.h"
#import "TDFButtonCommonItem.h"

@interface TDFButtonCommonCell()



@end

@implementation TDFButtonCommonCell

- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
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

- (UIButton *)button {
    if(!_button) {
        _button = [[UIButton alloc] init];
        _button.userInteractionEnabled = NO;
        _button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
        _button.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _button;
}

+ (CGFloat)heightForCellWithItem:(TDFButtonCommonItem *)item
{
    return item.shouldShow ? 44 : 0;
}

- (void)configCellWithItem:(TDFButtonCommonItem *)item
{
    
    self.contentView.hidden = !item.shouldShow;
    if (!item.shouldShow) return;

    [self.button setTitle:item.title forState:UIControlStateNormal];
    [self.button setTitleColor:item.titleColor forState:UIControlStateNormal];
    
    switch (item.buttonType) {
        case TDFButtonCommontTypeNone:
            break;
        case TDFButtonCommontTypeAdd:
            self.button.titleLabel.font = [UIFont systemFontOfSize:15.];
            [self.button setImage:[UIImage imageNamed:@"btn_add_circle_red" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
            break;
    }
}

@end
