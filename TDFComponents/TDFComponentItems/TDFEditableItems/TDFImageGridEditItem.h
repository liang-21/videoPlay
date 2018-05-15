//
//  TDFImageGridEditItem.h
//  TDFComponents
//
//  Created by chaiweiwei on 2018/2/23.
//

#import "DHTTableViewItem.h"
#import "TDFNamableProtocol.h"
#import "TDFImageSourceManager.h"

@interface TDFImageGridEditItem : DHTTableViewItem

@property (nonatomic,copy) NSString *detail;
@property (nonatomic,assign) NSInteger maxNum;
@property (nonatomic,copy) NSString *imageUploadPath;
@property (nonatomic,copy) NSArray *imageItems;

@property (strong, nonatomic) TDFImageSourceManager *imageSourceManager;

@property (nonatomic,assign) BOOL canEdit;

@property (nonatomic,copy) void (^imageChangeCallBlock)(NSString *imageStrings);
@property (nonatomic,copy) void (^needRefershHeightCallBlock)(void);

@end
