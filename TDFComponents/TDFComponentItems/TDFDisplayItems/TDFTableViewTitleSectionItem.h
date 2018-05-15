//
//  TDFTableViewTitleSectionItem.h
//  TDFComponents
//
//  Created by tripleCC on 2017/12/12.
//

#import "DHTTableViewItem.h"
#import "TDFSectionItemProtocol.h"

typedef NS_ENUM(NSInteger, TDFTableViewTitleSectionItemType){
    TDFTableViewTitleSectionItemTypeNormal,
    TDFTableViewTitleSectionItemTypeTopMargin,
    TDFTableViewTitleSectionItemTypeTopMarginAndGray,
};

@interface TDFTableViewTitleSectionItem : DHTTableViewItem <TDFSectionItemProtocol>
@property (assign, nonatomic) TDFTableViewTitleSectionItemType type;
@property (strong, nonatomic) NSString *title;

@property (assign, nonatomic, getter=isOld) BOOL old;
@property (assign, nonatomic, readonly) CGFloat cellHeight;
@property (strong, nonatomic, readonly) UIColor *titleBackgroundColor;
@end
