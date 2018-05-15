//
//  TDFMessageCountAndBuyButtonView.h
//  Pods
//
//  Created by 黄河 on 2017/2/24.
//
//

#import <UIKit/UIKit.h>

@interface TDFMessageCountAndBuyButtonView : UIView

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *buttonTitle;

@property (nonatomic, strong) UIColor *buttonColor;

@property (nonatomic, strong) NSString *lbldomesticTitle;

@property (nonatomic, strong) NSString *lbloverseasTitle;

@property (nonatomic, copy)void(^buttonClick)();


@end
