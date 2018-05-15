//
//  TDFCustomNormalSectionView.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/27.
//
//

#import "TDFCustomNormalSectionView.h"
#import <TDFOldBaseUtil/UIColor+Hex.h>
#import <Masonry/Masonry.h>
#import "TDFShapeButton.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface TDFCustomNormalSectionView()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) TDFShapeButton *subtitleButton;

@end

@implementation TDFCustomNormalSectionView

+ (instancetype)configWithModel:(TDFCustomNormalSectionItem *)item {
    TDFCustomNormalSectionView *view = [[TDFCustomNormalSectionView alloc] init];
    view.titleLabel.text = item.title;
    [view.subtitleButton setTitle:item.subtitle forState:UIControlStateNormal];
    [view.subtitleButton setTitleColor:item.subtitleColor forState:UIControlStateNormal];
    if(item.titleAttributedString) {
        view.titleLabel.attributedText = item.titleAttributedString;
    }
    [[view.subtitleButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        !item.callBack?:item.callBack();
    }];
    
    view.frame = CGRectMake(0, 0, 0, 44);
    return view;
}

+ (CGFloat)heightWithModel:(NSObject *)item {
    return 44;
}

- (instancetype)init {
    if(self = [super init]) {
        
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
        
        UIView *spliteTopView = [[UIView alloc] init];
        spliteTopView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        [self addSubview:spliteTopView];
        [spliteTopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.mas_offset(1);
        }];
        
        [self addSubview:self.subtitleButton];
        [self.subtitleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.subtitleButton.mas_left);
        }];
        
        UIView *spliteBottomView = [[UIView alloc] init];
        spliteBottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        [self addSubview:spliteBottomView];
        [spliteBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.mas_offset(1);
        }];
    }
    return self;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _titleLabel;
}

- (TDFShapeButton *)subtitleButton {
    if(!_subtitleButton) {
        _subtitleButton = [[TDFShapeButton alloc] init];
        _subtitleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_subtitleButton setTitleColor:[UIColor colorWithHexString:@"#0088CC"] forState:UIControlStateNormal];
        _subtitleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_subtitleButton setImage:[UIImage imageNamed:@"icon_next_alpha" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        _subtitleButton.shapeType = TDFButtonShapeTypeHorizontal;
        _subtitleButton.space = 10;
    }
    return _subtitleButton;

}
@end
