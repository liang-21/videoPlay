//
//  TDFCustomerButtonItem.h
//  TDFMemberPod
//
//  Created by 黄河 on 2017/10/30.
//  Copyright © 2017年 黄河. All rights reserved.
//

#import "DHTTableViewItem.h"

@interface TDFCustomerButtonItem : DHTTableViewItem

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *font;

@property (nonatomic, assign) UIEdgeInsets instents;

@property (nonatomic, assign) CGFloat cornerRadius;

@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;

@property (strong, nonatomic) void (^tappedBlock)(void);



@end
