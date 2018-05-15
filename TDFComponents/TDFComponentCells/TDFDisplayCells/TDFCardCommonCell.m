//
//  TDFCardCommonCell.m
//  Pods
//
//  Created by doubanjiang on 2017/3/6.
//
//

#import "TDFCardCommonCell.h"
#import "Masonry.h"
#import "TDFCardCommonItem.h"

@interface TDFCardCommonCell ()

@property (nonatomic ,strong) UIView      *bgView;

@property (nonatomic ,strong) UIImageView *iconView;

@property (nonatomic ,strong) UILabel     *titlelabel;

@property (nonatomic ,strong) UIImageView *icoPwV;

@property (nonatomic ,strong) UIButton    *btn;

@property (nonatomic, copy) void (^clickedBlock)();

@end

@implementation TDFCardCommonCell

// cell创建的时候调用，只调用一次，类似viewDidLoad
- (void)cellDidLoad {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titlelabel];
    [self.contentView addSubview:self.icoPwV];
    [self.contentView addSubview:self.btn];
    
    __weak typeof(self) weakSelf = self;
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.insets(UIEdgeInsetsMake(0, 0, 1, 0));
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.contentView.mas_left).offset(10);
        make.top.equalTo(weakSelf.contentView.mas_top).offset(20);
        make.height.equalTo(weakSelf.contentView.mas_height).offset(-40);
        make.width.equalTo(weakSelf.contentView.mas_height).offset(-40);
    }];
    
    [self.icoPwV mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.top.equalTo(weakSelf.contentView.mas_top).offset(10);
        make.centerY.equalTo(weakSelf.contentView.mas_centerY);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
        
    }];
    
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.iconView.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.iconView);
    }];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf.contentView);
    }];
}

// cell的高度，item可以强转成对应的自定义item
+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item {
    
    return 88;
}

// 根据item来更新cell，item可以强转成对应的自定义item，此时cell视图大小还未确定
- (void)configCellWithItem:(TDFCardCommonItem *)item {
    
    self.clickedBlock = item.clickedBlock;
    
    self.iconView.image = item.iconImage;
    
    self.titlelabel.text = item.title;
    
//    self.icoPwV.hidden = !item.isLock;
    
    self.icoPwV.hidden = (!item.isLock)&&(item.isOpen);
    
    self.icoPwV.image = [UIImage imageNamed:item.isLock?@"ico_pw_w":@"ico_pw_red"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)click{
    
    if (self.clickedBlock) {
        self.clickedBlock();
    }
}

#pragma mark - Getter

- (UIImageView *)iconView {
    
    if (!_iconView) {
        
        _iconView = [UIImageView new];
    }
    
    return _iconView;
}

- (UILabel *)titlelabel {
    
    if (!_titlelabel) {
        
        _titlelabel = [UILabel new];
        _titlelabel.font = [UIFont boldSystemFontOfSize:15];
    }
    return _titlelabel;
}

- (UIView *)bgView {
    
    if (!_bgView) {
        
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.alpha = 0.7;
    }
    return _bgView;
}

- (UIButton *)btn {
    
    if (!_btn) {
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor clearColor];
        [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btn;
}

- (UIImageView *)icoPwV {
    
    if (!_icoPwV) {
        
        _icoPwV = [UIImageView new];
        
        _icoPwV.contentMode = UIViewContentModeScaleAspectFit;
        
        _icoPwV.image = [UIImage imageNamed:@"ico_pw_w" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _icoPwV;
}


@end
