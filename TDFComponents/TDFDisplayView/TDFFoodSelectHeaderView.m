//
//  TDFFoodSelectHeaderView.m
//  Pods
//
//  Created by happyo on 2016/11/30.
//
//

#import "TDFFoodSelectHeaderView.h"
#import "Masonry.h"

@interface TDFFoodSelectHeaderView ()

@property (nonatomic, strong) UIButton *btnSelect;

@property (nonatomic, strong) UILabel *lblHeader;

@property (nonatomic, strong) UIImageView *igvBackgroudIcon;

@end
@implementation TDFFoodSelectHeaderView

- (instancetype)initWithTitle:(NSString *)title
{
    self = [self initWithTitle:title isSelected:YES];
    
    if (self) {
        self.btnSelect.hidden = YES;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title isSelected:(BOOL)isSelected
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    self = [super initWithFrame:CGRectMake(0, 0, screenWidth, [TDFFoodSelectHeaderView heightForView])];

    if (self) {
        //
        [self addSubview:self.igvBackgroudIcon];
        [self.igvBackgroudIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.height.equalTo(@(22));
            make.width.equalTo(@(180));
        }];
        
        [self addSubview:self.btnSelect];
        [self.btnSelect mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.igvBackgroudIcon);
            make.leading.equalTo(self.igvBackgroudIcon).with.offset(3);
            make.height.equalTo(@(18));
            make.width.equalTo(@(18));
        }];
        
        [self addSubview:self.lblHeader];
        [self.lblHeader mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.igvBackgroudIcon);
            make.height.equalTo(@(14));
            make.width.equalTo(@(180));
        }];
        
        self.lblHeader.text = title;
        self.btnSelect.selected = isSelected;
    }
    
    return self;
}

- (void)changeSelected:(BOOL)isSelected
{
    self.btnSelect.selected = isSelected;
}

- (void)updateTitleColor:(UIColor *)color
{
    self.lblHeader.textColor = color;
}

+ (CGFloat)heightForView
{
    return 42;
}

- (void)btnSelectClicked:(UIButton *)button
{
    button.selected = !button.isSelected;
    
    if (self.selectedBlock) {
        self.selectedBlock(button.selected);
    }
}


#pragma mark -- Getters && Setters --

- (UIButton *)btnSelect
{
    if (!_btnSelect) {
        _btnSelect = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnSelect setBackgroundImage:[UIImage imageNamed:@"food_cell_icon_unSelected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        [_btnSelect setBackgroundImage:[UIImage imageNamed:@"food_cell_icon_selected" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateSelected];
        [_btnSelect addTarget:self action:@selector(btnSelectClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnSelect;
}

- (UILabel *)lblHeader
{
    if (!_lblHeader) {
        _lblHeader = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblHeader.font = [UIFont systemFontOfSize:12];
        _lblHeader.textColor = [UIColor whiteColor];
        _lblHeader.textAlignment = NSTextAlignmentCenter;
    }
    
    return _lblHeader;
}

- (UIImageView *)igvBackgroudIcon
{
    if (!_igvBackgroudIcon) {
        _igvBackgroudIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _igvBackgroudIcon.image = [UIImage imageNamed:@"food_header_backgroud_icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    
    return _igvBackgroudIcon;
}

@end
