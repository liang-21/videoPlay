//
//  TDFSKDisplayedTextCell.m
//  DHTTableViewManager
//
//  Created by tripleCC on 12/10/16.
//  Copyright © 2016 tripleCC. All rights reserved.
//
#import <Masonry/Masonry.h>
#import <TDFCategories/TDFCategories.h>
#import "UITableViewCell+SeperatorLine.h"
#import "TDFSKDisplayedTextCell.h"
#import "TDFSKDisplayedTextItem.h"

@interface TDFSKDisplayedTextCell()
@property (strong, nonatomic) UILabel *contentLabel;
@end

@implementation TDFSKDisplayedTextCell
- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.tdf_showBottomLine = NO;
    
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kTDFSKDisplayedTextCommonMargin));
        make.top.equalTo(self.contentView).offset(kTDFSKDisplayedTextCommonMargin);
        make.right.equalTo(self.contentView).offset(-(kTDFSKDisplayedTextCommonMargin));
    }];
}

- (void)configCellWithItem:(TDFSKDisplayedTextItem *)item {
    self.contentView.hidden = !item.shouldShow;
    if (!item.shouldShow) return;

    self.tdf_showBottomLine = item.showSplitLine;
    [self tdf_updateSeperatorWithItem:item];
    
    self.contentLabel.font = item.font;
    self.contentLabel.textColor = item.textColor;
    if (item.attributedTitle) {
        [self.contentLabel setAttributedText:item.attributedTitle];
    }else{
        self.contentLabel.text = item.text;
    }
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(item.topMargin);
        make.right.equalTo(self.contentView).offset(-item.rightMargin);
        make.left.equalTo(self.contentView).offset(item.leftMargin);
    }];
    self.contentLabel.textAlignment = item.textAlignment;
    
    if(item.backgroundColor) {
        self.contentView.backgroundColor = item.backgroundColor;
    }
    if (item.isNeedResetLeftMargin) {
        [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(item.leftMargin);
        }];
    }
}

+ (CGFloat)heightForCellWithItem:(TDFSKDisplayedTextItem *)item {
    return item.shouldShow ? [item.text tdf_heightForFont:item.font width:[UIScreen mainScreen].bounds.size.width - item.leftMargin - item.rightMargin] + item.topMargin + item.bottomMargin : 0;
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
    }
    
    return _contentLabel;
}
@end
