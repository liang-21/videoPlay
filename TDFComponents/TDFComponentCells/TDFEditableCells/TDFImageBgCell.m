//
//  TDFImageBgCell.m
//  RestApp
//
//  Created by 小龙虾 on 2017/7/17.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFImageBgCell.h"
#import "TDFImageBgItem.h"
#import "ColorHelper.h"
#import "TDFCardBgImageView.h"
#import "TDFImageBaseView.h"
#import <Masonry/Masonry.h>

@interface TDFImageBgCell ()
@property (nonatomic, strong)UIImageView *iconImg;
@property (nonatomic, strong)UILabel *titlelbl;
@property (nonatomic, strong)UIButton *btnClick;
@property (nonatomic, strong)TDFImageBgItem *cellItem;
@end
@implementation TDFImageBgCell

-(void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.iconImg];
    [self addSubview:self.titlelbl];
    [self addSubview:self.btnClick];
    
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    
    [self.titlelbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImg.mas_bottom).offset(5);
        make.left.mas_equalTo(0);
        make.width.equalTo(self.mas_width);
        make.height.mas_equalTo(20);
    }];
    
    [self.btnClick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(20);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
}

-(UIImageView *)iconImg
{
    if (!_iconImg) {
        self.iconImg = [[UIImageView alloc] init];
        self.iconImg.backgroundColor = [UIColor clearColor];
        self.iconImg.layer.cornerRadius = 30;
        self.iconImg.layer.masksToBounds = YES;
    }
    return _iconImg;
}

-(UILabel *)titlelbl
{
    if (!_titlelbl) {
        self.titlelbl = [[UILabel alloc] init];
        self.titlelbl.textAlignment = NSTextAlignmentCenter;
        self.titlelbl.font = [UIFont systemFontOfSize:15];
        self.titlelbl.textColor = [ColorHelper getTipColor3];
    }
    return _titlelbl;
}

-(void)configCellWithItem:(TDFImageBgItem *)item
{
    self.cellItem = item;
    self.iconImg.image = item.iconImg;
    self.titlelbl.text = item.title;
    self.btnClick.hidden = !item.showTip;
    int i = 0;
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[TDFImageBaseView class]]) {
            [obj removeFromSuperview];
        }
    }
    for (TDFCardBgImageBaseItem *items in item.imageAry) {
        TDFImageBaseView *cell = [[TDFImageBaseView alloc] initWithModel:items];
        cell.tag = i;
        cell.btnBlock = ^(NSInteger btnType, NSInteger idx){
            item.fileBlock(btnType, idx);
        };
        [self addSubview:cell];
        cell.frame = CGRectMake(0, 100+([UIScreen mainScreen].bounds.size.width*0.6+10)*i, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.6+10);
        i++;
    }
}

-(UIButton *)btnClick
{
    if (!_btnClick) {
        self.btnClick = [[UIButton alloc] init];
        [self.btnClick setTitle:@"查看原账户信息 >" forState:UIControlStateNormal];
        [self.btnClick.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [self.btnClick setTitleColor:[ColorHelper getGreenColor] forState:UIControlStateNormal];
        [self.btnClick addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnClick;
}

-(void)clickEvent:(UIButton *)sender
{
    self.cellItem.clickBlock();
}

+(CGFloat)heightForCellWithItem:(TDFImageBgItem *)item
{
    if (item.showTip) {
        return 140+item.imageAry.count*([UIScreen mainScreen].bounds.size.width*0.6+10);
    }
    return 100+item.imageAry.count*([UIScreen mainScreen].bounds.size.width*0.6+10);
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
