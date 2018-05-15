//
//  TDFCustomNormalSectionItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/27.
//
//

#import <Foundation/Foundation.h>

@interface TDFCustomNormalSectionItem : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSMutableAttributedString *titleAttributedString;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) UIColor *subtitleColor;

@property (nonatomic,copy) void (^callBack)(void);

@end
