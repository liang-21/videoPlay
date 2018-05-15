//
//  TDFSKOptionPickerStrategy.m
//  TDFBaseSettingModule
//
//  Created by tripleCC on 3/20/17.
//  Copyright © 2017 tripleCC. All rights reserved.
//
#import <TDFPickerProxy/TDFPickerProxy.h>
#import "TDFSKOptionPickerStrategy.h"

@interface TDFSKOptionPickerStrategy() <TDFOptionPickerProxyDelegate>
@property (strong, nonatomic) TDFOptionPickerProxy *proxy;
@end

@implementation TDFSKOptionPickerStrategy
- (void)invoke {
    self.proxy = [[TDFOptionPickerProxy alloc] initWithTitle:self.pickerName items:self.items selectedIndex:self.selectedIndex];
    self.proxy.delegate = self;
    [self.proxy presentPicker];
}

- (void)pickerProxy:(TDFOptionPickerProxy *)proxy didPickItem:(id)item {
    if ([self.delegate conformsToProtocol:@protocol(TDFPickerStrategyDelegate)]) {
        if ([self.delegate strategyCallbackWithTextValue:[proxy nameForItem:item] requestValue:item]) {
            self.selectedIndex = [self.items indexOfObject:item];
        }
        if (self.afterApplyBlock) {
            self.afterApplyBlock(item);
        }
    }
}
@end
