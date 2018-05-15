//
//  TDFTableViewIsChainCell.m
//  Pods
//
//  Created by 刘红琳 on 2017/5/17.
//
//

#import "TDFTableViewIsChainCell.h"
#import "TDFTableViewIsChainItem.h"
#import "Masonry.h"
#import <TDFCore/TDFCore.h>

@interface TDFTableViewIsChainCell()
@property (strong,nonatomic) TDFTableViewIsChainItem *model;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *image;

@property (nonatomic, strong) UIImageView *deleteImage;

@property (nonatomic,strong) UIButton *bigButton;

@property (nonatomic,strong) UIView *line;
@end

@implementation TDFTableViewIsChainCell

#pragma mark - DHTTableViewCellDelegate

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor =[UIColor whiteColor];
    view.tag = 1000;
    view.alpha =0.7;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top).with.offset(1);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];
    
    [self addSubview:self.titleLabel];
    
    [self addSubview:self.image];
    
    [self addSubview:self.deleteImage];
    
    [self addSubview:self.line];
    [self addSubview:self.bigButton];
    [self.bigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFTableViewIsChainItem *)item
{
    if(!item.shouldShow) {
        return 0;
    }
    return 44;
}

- (void)configCellWithItem:(TDFTableViewIsChainItem *)item
{
    self.hidden = !item.shouldShow;
    if (!item.shouldShow) return;
    
    self.model = item;
    if (item.bgViewColor) {
        UIView *view = [self viewWithTag:1000];
        view.backgroundColor = item.bgViewColor;
    }
    self.titleLabel.text = item.title;
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.top.equalTo(self.mas_top).with.offset(15);
    }];
    [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).with.offset(5);
        make.top.equalTo(self.mas_top).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(30, 15));
    }];
    
    [self.deleteImage mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_right).with.offset(-32);
        make.top.equalTo(self.mas_top).with.offset(11);
        make.size.mas_equalTo(CGSizeMake(self.deleteImage.image.size.width, self.deleteImage.image.size.height));
    }];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.top.equalTo(self.mas_bottom).with.offset(-1);
        make.size.mas_equalTo(CGSizeMake(screenWidth - 20,1));
    }];
    
    self.image.hidden = !self.model.isChain;
    self.line.hidden = self.model.isHideLine;
    self.deleteImage.hidden = !self.model.isDelete;
}

- (void)bigButtonAction {
    if(self.model.didSelectRowBlock) {
        self.model.didSelectRowBlock();
    }
}

#pragma mark - Get Set

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = RGBA(51, 51, 51, 1);
        [_titleLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh
                                       forAxis:UILayoutConstraintAxisHorizontal];
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh
                                                     forAxis:UILayoutConstraintAxisHorizontal];
        
    }
    return _titleLabel;
}

- (UIImageView *)image
{
    if (!_image) {

        _image = [[UIImageView alloc] init];
        _image.image = TDFLocaizedImageInBundle(@"ico_chain", [NSBundle bundleForClass:[self class]]);
    }
    return _image;
}

- (UIImageView *)deleteImage
{
    if (!_deleteImage) {
        _deleteImage = [[UIImageView alloc] init];
        _deleteImage.image = [UIImage imageNamed:@"ico_right_delete" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    return _deleteImage;
}

- (UIView *)line
{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    }
    return _line;
}

- (UIButton *)bigButton {
    if(!_bigButton) {
        _bigButton = [[UIButton alloc] init];
        _bigButton.backgroundColor = [UIColor clearColor];
        [_bigButton addTarget:self action:@selector(bigButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _bigButton.hidden = YES;
    }
    return _bigButton;
}

@end
