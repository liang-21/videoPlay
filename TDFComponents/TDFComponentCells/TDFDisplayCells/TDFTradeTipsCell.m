//
//  TDFTradeTipsCell.m
//
//  Created by doubanjiang on 2017/11/20.
//

#import "TDFTradeTipsCell.h"
#import "TDFTradeTipsItem.h"

#import <TDFComponents/NSString+TDF_Empty.h>


@interface TDFTradeTipsCell ()

@property (nonatomic, strong) UILabel *contentlabel;

@property (nonatomic, strong) TDFTradeTipsItem *item;

@end

@implementation TDFTradeTipsCell

- (void)cellDidLoad {
 
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.contentlabel];
    
    [self.contentlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.top.offset(10);
        make.bottom.offset(-10);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFTradeTipsItem *)item {
    

    if (item.hidden||(![item.content isNotEmpty])) {
        
        return 0;
    }
    
    UILabel *frameLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-20, 0)];
    frameLb.numberOfLines = 0;
    frameLb.font = item.font;
    frameLb.text = item.content;
    [frameLb sizeToFit];
    
    return frameLb.frame.size.height + 20;
}

- (void)configCellWithItem:(TDFTradeTipsItem *)item {
    self.item = item;
    self.contentlabel.font = item.font;
    self.contentlabel.text = item.content;
    self.contentlabel.textColor = item.textColor;
    self.backgroundColor = item.bgColor;
}

- (UILabel *)contentlabel {
    if (!_contentlabel) {
        _contentlabel = [UILabel new];
        _contentlabel.numberOfLines = 0;
    }
    return _contentlabel;
}

@end
