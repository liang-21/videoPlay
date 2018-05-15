//
//  TDFTradeTipsItem.h
//
//  Created by doubanjiang on 2017/11/20.
//

#import <TDFComponents/TDFComponents.h>

@interface TDFTradeTipsItem : DHTTableViewItem

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIColor *bgColor;

@end
