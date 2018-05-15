//
//  TDFMemberInfoCardGroupView.h
//  TDFMemberPod
//
//  Created by 黄河 on 2017/4/25.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDFMemberInfoCardItem.h"

@interface TDFMemberInfoCardDataLabelView : UIView

@property (nonatomic, strong)NSDictionary *dataDictionary;

@property (nonatomic, strong)NSString *style;

@end

@interface TDFMemberInfoCardDataView : UIView

@property (nonatomic, strong)NSArray *dataArray;

@property (nonatomic, strong)NSString *style;

@end

@interface TDFMemberInfoCardShadowView : UIView

@property (nonatomic, copy)void(^buttonClick)(BOOL isNodata);

@property (nonatomic, strong)NSString *cardName;

@end

@interface TDFMemberInfoCardView : UIView

@property (nonatomic, copy)void(^buttonClick)(BOOL isNodata);

@property (nonatomic, strong)TDFMemberInfoSubCardItem *item;

@end

@interface TDFMemberInfoCardGroupView : UIView

- (void)configWithItem:(TDFMemberInfoCardItem *)item;

@end
