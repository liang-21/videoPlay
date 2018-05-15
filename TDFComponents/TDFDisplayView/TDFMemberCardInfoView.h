//
//  TDFMemberCardInfoView.h
//  Pods
//
//  Created by 黄河 on 2017/3/10.
//
//

#import <UIKit/UIKit.h>
#import "TDFMemberCardInfoItem.h"
@interface TDFMemberCardInfoDataLabelView : UIView

@property (nonatomic, strong)NSDictionary *dataDictionary;

@end

@interface TDFMemberCardInfoDataView : UIView

@property (nonatomic, strong)NSArray *dataArray;

@end





@interface TDFMemberCardInfoView : UIView

- (void)configureViewWithModel:(TDFMemberCardInfoItem *)model;

@end
