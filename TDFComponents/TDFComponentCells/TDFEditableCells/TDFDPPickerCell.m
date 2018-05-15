//
//  TDFDPPickerCell.m
//  Pods
//
//  Created by happyo on 2018/3/27.
//

#import "TDFDPPickerCell.h"
#import "TDFPickerCell.h"
#import "TDFPickerItem.h"
#import "TDFDPPickerItem.h"
#import "Masonry.h"
#import "ReactiveObjC.h"

@interface TDFDPPickerCell ()

@property (nonatomic, strong) TDFPickerCell *pickerCell;

@property (nonatomic, strong) TDFDPPickerItem *model;

@end
@implementation TDFDPPickerCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.pickerCell];
    
    [self.pickerCell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)configCellWithItem:(TDFDPPickerItem *)item
{
    if (item.shouldShow) {
        self.hidden = NO;
    } else {
        self.hidden = YES;
        return ;
    }
    
    TDFPickerItem *pickerItem = [[TDFPickerItem alloc] init];
    pickerItem.title = item.title;
    pickerItem.detail = item.detail;
    pickerItem.isIconDown = item.iconDown;
    pickerItem.isRequired = item.required;
    pickerItem.shouldShow = item.shouldShow;
    pickerItem.editStyle = item.editable ? TDFEditStyleEditable : TDFEditStyleUnEditable;
    pickerItem.requestValue = item.pickerId;
    pickerItem.textValue = item.pickerText;
    pickerItem.preValue = item.preValue;
    pickerItem.selectedBlock = item.onClick;
    @weakify(item);
    @weakify(pickerItem);
    pickerItem.filterBlock = ^BOOL(NSString *textValue, id requestValue) {
        @strongify(item);
        @strongify(pickerItem);
        item.isShowTip = pickerItem.isShowTip;
        item.pickerText = textValue;
        
        return YES;
    };
    
    [self.pickerCell configCellWithItem:pickerItem];
    item.isShowTip = pickerItem.isShowTip;
}

+ (CGFloat)heightForCellWithItem:(TDFDPPickerItem *)item
{
    CGFloat height = 0;
    
    TDFPickerItem *pickerItem = [[TDFPickerItem alloc] init];
    pickerItem.title = item.title;
    pickerItem.detail = item.detail;
    pickerItem.isIconDown = item.iconDown;
    pickerItem.isRequired = item.required;
    pickerItem.shouldShow = item.shouldShow;
    pickerItem.editStyle = item.editable ? TDFEditStyleEditable : TDFEditStyleUnEditable;
    pickerItem.requestValue = item.pickerId;
    pickerItem.textValue = item.pickerText;
    pickerItem.preValue = item.preValue;
    @weakify(item);
    @weakify(pickerItem);
    pickerItem.filterBlock = ^BOOL(NSString *textValue, id requestValue) {
        @strongify(item);
        @strongify(pickerItem);
        item.isShowTip = pickerItem.isShowTip;
        item.pickerText = textValue;
        
        return YES;
    };
    
    if (item.shouldShow) {
        height = [TDFPickerCell heightForCellWithItem:pickerItem];
    }
    
    return height;
}

#pragma mark -- Getters && Setters --

- (TDFPickerCell *)pickerCell
{
    if (!_pickerCell) {
        _pickerCell = [[TDFPickerCell alloc] init];
        [_pickerCell cellDidLoad];
    }
    
    return _pickerCell;
}


@end
