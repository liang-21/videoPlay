//
//  TDFImageBaseCell.h
//  RestApp
//
//  Created by 小龙虾 on 2017/7/17.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHTTableViewCellProtocol.h"
@class TDFCardBgImageBaseItem;

@interface TDFImageBaseView : UIView
-(instancetype)initWithModel:(TDFCardBgImageBaseItem *)item;
@property (nonatomic, strong) void(^btnBlock)(NSInteger btnType,NSInteger idx);
@end
