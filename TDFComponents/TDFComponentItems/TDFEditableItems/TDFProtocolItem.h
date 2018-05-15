//
//  TDFProtocolItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/14.
//
//

#import "DHTTableViewItem.h"
#import "TDFBaseEditItem.h"

@interface TDFProtocolButtonItem : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *value;

@property (nonatomic, copy) void (^didProtocalLinkCallBlock)(void);

@end

typedef NS_ENUM(NSInteger, TDFLineStyle) {
    TDFMultiLine,
    TDFSingleLine,
}; //协议是单行还是多行（单行title传富文本,不用装TDFProtocolButtonItem）

@interface TDFProtocolItem : DHTTableViewItem<TDFEditCommonPropertyProtocol>
@property (nonatomic ,strong) NSMutableAttributedString *attributedText;//富文本
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign,getter=isSeleted) BOOL seleted;
@property (nonatomic,assign) CGFloat alpha;
@property (nonatomic,copy) NSArray<TDFProtocolButtonItem *> *protocolButtons;
@property (nonatomic, assign) TDFLineStyle lineStyle;
@property (nonatomic, strong) id preValue;

@property (nonatomic, copy) void (^didSelectProtocalBlock)(BOOL isSelected);

//单行的时候执行
@property (nonatomic, copy) void (^selectProtocalLinkCallBlock)(void);

@end
