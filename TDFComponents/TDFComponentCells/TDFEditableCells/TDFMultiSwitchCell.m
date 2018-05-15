//
//  TDFMultiSwitchCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/5/22.
//
//

#import "TDFMultiSwitchCell.h"
#import "TDFEditSwitchView.h"
#import "TDFSwitchItem.h"
#import "TDFMultiSwitchItem.h"
#import "TDFTableViewCell.h"
#import "Masonry.h"
#import "TDFEditColorHelper.h"

@interface TDFMultiSwitchCell ()

@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UILabel *lblSubtitle;

@property (nonatomic, strong) UIView *switchContentView;

@end

@implementation TDFMultiSwitchCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor =[UIColor whiteColor];
    view.alpha =0.6;
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top).with.offset(1);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];
    
    [self addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(14);
        make.height.equalTo(@(15));
        make.width.lessThanOrEqualTo(@(300));
    }];
    
    [self addSubview:self.lblSubtitle];
    [self.lblSubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.centerY.equalTo(self.lblTitle.mas_centerY);
        make.left.equalTo(self.lblTitle.mas_right);
    }];
    
    UIView *spliteView = [[UIView alloc] initWithFrame:CGRectZero];
    spliteView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    [self addSubview:spliteView];
    [spliteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.height.mas_equalTo(1);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.top.equalTo(self.mas_top).with.offset(47);
    }];
    
    [self addSubview:self.switchContentView];
    [self.switchContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.left.equalTo(self.mas_left);
        make.top.equalTo(spliteView.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFMultiSwitchItem *)item
{
    __block CGFloat height = 48;

    [item.switchItems enumerateObjectsUsingBlock:^(TDFSwitchItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        height += [TDFEditSwitchView getHeightWithModel:obj];
    }];
    
    return height;
}

- (void)configCellWithItem:(TDFMultiSwitchItem *)item
{
    self.lblTitle.text = item.title;
    self.lblSubtitle.text = item.subtitle;
    if(item.subtitleColor) {
        self.lblSubtitle.textColor = item.subtitleColor;
    }
    
    [self.switchContentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [item.switchItems enumerateObjectsUsingBlock:^(TDFSwitchItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat height = [TDFEditSwitchView getHeightWithModel:obj];
        TDFEditSwitchView *preSubview;
        if(idx > 0) {
            preSubview = self.switchContentView.subviews[idx-1];
        }
        TDFEditSwitchView *switchView = [[TDFEditSwitchView alloc] initWithFrame:CGRectZero];
        [self.switchContentView addSubview:switchView];
        [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.switchContentView.mas_right);
            make.left.equalTo(self.switchContentView.mas_left);
            if(preSubview) {
               make.top.equalTo(preSubview.mas_bottom);
            }else {
                make.top.equalTo(self.switchContentView.mas_top);
            }
            
            make.height.mas_equalTo(height);
        }];
        
        [switchView configureViewWithModel:obj];
    }];
}

- (UILabel *)lblTitle
{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblTitle.font = [UIFont systemFontOfSize:15];
        _lblTitle.textColor = [TDFEditColorHelper hex333333Color];
        _lblTitle.backgroundColor = [UIColor clearColor];
    }
    
    return _lblTitle;
}

- (UILabel *)lblSubtitle
{
    if (!_lblSubtitle) {
        _lblSubtitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblSubtitle.font = [UIFont systemFontOfSize:13];
        _lblSubtitle.textColor = [TDFEditColorHelper hex333333Color];
        _lblSubtitle.backgroundColor = [UIColor clearColor];
        _lblSubtitle.textAlignment = NSTextAlignmentRight;
    }
    
    return _lblSubtitle;
}

- (UIView *)switchContentView {
    if(!_switchContentView) {
        _switchContentView = [[UIView alloc] init];
    }
    return _switchContentView;
}

@end
