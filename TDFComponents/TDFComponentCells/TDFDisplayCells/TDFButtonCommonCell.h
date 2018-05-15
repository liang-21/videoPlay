//
//  TDFButtonCommonCell.h
//  Pods
//
//  Created by chaiweiwei on 2017/6/3.
//
//

#import <UIKit/UIKit.h>
#import <TDFComponents/DHTTableViewCellProtocol.h>
#import "Masonry.h"
@interface TDFButtonCommonCell : UITableViewCell<DHTTableViewCellDelegate>
@property (strong,nonatomic) UIButton *button;
@end
