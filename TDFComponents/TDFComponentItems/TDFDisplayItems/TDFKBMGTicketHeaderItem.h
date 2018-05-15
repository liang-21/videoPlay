//
//  TDFKBMGTicketHeaderItem.h
//  TDFComponents
//
//  Created by 黄河 on 2017/12/27.
//

#import "DHTTableViewItem.h"

@interface TDFKBMGTicketHeaderItem : DHTTableViewItem

@property (nonatomic, strong)NSString *headerUrl;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *desc;
@property (nonatomic, assign)BOOL showBottomLine;
@end
