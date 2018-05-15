//
//  TDFAgreeComponentCell.m
//  Pods
//
//  Created by 黄河 on 2017/5/27.
//
//

#import "TDFAgreeComponentCell.h"
#import "TDFAgreeComponentItem.h"
#import "UIColor+Hex.h"
#import "Masonry.h"
#import "ReactiveObjC.h"
#import "TDFHyperLinkLabel.h"
#import "TDFCTFrameParserConfig.h"
#import "TDFCTFrameParser.h"
#import "TDFCoreTextData.h"
#import "TDFCoreLinkTextData.h"


@interface TDFAgreeComponentCell ()

@property (strong, nonatomic)TDFAgreeComponentItem *item;

@property (strong, nonatomic)UIButton *selectButton;

@property (strong, nonatomic)TDFHyperLinkLabel *infoLabel;

@property (copy, nonatomic)void(^buttonClickBlock)(BOOL isSelect);

@end

@implementation TDFAgreeComponentCell

#pragma mark - DHTTableViewCellDelegate

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectButton setImage:[UIImage imageNamed:@"ico_uncheck" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    [_selectButton setImage:[UIImage imageNamed:@"ico_check" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateSelected];
    [_selectButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _infoLabel = [[TDFHyperLinkLabel alloc] init];
    _infoLabel.backgroundColor = [UIColor clearColor];
    _infoLabel.clickLinkBlock = ^(TDFCoreLinkTextData *data){
        
    };
    [self addSubview:_selectButton];
    [self addSubview:_infoLabel];
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@18);
        make.width.equalTo(self.selectButton.mas_height);
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectButton.mas_right).offset(7);
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFAgreeComponentItem *)item
{
    return 44;
}

- (void)configCellWithItem:(TDFAgreeComponentItem *)item
{
    self.item = item;
    self.buttonClickBlock = self.item.filterBlock;
    self.infoLabel.clickLinkBlock = self.item.selectProtocol;
    
    @weakify(self);
    [[RACObserve(self.item, isAgree) takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.selectButton.selected = [x boolValue];
    }];
    
    [[RACObserve(self.item, editStyle) takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        TDFEditStyle editStyle = [x integerValue];
        if (editStyle == TDFEditStyleUnEditable) {
            self.selectButton.hidden = YES;
            [self.infoLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(10);
            }];
//            self.userInteractionEnabled = NO;
        }else if (editStyle == TDFEditStyleEditable) {
            self.selectButton.hidden = NO;
            [self.infoLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.selectButton.mas_right).offset(7);
            }];
//            self.userInteractionEnabled = YES;
        }

    }];
    

    [self parserItem:self.item];
    
    

}

- (void)buttonClick:(UIButton *)button {
    button.selected = !button.selected;
    if (self.buttonClickBlock) {
        self.buttonClickBlock(button.selected);
    }
}

- (void)parserItem:(TDFAgreeComponentItem *)item {
    
    NSString * originString = item.content;
    NSString * placeholder  = item.placeholder;
    NSString * replaceString = item.protocol;
    UIColor * color = item.color;
    
    NSString *newString = originString;
    if (placeholder.length > 0) {
        newString = [originString stringByReplacingOccurrencesOfString:placeholder
                                                withString:replaceString];
    }
    if (newString.length == 0) {
        return;
    }
    NSRange range = [newString rangeOfString:replaceString];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:newString];
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor colorWithHeX:0x333333]
                             range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:12]
                             range:NSMakeRange(0, attributedString.length)];
    
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:color
                             range:range];
    [attributedString addAttribute:NSUnderlineStyleAttributeName
                             value:[NSNumber numberWithInteger:NSUnderlineStyleSingle]
                             range:range];
    
    TDFCTFrameParserConfig *config = [[TDFCTFrameParserConfig alloc] init];
    config.width = self.bounds.size.width - 35;
    
    
    TDFCoreTextData *data = [TDFCTFrameParser parseAttributeString:attributedString config:config];
    TDFCoreLinkTextData *line = [[TDFCoreLinkTextData alloc] init];
    line.range = range;
    line.type = item.showType;
    line.title = item.showTitle;
    line.detail = item.showDetail;
    
    data.linkArray = [NSArray arrayWithObject:line];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.infoLabel.data = data;
        [self.infoLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(data.height+5));
        }];
    });
}

@end
