//
//  TDFMultiDisplayHeaderView.m
//  Pods
//
//  Created by chaiweiwei on 2017/2/17.
//
//

#import "TDFMultiDisplayHeaderView.h"
#import "Masonry.h"

@interface TDFMultiDisplayHeaderView()

@property (nonatomic,strong) UILabel *leftTitleLabel;
@property (nonatomic,strong) UILabel *rightTitleLabel;

@property (nonatomic,strong) UIButton *deleteButton;

@property (nonatomic, strong) TDFMultiDisplayHeaderItem *model;

@end

@implementation TDFMultiDisplayHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.deleteButton];
        [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
            make.right.equalTo(self.mas_right);
            make.width.mas_equalTo(38);
        }];

        [self addSubview:self.leftTitleLabel];
        [self.leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
        }];
        [self addSubview:self.rightTitleLabel];
        [self.rightTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(225*[UIScreen mainScreen].bounds.size.width/375.0);
            make.right.equalTo(self.deleteButton.mas_left);
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
        }];
    }
    
    return self;
}


- (UILabel *)leftTitleLabel {
    if(!_leftTitleLabel) {
        _leftTitleLabel = [self createLabel];
    }
    return _leftTitleLabel;
}

- (UILabel *)rightTitleLabel {
    if(!_rightTitleLabel) {
        _rightTitleLabel = [self createLabel];
    }
    return _rightTitleLabel;
}

- (UIButton *)deleteButton {
    if(!_deleteButton) {
        _deleteButton = [[UIButton alloc] init];
        [_deleteButton setImage:[UIImage imageNamed:@"food_display_icon_delete" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

- (void)deleteAction {
    !self.model.deleteBlock?:self.model.deleteBlock();
}

- (UILabel *)createLabel{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    return label;
}

- (void)configureViewWithModel:(TDFMultiDisplayHeaderItem *)model {
    self.model = model;

    self.leftTitleLabel.text = model.leftContent;
    self.rightTitleLabel.text = model.rightContent;
    
    if(model.editStyle == TDFEditStyleEditable) {
        self.deleteButton.hidden = NO;
    }else {
        self.deleteButton.hidden = YES;
    }
}

@end
