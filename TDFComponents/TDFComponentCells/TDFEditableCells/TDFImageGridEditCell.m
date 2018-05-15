//
//  TDFImageGridEditCell.m
//  TDFComponents
//
//  Created by chaiweiwei on 2018/2/23.
//

#import "TDFImageGridEditCell.h"
#import "TDFImageGridEditItem.h"
#import "Masonry.h"
#import "UIColor+tdf_standard.h"
#import "UIImageView+WebCache.h"
#import "TDFImageSourceManager.h"
#import "UIViewController+TopViewController.h"

@interface TDFImageGridItemView : UIView

@property (nonatomic,strong) UIButton *delButton;
@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,copy) void (^delActionCallBlock)(void);

@end

@implementation TDFImageGridItemView

- (instancetype)init {
    if(self = [super init]) {
        [self addSubview:self.imageView];
        [self addSubview:self.delButton];
        [self.delButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(20);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.mas_top).with.offset(10);
        }];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)delButtonAction {
    !self.delActionCallBlock?:self.delActionCallBlock();
}

- (UIButton *)delButton {
    if(!_delButton) {
        _delButton = [[UIButton alloc] init];
        [_delButton setBackgroundImage:[UIImage imageNamed:@"icon_image_del_full"] forState:UIControlStateNormal];
        [_delButton addTarget:self action:@selector(delButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _delButton;
}

- (UIImageView *)imageView {
    if(!_imageView){
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

@end

#define LINE_NUM 3

@interface TDFImageGridEditCell()

@property (nonatomic,strong) UIView *imageEditView;
@property (nonatomic,strong) UIButton *addButton;
@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic,strong) UILabel *pageLabel;
@property (nonatomic,strong) TDFImageGridEditItem *itemModel;

@property (strong, nonatomic) TDFImageSourceManager *imageSourceManager;

@end

@implementation TDFImageGridEditCell

- (void)cellDidLoad {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.imageEditView];
    [self addSubview:self.pageLabel];
    [self addSubview:self.detailLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.pageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-15);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(40);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        make.right.equalTo(self.pageLabel.mas_left);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFImageGridEditItem *)item {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat addButtonWidth = (width-30-20)/3.0;
    
    NSInteger count = item.imageItems.count;
    if((item.imageItems.count < item.maxNum) && item.canEdit) {
        count ++;
    }
    NSInteger numRow = (count-1)/3+1;
    CGFloat space = 10;
    
    CGSize size = [item.detail boundingRectWithSize:CGSizeMake(width-15-40-15, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil].size;
    return numRow*addButtonWidth + space*(numRow-1) + 15 + 10 + 10 + size.height;
}

- (void)configCellWithItem:(TDFImageGridEditItem *)item {
    
    self.itemModel = item;
    
    self.imageSourceManager = item.imageSourceManager;
    
    [self.imageEditView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat addButtonWidth = (width-30-20)/3.0;
    
    NSInteger count = item.imageItems.count;
    if((item.imageItems.count < item.maxNum) && item.canEdit) {
        count ++;
    }
    NSInteger numRow = (count-1)/3+1;
    CGFloat space = 10;
    self.imageEditView.frame = CGRectMake(15, 15, width-30, numRow*addButtonWidth + space*(numRow-1));

    for (NSInteger idx = 0; idx < count; idx++) {
        CGRect rect = CGRectMake((addButtonWidth+space)*(idx%LINE_NUM),(addButtonWidth + space)*(idx/LINE_NUM), addButtonWidth, addButtonWidth);
        if(idx == item.imageItems.count) {
            [self.imageEditView addSubview:self.addButton];
            self.addButton.frame = rect;
        }else {
            TDFImageGridItemView *itemView = [[TDFImageGridItemView alloc] init];
            itemView.delButton.hidden = !item.canEdit;
            itemView.delActionCallBlock = ^{
                [self delImageAreaAction:idx];
            };
            [itemView.imageView sd_setImageWithURL:[NSURL URLWithString:[self imageUrlForItem:item.imageItems[idx]]]];
            itemView.frame = rect;
            [self.imageEditView addSubview:itemView];
        }
    }
    
    self.detailLabel.text = item.detail;
    self.pageLabel.text = [NSString stringWithFormat:@"%lu/%li",(unsigned long)item.imageItems.count,(long)item.maxNum];
}

- (void)addImageAreaAction {
    
    [self.imageSourceManager pickAndUploadSourceThroughNewApiWithModule:nil completeHandler:^(NSString *path) {
        NSMutableArray *temp = [self.itemModel.imageItems mutableCopy];
        if(!temp) {
            temp = [NSMutableArray array];
        }
        [temp addObject:path];
        self.itemModel.imageItems = [temp copy];
        
        if(self.itemModel.imageItems.count/LINE_NUM != (self.itemModel.imageItems.count-1)/LINE_NUM) {
            !self.itemModel.needRefershHeightCallBlock?:self.itemModel.needRefershHeightCallBlock();
        }
        
        !self.itemModel.imageChangeCallBlock?:self.itemModel.imageChangeCallBlock([self.itemModel.imageItems componentsJoinedByString:@","]);
        [self configCellWithItem:self.itemModel];
    }];
}

- (void)delImageAreaAction:(NSInteger)idx {
    NSMutableArray *temp = [self.itemModel.imageItems mutableCopy];
    [temp removeObjectAtIndex:idx];
    self.itemModel.imageItems = [temp copy];
    
    if(self.itemModel.imageItems.count/LINE_NUM != (self.itemModel.imageItems.count+1)/LINE_NUM) {
        !self.itemModel.needRefershHeightCallBlock?:self.itemModel.needRefershHeightCallBlock();
    }
    
    !self.itemModel.imageChangeCallBlock?:self.itemModel.imageChangeCallBlock([self.itemModel.imageItems componentsJoinedByString:@","]);
    [self configCellWithItem:self.itemModel];
}


- (NSString *)imageUrlForItem:(id)item {
    if ([item isKindOfClass:[NSString class]]) {
        return item;
    } else if ([item conformsToProtocol:@protocol(TDFNamableProtocol)] &&
               [item respondsToSelector:@selector(name)]) {
        return [item name];
    }
    return @"";
}

- (UIView *)imageEditView {
    if(!_imageEditView) {
        _imageEditView = [[UIView alloc] init];
    }
    return _imageEditView;
}

- (UIButton *)addButton {
    if(!_addButton) {
        _addButton = [[UIButton alloc] init];
        [_addButton setBackgroundImage:[UIImage imageNamed:@"icon_image_add_full"] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(addImageAreaAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}

- (UILabel *)detailLabel {
    if(!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = [UIColor tdf_hex_999999];
        _detailLabel.font = [UIFont systemFontOfSize:11];
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}

- (UILabel *)pageLabel {
    if(!_pageLabel) {
        _pageLabel = [[UILabel alloc] init];
        _pageLabel.textColor = [UIColor tdf_hex_999999];
        _pageLabel.font = [UIFont systemFontOfSize:11];
        _pageLabel.textAlignment = NSTextAlignmentRight;
    }
    return _pageLabel;
}
@end
