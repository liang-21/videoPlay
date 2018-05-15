//
//  TDFOfficialAccountItem.h
//  Pods
//
//  Created by 黄河 on 2017/7/17.
//
//

#import "DHTTableViewItem.h"

@interface TDFOfficialAccountItem : DHTTableViewItem

@property (nonatomic, strong)NSString   *headerImageUrl;

@property (nonatomic, strong)NSString   *officialAccountName;

@property (nonatomic, strong)NSString   *officialAccountId;

@property (nonatomic, assign)long       shopNameCount;

@property (nonatomic, assign)BOOL       isSelect;

@end
