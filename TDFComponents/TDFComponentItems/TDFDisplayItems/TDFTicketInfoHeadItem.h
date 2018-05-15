//
//  TDFTicketInfoHeadItem.h
//  TDFComponents
//
//  Created by doubanjiang on 2017/12/18.
//

#import "DHTTableViewItem.h"

@interface TDFTicketInfoHeadItem : DHTTableViewItem

@property (nonatomic, copy) NSString *leftTitle;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *detail;

@property (nonatomic, copy) NSString *effect;

@property (nonatomic, assign)int type;
@end
