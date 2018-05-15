//
//  TDFTextfieldWithBtnCell.m
//  TDFComponents
//
//  Created by zishu on 2018/3/2.
//

#import "TDFTextfieldWithBtnCell.h"
#import "TDFTextfieldWithBtnItem.h"
#import "TDFTextFieldWithBtnView.h"

@interface TDFTextfieldWithBtnCell () <UITextFieldDelegate>

@property (nonatomic, strong) TDFTextFieldWithBtnView *textView;
@property (nonatomic, strong) TDFTextfieldWithBtnItem *cellItem;

@end
@implementation TDFTextfieldWithBtnCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)configCellWithItem:(TDFTextfieldWithBtnItem *)item
{
    [super configCellWithItem:item];
    self.cellItem = item;
}

- (TDFTextFieldWithBtnView *)textView
{
    if (!_textView) {
        _textView = [[TDFTextFieldWithBtnView alloc] initWithFrame:CGRectZero];
    }
    
    return _textView;
}

@end
