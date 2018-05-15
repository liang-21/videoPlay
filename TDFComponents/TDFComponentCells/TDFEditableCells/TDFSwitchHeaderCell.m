//
//  TDFSwitchHeaderCell.m
//  Pods
//
//  Created by doubanjiang on 2018/3/2.
//

#import "TDFSwitchHeaderCell.h"
#import "TDFSwitchHeaderItem.h"
#import <TDFStyleKit/UIColor+tdf_standard.h>
#import <Masonry/Masonry.h>
#import <ReactiveObjC/UIButton+RACCommandSupport.h>
#import <ReactiveObjC/RACCommand.h>
#import <ReactiveObjC/RACSignal.h>
#import <TDFBatchOperation/NSArray+SwiftOperation.h>

@interface TDFSwitchHeaderCell ()

@property (nonatomic, strong) TDFSwitchHeaderItem *item;

@property (nonatomic, strong) NSMutableArray<UIButton *> *buttonArray;

@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *shortLineView;

@end

@implementation TDFSwitchHeaderCell

- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.topLineView];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.shortLineView];
    
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.mas_equalTo(1);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.equalTo(self.topLineView.mas_height);
    }];
    [self.shortLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-1);
        make.height.mas_equalTo(2);
//        make.width.equalTo(self.leftBtn.mas_width).multipliedBy(0.7);
//        make.centerX.equalTo(self.leftBtn.mas_centerX);
    }];

}

- (void)configCellWithItem:(TDFSwitchHeaderItem *)item {
    
    self.item = item;
    if (!item.names.count) return;
    
    if (self.buttonArray.count) {//布局过
        [self didSelectBtn:self.buttonArray[item.switchIndex] withOutAction:true];
    }else {//未布局
        
        CGFloat buttonWidth = [UIScreen mainScreen].bounds.size.width/item.names.count;
        __block UIButton *lastBtn = nil;
        [item.names tdf_forEach:^(NSString *value) {
            UIButton *button = [self buttonWithName:value];
            [button setTitle:value forState:UIControlStateNormal];
            if (item.font){
                [button.titleLabel setFont:item.font];
            }
            [self.contentView addSubview:button];
            [self.buttonArray addObject:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.offset(0);
                make.width.mas_equalTo(buttonWidth);
                if (lastBtn) {
                    make.left.equalTo(lastBtn.mas_right);
                }else {
                    make.left.offset(0);
                }
            }];
            lastBtn = button;
        }];
        [self didSelectBtn:self.buttonArray[item.switchIndex] withOutAction:true];
    }
}

- (void)didSelectBtn:(UIButton *)btn withOutAction:(BOOL )withOutAction{
    CGFloat lineWidth = [UIScreen mainScreen].bounds.size.width/self.buttonArray.count*0.7;
    [self.buttonArray tdf_forEach:^(UIButton *value) {
        value.selected = [value isEqual:btn];
        if (value.selected) {
                [self.shortLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.offset(-1);
                    make.height.mas_equalTo(2);
                    make.width.mas_equalTo(lineWidth);
                    make.centerX.equalTo(btn.mas_centerX);
                }];
        }
    }];
    NSInteger idx = [self.buttonArray indexOfObject:btn];
    self.item.switchIndex = idx;
    if (!withOutAction) {
        !self.item.didSwitch?:self.item.didSwitch(idx);
    }
}

+ (CGFloat)heightForCellWithItem:(TDFSwitchHeaderItem *)item {
    
    return 42;
}

- (UIButton *)buttonWithName:(NSString *)name {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor tdf_hex_333333] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor tdf_hex_0088FF] forState:UIControlStateSelected];
    button.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        [self didSelectBtn:button withOutAction:false];
        return [RACSignal empty];
    }];
    return button;
}

#pragma mark - Getter
- (NSMutableArray *)buttonArray {
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray new];
    }
    return _buttonArray;
}

- (UIView *)topLineView {
    if (!_topLineView) {
        _topLineView = [UIView new];
        [_topLineView setBackgroundColor:[UIColor tdf_hex_CCCCCC]];
    }
    return _topLineView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        [_lineView setBackgroundColor:[UIColor tdf_hex_CCCCCC]];
    }
    return _lineView;
}

- (UIView *)shortLineView {
    if (!_shortLineView) {
        _shortLineView = [UIView new];
        [_shortLineView setBackgroundColor:[UIColor tdf_hex_0088FF]];
    }
    return _shortLineView;
}

@end
