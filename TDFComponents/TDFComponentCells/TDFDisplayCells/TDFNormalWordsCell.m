//
//  TDFNormalWordsCell.m
//  Pods
//
//  Created by Cloud on 2017/9/4.
//
//

#import "TDFNormalWordsCell.h"
#import "TDFNormalWordsItem.h"
#import <Masonry/Masonry.h>

@interface TDFNormalWordsCell ()

@property (nonatomic ,strong) TDFNormalWordsItem *item;

@property (nonatomic ,strong) UILabel *wordsLabel;

@end

@implementation TDFNormalWordsCell


- (void)cellDidLoad {

    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.wordsLabel];
    
    [self.wordsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.insets(UIEdgeInsetsMake(5, 10, 5, 10));
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFNormalWordsItem *)item {

//    return 44;
    
    CGFloat height = 0;
    
    UILabel *lblHeight = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 20, 0)];
    lblHeight.font = [UIFont systemFontOfSize:11];
    lblHeight.numberOfLines = 0;
    lblHeight.text = item.text;

    [lblHeight sizeToFit];
    
    height += lblHeight.frame.size.height+10;
    
    return height;
}

- (void)configCellWithItem:(TDFNormalWordsItem *)item {

    self.wordsLabel.text = item.text;
    
    if (item.textColor) {
        
        self.wordsLabel.textColor = item.textColor;
    }
}


#pragma mark - Getter 

- (UILabel *)wordsLabel {

    if (!_wordsLabel) {
        
        _wordsLabel = [UILabel new];
        _wordsLabel.font = [UIFont systemFontOfSize:11];
        _wordsLabel.numberOfLines = 0;
        _wordsLabel.textColor = [UIColor colorWithRed:204/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        _wordsLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width-20;
    }
    return _wordsLabel;
}

@end
