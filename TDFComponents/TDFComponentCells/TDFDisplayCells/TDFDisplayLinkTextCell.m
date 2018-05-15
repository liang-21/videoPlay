//
//  TDFDisplayLinkTextCell.m
//  TDFElectronicWalletModule
//
//  Created by chaiweiwei on 2017/11/29.
//

#import "TDFDisplayLinkTextCell.h"
#import <Masonry/Masonry.h>
#import <TDFCategories/TDFCategories.h>
#import "TDFDisplayLinkTextItem.h"
#import "TTTAttributedLabel.h"
#import "UIColor+tdf_standard.h"
#import "TDFSKDisplayedTextItem.h"

@interface TDFDisplayLinkTextCell()<TTTAttributedLabelDelegate>

@property (strong, nonatomic) TDFDisplayLinkTextItem *textItem;
@property (strong, nonatomic) TTTAttributedLabel *contentLabel;
@property (strong, nonatomic) UIView *seperatorLineView;

@end

@implementation TDFDisplayLinkTextCell

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.seperatorLineView];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kTDFSKDisplayedTextCommonMargin));
        make.top.equalTo(self.contentView).offset(kTDFSKDisplayedTextCommonMargin);
        make.right.equalTo(self.contentView).offset(-(kTDFSKDisplayedTextCommonMargin));
    }];
    [self.seperatorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.equalTo(@1);
        make.bottom.equalTo(self.contentView);
    }];
}

- (void)configCellWithItem:(TDFDisplayLinkTextItem *)item {
    self.textItem = item;
    self.contentView.hidden = !item.shouldShow;
    if (!item.shouldShow) return;
    
    self.seperatorLineView.hidden = !item.showSplitLine;
    self.contentLabel.font = item.font;
    self.contentLabel.textColor = item.textColor;
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(item.topMargin);
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
    //link
    [self.contentLabel setText:item.text];
    if(item.linkText.length > 0 && [item.text containsString:item.linkText]) {
        NSRange range = [self.contentLabel.text rangeOfString:item.linkText];
        [self.contentLabel addLinkToTransitInformation:@{@"select":item.linkText} withRange:range];
    }
}

+ (CGFloat)heightForCellWithItem:(TDFDisplayLinkTextItem *)item {
    return item.shouldShow ? [item.text tdf_heightForFont:item.font width:[UIScreen mainScreen].bounds.size.width - 2 * kTDFSKDisplayedTextCommonMargin] + item.topMargin + item.bottomMargin : 0;
}

- (TTTAttributedLabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _contentLabel.numberOfLines = 0;
        _contentLabel.delegate = self;
        _contentLabel.enabledTextCheckingTypes = NO;
        
        _contentLabel.activeLinkAttributes = @{NSForegroundColorAttributeName:[UIColor tdf_hex_0088FF]};
        _contentLabel.linkAttributes = @{(NSString *)kCTUnderlineStyleAttributeName:[NSNumber numberWithBool:YES],NSForegroundColorAttributeName:[UIColor tdf_hex_0088FF]};
    }
    
    return _contentLabel;
}

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithTransitInformation:(NSDictionary *)components {
    !self.textItem.linkActionCallback?:self.textItem.linkActionCallback();
}

- (UIView *)seperatorLineView {
    if (!_seperatorLineView) {
        _seperatorLineView = [[UIView alloc] init];
        _seperatorLineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    
    return _seperatorLineView;
}
@end

