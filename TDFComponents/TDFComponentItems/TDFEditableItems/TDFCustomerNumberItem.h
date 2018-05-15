//
//  TDFCustomerNumberItem.h
//  Pods
//
//  Created by iOS香肠 on 2017/2/21.
//
//


#import "DHTTableViewItem.h"
@interface TDFCustomerNumberItem : DHTTableViewItem
@property (nonatomic, assign) BOOL isShowIco; // 是否显示箭头
@property (nonatomic, strong) NSString *textValue; // 标题
@property (nonatomic ,strong) NSString *textDetailValue;// 详细的内容
@property (nonatomic ,strong) NSMutableAttributedString *attributedText;//富文本
@property (nonatomic ,strong) id  sourceData;
@property (nonatomic, strong) BOOL (^filterBlock)(id  data);
@end
