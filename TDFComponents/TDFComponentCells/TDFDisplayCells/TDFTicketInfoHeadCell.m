//
//  TDFTicketInfoHeadCell.m
//  TDFComponents
//
//  Created by doubanjiang on 2017/12/18.
//

#import "TDFTicketInfoHeadCell.h"
#import "TDFTicketInfoHeadItem.h"
#import "TDFTicketInfoHeadItem.h"
#import <TDFCategories/UIColor+RGB.h>
#import <TDFStyleKit/UIColor+tdf_standard.h>
#import "Masonry.h"

@interface TDFTicketInfoHeadCell ()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *leftL;

@property (nonatomic, strong) UILabel *titleL;

@property (nonatomic, strong) TDFTicketInfoHeadCellTagView *descView;

@property (nonatomic, strong) UILabel *detailL;

@end

@implementation TDFTicketInfoHeadCell

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.leftL];
    [self.bgView addSubview:self.descView];
    [self.bgView addSubview:self.lineView];
    [self.bgView addSubview:self.titleL];
    [self.bgView addSubview:self.detailL];
    
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.left.offset(10);
        make.bottom.offset(-5);
        make.right.offset(-10);
    }];
    [self.leftL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(80);
        make.centerY.equalTo(self.bgView.mas_centerY);
        make.left.offset(15);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.left.equalTo(self.leftL.mas_right).offset(10);
        make.top.offset(10);
        make.bottom.offset(-10);
    }];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineView.mas_right).offset(15);
        make.height.mas_equalTo(22);
        make.bottom.equalTo(self.bgView.mas_centerY).offset(-3);
    }];
    [self.descView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleL);
        make.left.equalTo(self.titleL.mas_right).offset(5);
        make.right.lessThanOrEqualTo(self.bgView);
    }];
    [self.detailL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_left);
        make.height.mas_equalTo(18);
        make.top.equalTo(self.bgView.mas_centerY).offset(3);
    }];
    
}

- (void)configCellWithItem:(TDFTicketInfoHeadItem *)item {
    
    [self.leftL setText:item.leftTitle];
    [self.titleL setText:item.title];
    [self.detailL setText:item.detail];
    [self.descView setText:item.effect];
}

+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item {
    
    return 81.0f;
}

#pragma mark - Getter

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        [_bgView setBackgroundColor:[UIColor tdf_colorWithRGB:0xff0033 alpha:0.05]];
    }
    return _bgView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        [_lineView setBackgroundColor:[UIColor tdf_hex_CCCCCC]];
    }
    return _lineView;
}

- (UILabel *)leftL {
    if (!_leftL) {
        _leftL = [UILabel new];
        [_leftL setFont:[UIFont systemFontOfSize:13]];
        [_leftL setTextColor:[UIColor tdf_hex_FF0033]];
        [_leftL setNumberOfLines:0];
    }
    return _leftL;
}

- (UILabel *)titleL {
    if (!_titleL) {
        _titleL = [UILabel new];
        [_titleL setFont:[UIFont boldSystemFontOfSize:17]];
        [_titleL setTextColor:[UIColor tdf_hex_333333]];
    }
    return _titleL;
}

- (UILabel *)detailL {
    if (!_detailL) {
        _detailL = [UILabel new];
        [_detailL setFont:[UIFont systemFontOfSize:13]];
        [_detailL setTextColor:[UIColor tdf_hex_999999]];
    }
    return _detailL;
}

- (TDFTicketInfoHeadCellTagView *)descView {
    if (!_descView) {
        _descView = [[TDFTicketInfoHeadCellTagView alloc] init];
        _descView.backgroundColor = [UIColor redColor];
    }
    return _descView;
}

@end


@interface TDFTicketInfoHeadCellTagView ()

@property (nonatomic, strong)UILabel *label;

@end

@implementation TDFTicketInfoHeadCellTagView

- (instancetype)init {
    if (self = [super init]) {
        self.layer.cornerRadius = 3;
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(8);
            make.right.equalTo(self).offset(-2);
            make.top.equalTo(self).offset(1);
            make.bottom.equalTo(self).offset(-1);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, self.bounds.size.height/2.0)];
    [path addLineToPoint:CGPointMake(self.bounds.size.height/2.0, 0)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, 0)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [path addLineToPoint:CGPointMake(self.bounds.size.height/2.0, self.bounds.size.height)];
    [path closePath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

- (void)setText:(NSString *)text {
    _text = text;
    self.label.text = text;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:11];
    }
    return _label;
}

@end
