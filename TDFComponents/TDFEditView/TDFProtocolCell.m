//
//  TDFProtocolCell.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/14.
//
//

#import "TDFProtocolCell.h"
#import "TDFProtocolItem.h"
#import <Masonry/Masonry.h>
#import <TDFOldBaseUtil/UIColor+Hex.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface TDFProtocolCell()

@property (strong,nonatomic) UIButton *selectedIcon;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) TDFProtocolItem *protocolItem;

@end

@implementation TDFProtocolCell

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.selectedIcon];
    [self.selectedIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.width.and.height.mas_equalTo(40);
        make.top.equalTo(self.contentView.mas_top);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(35);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.centerY.equalTo(self.selectedIcon.mas_centerY);
    }];
    
}

+ (CGFloat)heightForCellWithItem:(TDFProtocolItem *)item
{
    if(!item.shouldShow) return 0;
    if (item.lineStyle == TDFSingleLine) {
        return 60;
    }
    if(item.protocolButtons.count <=0) {
        return 44;
    }else {
        return 30 + item.protocolButtons.count * 25;
    }
}

- (void)configCellWithItem:(TDFProtocolItem *)item
{
    self.contentView.hidden = !item.shouldShow;
    if(!item.shouldShow) return;
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:item.alpha];
    self.protocolItem = item;
    self.selectedIcon.selected = item.isSeleted;
    
    if (item.lineStyle == TDFSingleLine) {
        [self.titleLabel setAttributedText:item.attributedText];
        self.titleLabel.numberOfLines = 0;
        @weakify(item);
        item.selectedBlock = ^{
            @strongify(item);
             !item.selectProtocalLinkCallBlock?:item.selectProtocalLinkCallBlock();
        };
        return;
    }else{
        self.titleLabel.text = item.title;
    }
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[UIButton class]] && obj.tag >= 1000) {
            [obj removeFromSuperview];
        }
    }];
    
    
    [self.protocolItem.protocolButtons enumerateObjectsUsingBlock:^(TDFProtocolButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [self createProtocalStyleButton:obj.title];
        button.tag = 1000 + idx;
        [self.contentView addSubview:button];
        
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            !obj.didProtocalLinkCallBlock?:obj.didProtocalLinkCallBlock();
        }];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_left);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
            make.height.mas_equalTo(25);
            if(idx == 0) {
                make.top.equalTo(self.titleLabel.mas_bottom);
            }else {
                UIButton *prebutton = [self.contentView viewWithTag:(1000+idx-1)];
                make.top.equalTo(prebutton.mas_bottom);
            }
        }];
    }];
}

- (UIButton *)selectedIcon {
    if(!_selectedIcon) {
        _selectedIcon = [[UIButton alloc] init];
        [_selectedIcon setImage:[UIImage imageNamed:@"food_cell_icon_unSelected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_selectedIcon setImage:[UIImage imageNamed:@"food_cell_icon_selected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateSelected];
        @weakify(self);
        [[_selectedIcon rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            _selectedIcon.selected = !_selectedIcon.selected;
            self.protocolItem.seleted = _selectedIcon.selected;
            !self.protocolItem.didSelectProtocalBlock?:self.protocolItem.didSelectProtocalBlock(_selectedIcon.selected);
        }];
    }
    return _selectedIcon;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _titleLabel;
}

- (UIButton *)createProtocalStyleButton:(NSString *)title {
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor colorWithHexString:@"#3495C8"] forState:UIControlStateNormal];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:title];;
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, title.length)];
    [attributedString addAttribute:NSUnderlineColorAttributeName value:[UIColor colorWithHexString:@"#3495C8"] range:NSMakeRange(0, title.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#3495C8"] range:NSMakeRange(0, title.length)];
    [button setAttributedTitle:attributedString forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    return  button;
}

@end
