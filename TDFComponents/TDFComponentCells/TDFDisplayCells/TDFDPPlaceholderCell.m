//
//  TDFDPPlaceholderCell.m
//  Pods
//
//  Created by happyo on 2018/3/27.
//

#import "TDFDPPlaceholderCell.h"
#import "TDFDPPlaceholderItem.h"
#import "UIColor+Hex.h"

@interface TDFDPPlaceholderCell ()

@end
@implementation TDFDPPlaceholderCell

#pragma mark -- DHTTableViewCellDelegate --

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
}

+ (CGFloat)heightForCellWithItem:(TDFDPPlaceholderItem *)item {
    
    CGFloat height = item.height;

    return height;
}

- (void)configCellWithItem:(TDFDPPlaceholderItem *)item {
    
    self.backgroundColor = [UIColor colorWithHexString:item.backgroundColor];
}

#pragma mark -- Getters && Setters --


@end
