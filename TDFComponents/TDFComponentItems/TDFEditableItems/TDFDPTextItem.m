//
//  TDFDPSwitchItem.m
//  Pods
//
//  Created by happyo on 2018/3/27.
//

#import "TDFDPTextItem.h"

@interface TDFDPTextItem ()

@property (nonatomic, assign) BOOL isFirstLoad; // 动态页面保证 item 只会在接口请求完创建一次

@end
@implementation TDFDPTextItem

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.isFirstLoad = YES;
        _shouldShow = YES;
        _editable = YES;
        _keyboardType = 1;
    }
    
    return self;
}

#pragma mark -- Getters && Setters --

- (void)setText:(NSString *)text
{
    if (self.isFirstLoad) {
        _preText = text;
        self.isFirstLoad = NO;
    }
    
    _text = text;
}

- (BOOL)isShowTip {
    
    return !((self.text.length == 0 && self.preText.length == 0) || [self.text isEqualToString:self.preText]);
}

@end
