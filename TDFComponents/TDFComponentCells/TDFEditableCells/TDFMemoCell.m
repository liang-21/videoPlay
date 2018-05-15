//
//  TDFMemoCell.m
//  TDFComponents
//
//  Created by guozhi on 2018/3/26.
//

#import "TDFMemoCell.h"
#import "TDFEditMemoView.h"
#import "TDFMemoItem.h"
#import "Masonry.h"
#import "TDFBaseEditView+Relayout.h"
#import "NSBundle+Language.h"

@interface TDFMemoCell ()

@property (nonatomic, strong) TDFEditMemoView *buttonView;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) TDFMemoItem *item;

@end

@implementation TDFMemoCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.buttonView];
    [self.contentView addSubview:self.selectButton];
    
    [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
}

+ (CGFloat)heightForCellWithItem:(TDFMemoItem *)item
{
    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFEditMemoView getHeightWithModel:item];
    }
    
    return height;
}

- (void)configCellWithItem:(TDFMemoItem *)item
{
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    self.item = item;
    self.selectButton.hidden = !item.selectedBlock;
    
    [self.buttonView configureViewWithModel:item];
    
    if(item.backgroundColor) {
        self.backgroundColor = item.backgroundColor;
    }
    
    //如果需要重新布局、尤其是标题显示不够的时候
    if (item.needRelayout) {
//        if ([NSBundle isEnglishLanguage]) {
//            [self.buttonView relayoutAfterConfigureModel:item];
//        }
    }
}

#pragma mark -- Setters && Getters --

- (TDFEditMemoView *)buttonView
{
    if (!_buttonView) {
        _buttonView = [[TDFEditMemoView alloc] initWithFrame:CGRectZero];
    }
    
    return _buttonView;
}


- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (void)clickButton {
    if (self.item.selectedBlock) {
        self.item.selectedBlock();
    }
}

@end
