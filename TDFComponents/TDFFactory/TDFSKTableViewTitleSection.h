//
//  TDFTableViewTitleSection.h
//  TDFDoubleTwelveActivityModule
//
//  Created by tripleCC on 2017/11/6.
//

#import "DHTTableViewSection.h"

typedef NS_ENUM(NSInteger, TDFSKTableViewTitleSectionType){
    TDFSKTableViewTitleSectionTypeNormal,
    TDFSKTableViewTitleSectionTypeTopMargin,
    TDFSKTableViewTitleSectionTypeTopMarginAndGray,
};

@interface TDFSKTableViewTitleSection : DHTTableViewSection
+ (instancetype)sectionWithTitle:(NSString *)title;
+ (instancetype)sectionWithTitle:(NSString *)title type:(TDFSKTableViewTitleSectionType)type;
@property (strong, nonatomic) NSString *title;
- (void)updateOldLayout;
@end
