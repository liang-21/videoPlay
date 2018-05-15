//
//  TDFDPPickerItem.m
//  Pods
//
//  Created by happyo on 2018/3/27.
//

#import "TDFDPPickerItem.h"

@interface TDFDPPickerItem ()

@property (nonatomic, assign) BOOL isFirstLoad; // 动态页面保证 item 只会在接口请求完创建一次

@end
@implementation TDFDPPickerItem

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.isFirstLoad = YES;
        _shouldShow = YES;
        _editable = YES;
    }
    
    return self;
}

#pragma mark -- Getters && Setters --

- (void)setPickerText:(NSString *)pickerText
{
    if (self.isFirstLoad) {
        _preValue = pickerText;
        self.isFirstLoad = NO;
    }
    _pickerText = pickerText;
}


- (BOOL)isShowTip {
    
    return !((self.pickerText.length == 0 && self.preValue.length == 0) || [self.pickerText isEqualToString:self.preValue]);
}
@end
