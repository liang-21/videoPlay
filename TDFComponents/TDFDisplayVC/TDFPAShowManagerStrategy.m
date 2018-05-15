//
//  TDFPAShowManagerStrategy.m
//  RestApp
//
//  Created by happyo on 16/8/2.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFPAShowManagerStrategy.h"
#import "TDFOptionPickerController.h"

@interface TDFPAShowManagerStrategy ()
@property (nonatomic,strong) TDFOptionPickerController *pvc ;

@end
@implementation TDFPAShowManagerStrategy

- (id)init

{
    if(self = [super init])
        
    {
        self.shouldShowManagerButton = YES;
    }
    return self;
}

- (void)invoke
{
    [self showManagerPicker];
}

- (void)showManagerPicker
{
//    [OptionPickerBox initData:self.pickerItemList
//                       itemId:self.selectedItem.itemId];
//    [OptionPickerBox showManager:self.pickerName managerName:self.managerName client:self event:0];
    
    TDFOptionPickerController *pvc = [TDFOptionPickerController pickerControllerWithTitle:self.pickerName
                                                                                  options:self.pickerItemList
                                                                            currentItemId:[self.
                                                                                        selectedItem obtainItemId]];

    __weak __typeof(self) wself = self;
    wself.pvc = pvc;
    pvc.competionBlock = ^void(NSInteger index) {
        
        [wself pickOption:self.pickerItemList[index] event:0];
    };
    
    pvc.fontSize = self.fontSize;
    pvc.shouldShowManagerButton = self.shouldShowManagerButton;
    pvc.manageTitle = self.managerName;
    pvc.managerBlock = ^void(){
        
        [wself managerOption:0];
    };
    
    [(UINavigationController *)[[UIApplication sharedApplication].delegate window].rootViewController presentViewController:pvc animated:YES completion:nil];
}

#pragma mark -- OptionPickerClient --

- (BOOL)pickOption:(id)selectObj event:(NSInteger)eventType
{
    NSString *name = [selectObj obtainItemName];
    NSString *value = [selectObj obtainItemId];
    
    if ([self.delegate conformsToProtocol:@protocol(TDFPickerStrategyDelegate)]) {
        if ([self.delegate strategyCallbackWithTextValue:name requestValue:value]) {
            self.selectedItem = selectObj;
        }
    }
    
    return YES;
}

- (void)managerOption:(NSInteger)eventType
{
    if (self.managerClickedBlock) {
        self.managerClickedBlock();
    }
}

@end
