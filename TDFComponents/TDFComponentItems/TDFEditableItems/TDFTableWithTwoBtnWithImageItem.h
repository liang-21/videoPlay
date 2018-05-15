//
//  TDFTableWithTwoBtnWithImageItem.h
//  TDFComponents
//
//  Created by 刘红琳 on 2017/11/15.
//

#import "DHTTableViewItem.h"
typedef NS_ENUM(NSInteger, TDFTableWithTwoBtnWithImageStyle) {
    /*
     标题 .......  按钮  按钮
    */
    TDFTableWithTwoBtnWithImageStyleDefault,
    /*
     标题
                  按钮  按钮
     副标题
    */
    DFTableWithTwoBtnWithImageStyleSubtitle,
    
    /*
         标题
    图片          按钮  按钮
         副标题
     */
    DFTableWithTwoBtnWithImageStyleSubtitleWithIcon,
    /*
     图片 标题         按钮  按钮
     */
    DFTableWithTwoBtnWithImageStyleDefaultWithIcon,
};

//有两个带图片右侧按钮的cell
@interface TDFTableWithTwoBtnWithImageItem : DHTTableViewItem

@property (assign, nonatomic) TDFTableWithTwoBtnWithImageStyle cellStyle;

@property (nonatomic, copy) NSString *title;

@property (nonatomic,copy) NSMutableAttributedString *titleAttributedString;

@property (nonatomic, strong) NSString *iconURL;

@property (nonatomic, strong) NSString *subTitle;

@property (nonatomic, strong) UIImage *iconImage;

/*
 右侧按钮图片
 */
@property (nonatomic, copy) UIImage *rightImage;

/*
 最最右侧按钮图片
 */
@property (nonatomic, copy) UIImage *nextRightImage;

@property (nonatomic, strong) void (^rightBlock)(void);
@property (nonatomic, strong) void (^nextRightBlock)(void);

@property (assign, nonatomic) BOOL isLastItem; //标记是否是最后一个cell
@end
