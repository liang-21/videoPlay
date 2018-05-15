//
//  TDFImagePickerView.m
//  RestApp
//
//  Created by Octree on 12/1/17.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFImagePickerView.h"
#import "UIImageView+WebCache.h"
#import <TDFCategories/TDFCategories.h>
#import <Masonry/Masonry.h>
#import <TDFCore/TDFCore.h>

@interface TDFImagePickerView ()

@property (strong, nonatomic, readwrite) UIImageView *imageView;
@property (strong, nonatomic, readwrite) UIButton *addButton;
@property (strong, nonatomic, readwrite) UIButton *deleteButton;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *errorLabel;
@property (strong, nonatomic) UILabel *promptLabel;

@end


@implementation TDFImagePickerView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        [self configViews];
    }
    return self;
}

#pragma mark - Methods


#pragma mark Override

- (CGSize)sizeThatFits:(CGSize)size {

    return CGSizeMake(-1, 233);
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    size.height = 233;
    return size;
}

#pragma mark Config Views

- (void)configViews {

    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    @weakify(self);
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.edges.equalTo(self);
    }];
    
    [self addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.mas_top).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.width.mas_equalTo(28);
        make.height.mas_equalTo(28);
    }];
    
    [self addSubview:self.addButton];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
       @strongify(self);
        make.top.equalTo(self.mas_top).with.offset(70);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       @strongify(self);
        make.top.equalTo(self.addButton.mas_bottom).with.offset(10);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
    }];
    
    [self addSubview:self.errorLabel];
    [self.errorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(24);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
    }];
    
    [self addSubview:self.promptLabel];
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.bottom.mas_equalTo(self.mas_bottom).with.offset(-20);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
    }];
}

- (void)updateViews {

    self.addButton.hidden = self.imageURL != nil;
    self.titleLabel.hidden = self.imageURL != nil;
    self.errorLabel.hidden = self.imageURL != nil;
    self.promptLabel.hidden = self.imageURL != nil;
    
    self.imageView.hidden = self.imageURL == nil;
    self.deleteButton.hidden = self.imageURL == nil || self.alwaysHideDeleteButton;
    self.titleLabel.text = self.title;
    self.promptLabel.text = self.prompt;
    self.errorLabel.text = self.warning;
    self.imageURL ? [self.imageView sd_setImageWithURL:self.imageURL] : (self.imageView.image = nil);
}

#pragma mark Action 


- (void)addButtonTapped {

    !self.selectBlock ?: self.selectBlock();
}


- (void)deleteButtonTapped {

    !self.deleteBlock ?: self.deleteBlock();
}


#pragma mark - Accessor


- (UIImageView *)imageView {
    
    if (!_imageView) {
        
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}
- (UIButton *)addButton {
    
    if (!_addButton) {
        
        _addButton = [[UIButton alloc] init];
        [_addButton setImage:[UIImage imageNamed:@"icon_add_image" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(addButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}
- (UIButton *)deleteButton {
    
    if (!_deleteButton) {
        
        _deleteButton = [[UIButton alloc] init];
        [_deleteButton setImage:[UIImage imageNamed:@"ico_remove" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textColor = [UIColor tdf_colorWithRGB:0x999999];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}
- (UILabel *)errorLabel {
    
    if (!_errorLabel) {
        
        _errorLabel = [[UILabel alloc] init];
        _errorLabel.font = [UIFont systemFontOfSize:13];
        _errorLabel.textColor = [UIColor tdf_colorWithRGB:0xCC0000];
        _errorLabel.textAlignment = NSTextAlignmentCenter;
        _errorLabel.numberOfLines = 0;
    }
    return _errorLabel;
}
- (UILabel *)promptLabel {
    
    if (!_promptLabel) {
        
        _promptLabel = [[UILabel alloc] init];
        _promptLabel.font = [UIFont systemFontOfSize:11];
        _promptLabel.textColor = [UIColor tdf_colorWithRGB:0x999999];
        _promptLabel.numberOfLines = 0;
    }
    
    return _promptLabel;
}

- (void)setImageURL:(NSURL *)imageURL {

    _imageURL = imageURL;
    [self updateViews];
}

- (void)setTitle:(NSString *)title {

    if (title != _title) {
        _title = [title copy];
        [self updateViews];
    }
}

- (void)setPrompt:(NSString *)prompt {
    
    if (prompt != _prompt) {
        _prompt = [prompt copy];
        [self updateViews];
    }
}

- (void)setWarning:(NSString *)warning {
    
    if (warning != _warning) {
        _warning = [warning copy];
        [self updateViews];
    }
}

@end
