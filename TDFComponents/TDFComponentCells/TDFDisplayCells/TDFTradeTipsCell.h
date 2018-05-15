//
//  TDFTradeTipsCell.h
//
//  Created by doubanjiang on 2017/11/20.
//

#import <UIKit/UIKit.h>
#import <TDFComponents/TDFComponents.h>

@class TDFTradeTipsItem;

@interface TDFTradeTipsCell : UITableViewCell<DHTTableViewCellDelegate>

+ (CGFloat)heightForCellWithItem:(TDFTradeTipsItem *)item;

@end
