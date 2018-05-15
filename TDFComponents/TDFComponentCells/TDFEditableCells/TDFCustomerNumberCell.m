//
//  TDFCustomerNumberItemCell.m
//  Pods
//
//  Created by iOS香肠 on 2017/2/21.
//
//

#import "TDFCustomerNumberCell.h"
#import "TDFCustomerNumberItem.h"
#import "NSString+TDF_Empty.h"
#import "Masonry.h"
//仅仅只是用来展示cell ,并不需要继承TDFBaseEditView
@interface TDFCustomerNumberCell ()

@property (nonatomic ,strong) TDFCustomerNumberItem *model;
@property (nonatomic,strong) UILabel *titleLbl;
@property (nonatomic, strong) UILabel  *detailLbl;
@property (nonatomic ,strong) UIView *detailView;
@property (nonatomic , strong) UIView *line;
@property (nonatomic , strong) UIImageView *nextIco;
@property (nonatomic ,strong) UIButton *clickButton;

@end
@implementation TDFCustomerNumberCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self layoutCustomerCell];
}



- (void)layoutCustomerCell
{
    [self. line  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo (self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_top).with.offset(0.5);
    }];
    
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.bottom.equalTo (self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.detailView.mas_left).with.offset(10);
        make.top.equalTo(self.detailView.mas_top).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(150, 15));
    }];
    [self.detailLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLbl);
        make.top.equalTo(self.titleLbl.mas_top).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-40, 40));
    }];
    
    [self.nextIco mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-5);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self  customerBgViewAndFontSize];
    
}


- (void)btnNextClick
{
   [ [UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    if (self.model.selectedBlock) {
        self.model.selectedBlock(self.model.sourceData);
    }
}

+ (CGFloat)heightForCellWithItem:(TDFCustomerNumberItem *)item
{
    CGFloat height = 80;
    return height;
}


- (void)configCellWithItem:(DHTTableViewItem *)item
{
    self.model  = item;
    [self  configureViewWithModel:item];
}


- (void)configureViewWithModel:(TDFCustomerNumberItem *)model
{
    self.titleLbl .text   = [NSString stringWithFormat:@"%@",model.textValue];
    self.detailLbl.text  = [NSString stringWithFormat:@"%@",model.textDetailValue];
    if ([model.attributedText.string isNotEmpty]) {
        self.detailLbl.attributedText  = model.attributedText;
     }
    
}
#pragma mark -- Setters && Getters --

- (UILabel *)titleLbl
{
    if (!_titleLbl) {
        _titleLbl  = [[UILabel  alloc]  init];
        [self.detailView addSubview:_titleLbl];
    }
    return _titleLbl;
}

- (UILabel *)detailLbl
{
    if (!_detailLbl) {
        _detailLbl = [[UILabel  alloc] init ];
        [self.detailView addSubview:_detailLbl];
    }
    return _detailLbl;
}

- (UIView *)line
{
    if (!_line) {
        _line  = [[UIView  alloc] init ];
        _line.backgroundColor  = [UIColor clearColor];
        [self addSubview:_line];
    }
    return _line;
}

- (UIView *)detailView
{
    if (!_detailView) {
        _detailView  = [[UIView  alloc] init];
        _detailView.backgroundColor = [UIColor whiteColor];
        _detailView.alpha = 0.7;
        [self addSubview:_detailView];
    }
    return _detailView;
}

- (UIImageView *)nextIco
{
    if (!_nextIco) {
        _nextIco  = [[UIImageView  alloc] init];
        [self addSubview:_nextIco];
    }
    return _nextIco;
}

- (UIButton *)clickButton
{
    if (!_clickButton) {
        _clickButton  = [[UIButton  alloc] init];
        [_clickButton addTarget:self action:@selector(btnNextClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_clickButton];
    }
    return _clickButton;
}

- (void) customerBgViewAndFontSize
{
    self.line.backgroundColor  = [UIColor clearColor];
    
    self.titleLbl.backgroundColor = [UIColor clearColor];
    self.titleLbl.textColor =[UIColor colorWithRed: 62/255.0f green:61/255.0f blue:61/255.0f alpha:1];
    self.titleLbl.numberOfLines =1;
    self.titleLbl.font = [UIFont systemFontOfSize:14];
    self.titleLbl.textAlignment  = NSTextAlignmentLeft;
    
    
    self.detailLbl.textAlignment = NSTextAlignmentLeft;
    self.detailLbl.font  = [UIFont systemFontOfSize:12];
    self.detailLbl.backgroundColor = [UIColor clearColor];
    self.detailLbl.textColor  =  [UIColor colorWithRed: 110/255.0f green:110/255.0f blue:110/255.0f alpha:1];
    self.detailLbl.numberOfLines =0;
    
    self.nextIco.backgroundColor = [ UIColor clearColor] ;
    self.nextIco.image = [UIImage imageNamed:@"ico_next.png" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

@end
