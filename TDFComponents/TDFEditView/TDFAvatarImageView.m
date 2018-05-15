//
//  TDFAvatarImageView.m
//  Pods
//
//  Created by chaiweiwei on 2016/12/28.
//
//

#import "TDFAvatarImageView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface TDFAvatarImageView ()

@property (nonatomic,strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UIImageView *rightArrowV;

@end

@implementation TDFAvatarImageView

- (void)initView {
    [super initView];
    
    self.spliteView.hidden = YES;
    
    [self addSubview:self.rightArrowV];
    [self.rightArrowV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@7.5);
        make.height.mas_equalTo(@13);
        make.right.equalTo(self.mas_right).offset(-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self addSubview:self.avatarImageView];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).with.offset(-28);
        make.height.equalTo(@(68));
        make.width.equalTo(@(68));
    }];
}

- (void)configureViewWithModel:(TDFAvatarImageItem *)model {
    [super configureViewWithModel:model];
    
    self.model = model;
    
    if(model.avatarImage){
        self.avatarImageView.image = model.avatarImage;
    }else{
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.filePath] placeholderImage:[UIImage imageNamed:model.defaultFileName]];
    }
    
    [self checkShouldShowTip];
}

+ (CGFloat)getHeight {
    return 90;
}

- (UIImageView *)avatarImageView {
    if(!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
        _avatarImageView.layer.borderWidth = 0.5;
        _avatarImageView.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.1].CGColor;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 3;
        _avatarImageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
        tapGestureRecognizer.numberOfTouchesRequired = 1;
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [tapGestureRecognizer addTarget:self action:@selector(avatarAction)];
        [_avatarImageView addGestureRecognizer:tapGestureRecognizer];
    }
    return _avatarImageView;
}

- (UIImageView *)rightArrowV {
    if (!_rightArrowV) {
        _rightArrowV = [UIImageView new];
        [_rightArrowV setImage:[UIImage imageNamed:@"icon_arrow_right_eleinvoice"]];
        _rightArrowV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _rightArrowV;
}

- (void)avatarAction {
    !self.model.filterBlock?:self.model.filterBlock();
}

- (void)checkShouldShowTip
{
    if ([self.model.preValue isEqualToString:self.model.filePath]) {
        self.model.isShowTip = NO;
        self.lblTip.hidden = YES;
    } else {
        self.model.isShowTip = YES;
        self.lblTip.hidden = NO;
    }
}
    
@end
