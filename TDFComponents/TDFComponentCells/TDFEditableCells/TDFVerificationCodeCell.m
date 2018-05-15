//
//  TDFVerificationCodeCell.m
//  Pods
//
//  Created by 刘红琳 on 2017/3/6.
//
//

#import "TDFVerificationCodeCell.h"
#import "TDFVerificationCodeView.h"
#import "TDFVerificationCodeItem.h"
#import "Masonry.h"
@interface TDFVerificationCodeCell ()

@property (nonatomic, strong) TDFVerificationCodeView *buttonView;

@end
@implementation TDFVerificationCodeCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.buttonView];
    [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFVerificationCodeItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFVerificationCodeView getHeightWithModel:item];
    }
    
    return height;
}

- (void)configCellWithItem:(TDFVerificationCodeItem *)item
{
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    [self.buttonView configureViewWithModel:item];
}

#pragma mark -- Setters && Getters --

- (TDFVerificationCodeView *)buttonView
{
    if (!_buttonView) {
        _buttonView = [[TDFVerificationCodeView alloc] initWithFrame:CGRectZero];
    }
    
    return _buttonView;
}

@end
