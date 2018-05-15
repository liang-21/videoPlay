//
//  TDFDPSwitchCell.m
//  Pods
//
//  Created by happyo on 2018/3/27.
//

#import "TDFDPTextCell.h"
#import "TDFDPTextItem.h"
#import "TDFTextfieldCell.h"
#import "TDFTextfieldItem.h"
#import "Masonry.h"
#import "ReactiveObjC.h"

@interface TDFDPTextCell ()

@property (nonatomic, strong) TDFTextfieldCell *textCell;

@property (nonatomic, strong) TDFDPTextItem *model;

@end
@implementation TDFDPTextCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.textCell];
    
    [self.textCell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)configCellWithItem:(TDFDPTextItem *)item
{
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    TDFTextfieldItem *textItem = [[TDFTextfieldItem alloc] init];
    textItem.title = item.title;
    textItem.detail = item.detail;
    textItem.isRequired = item.required;
    textItem.shouldShow = item.shouldShow;
    textItem.editStyle = item.editable ? TDFEditStyleEditable : TDFEditStyleUnEditable;
    textItem.requestValue = item.text;
    textItem.textValue = item.text;
    textItem.preValue = item.preText;
    textItem.keyboardType = item.keyboardType == 1 ? UIKeyboardTypeDefault : UIKeyboardTypeNumberPad;
    @weakify(item);
    @weakify(textItem);
    textItem.filterBlock = ^BOOL(NSString *textValue) {
        @strongify(item);
        @strongify(textItem);
        item.isShowTip = textItem.isShowTip;
        item.text = textValue;
        
        return YES;
    };
    
    [self.textCell configCellWithItem:textItem];
}

+ (CGFloat)heightForCellWithItem:(TDFDPTextItem *)item
{
    CGFloat height = 0;
    
    TDFTextfieldItem *textItem = [[TDFTextfieldItem alloc] init];
    textItem.title = item.title;
    textItem.detail = item.detail;
    textItem.isRequired = item.required;
    textItem.shouldShow = item.shouldShow;
    textItem.editStyle = item.editable ? TDFEditStyleEditable : TDFEditStyleUnEditable;
    textItem.requestValue = item.text;
    textItem.textValue = item.text;
    textItem.preValue = item.preText;
    @weakify(item);
    @weakify(textItem);
    textItem.filterBlock = ^BOOL(NSString *textValue) {
        @strongify(item);
        @strongify(textItem);
        item.isShowTip = textItem.isShowTip;
        item.text = textValue;
        
        return YES;
    };
    
    if (item.shouldShow) {
        height = [TDFTextfieldCell heightForCellWithItem:textItem];
    }
    
    return height;
}

#pragma mark -- Getters && Setters --

- (TDFTextfieldCell *)textCell
{
    if (!_textCell) {
        _textCell = [[TDFTextfieldCell alloc] init];
        [_textCell cellDidLoad];
    }
    
    return _textCell;
}

@end
