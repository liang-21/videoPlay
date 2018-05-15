//
//  TDFTicketInfoHeadCell.h
//  TDFComponents
//
//  Created by doubanjiang on 2017/12/18.
//

#import <UIKit/UIKit.h>
#import <TDFComponents/DHTTableViewCellProtocol.h>

@interface TDFTicketInfoHeadCellTagView : UIView

@property (nonatomic, strong)NSString *text;

@end

@interface TDFTicketInfoHeadCell : UITableViewCell<DHTTableViewCellDelegate>

@end
