//
//  TDFIntergalListItem.h
//  TDFMemberPod
//
//  Created by 黄河 on 2017/10/30.
//

#import "DHTTableViewItem.h"

@interface TDFIntergalListItem : DHTTableViewItem

@property (nonatomic, strong) NSString *imageUrlStr;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *detail;

@property (nonatomic, assign) CGFloat height;

@end
