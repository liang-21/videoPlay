//
//  TDFMenuListItem.h
//  Pods
//
//  Created by tripleCC on 2017/6/26.
//
//

#import "DHTTableViewItem.h"

typedef NS_ENUM(NSInteger, TDFMenuFunctionStatus) {
    TDFMenuFunctionStatusNone,
    TDFMenuFunctionStatusAvailable = 1,
    TDFMenuFunctionStatusWillCome = 2,
};

@interface TDFMenuListItem : DHTTableViewItem
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detail;
@property (strong, nonatomic) NSString *imageURL;

@property (assign, nonatomic) TDFMenuFunctionStatus status;
@property (strong, nonatomic, readonly) UIImage *statusImage;

@property (strong, nonatomic) UIFont *titleFont;
@property (strong, nonatomic) UIFont *detailFont;

+ (instancetype)itemWithTitle:(NSString *)title detail:(NSString *)detail imageURL:(NSString *)imageURL;
@end
