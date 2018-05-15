//
//  TDFReviewStatusItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/25.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,TDFReviewStatusType) {
    TDFReviewStatusTypeSuccess,
    TDFReviewStatusTypeFail,
    TDFReviewStatusTypeProcess,
};

typedef NS_ENUM(NSInteger,TDFReviewButtonType) {
    TDFReviewButtonTypeChange,
    TDFReviewButtonTypeCancel
};

@interface TDFReviewButtonItem :NSObject

@property(nonatomic,assign) TDFReviewButtonType buttonType;
@property(nonatomic,copy) NSString *buttonTitle;

@property(nonatomic,copy) void (^buttonClickCallBack)(void);

+ (instancetype)buttonWithTitle:(NSString *)buttonTitle type:(TDFReviewButtonType)buttonType;

@end

@interface TDFReviewStatusItem : NSObject

@property (nonatomic,assign) TDFReviewStatusType type;

@property (nonatomic,copy) NSArray<TDFReviewButtonItem *> *buttonList;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *subtitle;

@property (nonatomic,copy) NSString *extendContent;

@property (nonatomic,copy) UIColor *extendContentColor;

@property (nonatomic,copy) NSString *buttomtitle;

@property (copy,nonatomic) NSString *buttomLinkTitle;

@property (nonatomic,assign) CGFloat backgroundAlpha;

@property (nonatomic,copy) void (^callBack)(void);

@end
