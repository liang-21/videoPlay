//
//  TDFCodeScanCell.m
//  TDFLoginModule
//
//  Created by doubanjiang on 2017/5/31.
//  Copyright © 2017年 doubanjiang. All rights reserved.
//

#import "TDFCodeScanCell.h"
#import "TDFCodeScanView.h"
#import "TDFCodeScanItem.h"
#import "Masonry.h"

@interface TDFCodeScanCell ()

@property (nonatomic, strong) TDFCodeScanView *textView;

@property (nonatomic, strong) TDFCodeScanItem *cellItem;

@end

@implementation TDFCodeScanCell

- (void)cellDidLoad {

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFCodeScanItem *)item {

    CGFloat height = 0;
    
    if (item.shouldShow) {
        height = [TDFCodeScanView getHeightWithModel:item];
    }
    
    return height;
}


- (void)cellDidEndDisplay {

    [super cellDidEndDisplay];
    
}

- (void)configCellWithItem:(TDFCodeScanItem *)item {

    self.cellItem = item;
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    [self.textView configureViewWithModel:item];
}

#pragma mark -- Setters && Getters --

- (TDFCodeScanView *)textView
{
    if (!_textView) {
        _textView = [[TDFCodeScanView alloc] initWithFrame:CGRectZero];
    }
    return _textView;
}



@end
