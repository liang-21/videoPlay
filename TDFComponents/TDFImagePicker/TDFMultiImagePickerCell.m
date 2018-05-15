//
//  TDFMultiImagePickerCell.m
//  Pods
//
//  Created by Octree on 31/8/17.
//
//

#import "TDFMultiImagePickerCell.h"
#import "TDFStaticLabelView.h"
#import "TDFMultiImagePickerItem.h"
#import "TDFImagePickerView.h"
#import "TDFStaticLabelItem.h"
#import <TDFCore/TDFCore.h>
#import <TDFCategories/TDFCategories.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "Masonry.h"

static const CGFloat kTDFImagePickerViewHeight = 233;
static const CGFloat kTDFImagePickerViewMargin = 10;

static TDFStaticLabelItem *kTDFStaticLabelItemFromImagePickerItem(TDFMultiImagePickerItem *item) {

    TDFStaticLabelItem *labelItem = [[TDFStaticLabelItem alloc] init];
    labelItem.title = item.title;
    labelItem.detail = item.detail;
    labelItem.attributedDetail = item.attributedDetail;
    labelItem.editStyle = item.editStyle;
    labelItem.isRequired = item.isRequired;
    labelItem.seperationStyle = TDFSeperationStyleCombined;
    
    if (item.editStyle == TDFEditStyleEditable && [item.requestValue count] == 0) {
        labelItem.textValue = item.isRequired ? @"必填" : @"可选";
    }
    
    return labelItem;
};

@interface TDFMultiImagePickerCell ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

/**
 标题
 */
@property (strong, nonatomic) TDFStaticLabelView *titleView;

/**
 picker container
 */
@property (strong, nonatomic) UIStackView *imagePickerContainer;

@property (strong, nonatomic) TDFMultiImagePickerItem *item;

@property (strong, nonatomic) UIView *sepLine;

@end

@implementation TDFMultiImagePickerCell


#pragma mark - Life Cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self configViews];
    }
    return self;
}

#pragma mark - Method

- (void)configViews {

    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.equalTo(@44);
    }];
    
    [self addSubview:self.imagePickerContainer];
    [self.imagePickerContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self.titleView.mas_bottom);
        make.bottom.equalTo(self).with.offset(-10);
    }];
    
    [self addSubview:self.sepLine];
    [self.sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self);
        make.height.equalTo(@1);
    }];
}

- (TDFImagePickerView *)generatePickerViewWithURLString:(NSString *)string index:(NSInteger)index {

    NSURL *url = string ? [NSURL URLWithString:string] : nil;
    TDFImagePickerView *pickerView = [[TDFImagePickerView alloc] init];
    pickerView.alwaysHideDeleteButton = self.item.editStyle == TDFEditStyleUnEditable;
    pickerView.imageURL = url;
    pickerView.title = self.item.buttonTitle;
    pickerView.prompt = self.item.prompt;
    pickerView.warning = self.item.warning;
    pickerView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    pickerView.layer.masksToBounds = YES;
    pickerView.layer.cornerRadius = 2;
    
    if (self.item.editStyle == TDFEditStyleEditable) {
        
        @weakify(self);
        pickerView.deleteBlock = ^{
            @strongify(self);
            [self removeButtonTappedAtIndex:index];
        };
        
        pickerView.selectBlock = ^{
            @strongify(self);
            [self addButtonTapped];
        };
    }
    
    return pickerView;
}

- (void)removeAllImagePicker {

    [self.imagePickerContainer.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)updateImagePickers {

    [self removeAllImagePicker];
    NSInteger index = 0;
    for (NSString *text in self.item.requestValue) {
        
        [self.imagePickerContainer addArrangedSubview:[self generatePickerViewWithURLString:text index:index]];
        index++;
    }
    
    if ([self.item.requestValue count] < self.item.limitation
        && self.item.editStyle == TDFEditStyleEditable) {
        [self.imagePickerContainer addArrangedSubview:[self generatePickerViewWithURLString:nil index:index]];
    }
}

#pragma mark - Override

- (void)prepareForReuse {

    [super prepareForReuse];
    self.item = nil;
    [self removeAllImagePicker];
}

#pragma mark - Action

- (void)removeButtonTappedAtIndex:(NSInteger)index {

    NSMutableArray *array = [NSMutableArray arrayWithArray:self.item.requestValue];
    [array removeObjectAtIndex:index];
    self.item.requestValue = array;
    !self.item.didDelete ?: self.item.didDelete(index);
}


- (void)addButtonTapped {
    
    if (self.item.sourceType & TDFImagePickerSourceTypeLibrary && self.item.sourceType & TDFImagePickerSourceTypeCamera) {
        [self selectImageSource];
    } else if (self.item.sourceType & TDFImagePickerSourceTypeLibrary) {
    
        [self pickImageWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    } else if (self.item.sourceType & TDFImagePickerSourceTypeCamera) {
    
        [self pickImageWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }
}

- (void)selectImageSource {
    
    UIAlertController *avc = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"请选择图片来源", nil) message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [avc addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:nil]];
    @weakify(self);
    [avc addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"图库", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        @strongify(self);
        [self pickImageWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }]];
    
    [avc addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"拍照", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        @strongify(self);
        [self pickImageWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:avc animated:YES completion:nil];
}

- (void)pickImageWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    
    UIImagePickerController *pvc = [[UIImagePickerController alloc] init];
    pvc.mediaTypes = @[(NSString*)kUTTypeImage];
    pvc.sourceType = sourceType;
    pvc.delegate = self;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:pvc animated:YES completion:nil];
}



#pragma mark - Helper

- (CGFloat)titleViewHeight {

    return self.item.hideHeader ? 0 : [TDFStaticLabelView getHeightWithModel:kTDFStaticLabelItemFromImagePickerItem(self.item)] - 5;
}

#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    @weakify(self);
    [self.item.uploader uploadImage:[image tdf_upOrientation] withCallback:^(NSString *url) {
        @strongify(self);
        if (url) {
        
            NSMutableArray *array = [NSMutableArray arrayWithArray:self.item.requestValue];
            [array addObject:url];
            self.item.requestValue = array;
            !self.item.didAdd ?: self.item.didAdd(url);
        }
    }];
}


#pragma mark - DHTTableViewCellDelegate

- (void)cellDidLoad {

    
}

+ (CGFloat)heightForCellWithItem:(TDFMultiImagePickerItem *)item {

    if (!item.shouldShow) {
        return 0;
    }
    
    CGFloat height = item.hideHeader ? 0 : [TDFStaticLabelView getHeightWithModel:kTDFStaticLabelItemFromImagePickerItem(item)] - 5;
    BOOL flag = [item.requestValue count] < item.limitation && item.editStyle == TDFEditStyleEditable;
    NSUInteger count = [item.requestValue count] + (flag ? 1 : 0);
    height += count * kTDFImagePickerViewHeight + count * kTDFImagePickerViewMargin;
    
    return height;
}


- (void)configCellWithItem:(TDFMultiImagePickerItem *)item {
    
    self.item = item;
    [self.titleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@([self titleViewHeight]));
    }];
    
    [self.titleView configureViewWithModel:kTDFStaticLabelItemFromImagePickerItem(item)];
    self.hidden = !item.shouldShow;
    self.titleView.hidden = !item.shouldShow || self.item.hideHeader;
    self.imagePickerContainer.hidden = !item.shouldShow;
    self.sepLine.hidden = !item.shouldShow || self.item.seperationStyle == TDFSeperationStyleCombined;
    [self updateImagePickers];
}



#pragma mark - Accessor

- (TDFStaticLabelView *)titleView {

    if (!_titleView) {
        
        _titleView = [[TDFStaticLabelView alloc] init];
    }
    return _titleView;
}

- (UIView *)sepLine {

    if (!_sepLine) {
        
        _sepLine = [[UIView alloc] init];
        _sepLine.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    return _sepLine;
}

- (UIStackView *)imagePickerContainer {

    if (!_imagePickerContainer) {
        
        _imagePickerContainer = [[UIStackView alloc] init];
        _imagePickerContainer.axis = UILayoutConstraintAxisVertical;
        _imagePickerContainer.spacing = kTDFImagePickerViewMargin;
        _imagePickerContainer.distribution = UIStackViewDistributionFillEqually;
        _imagePickerContainer.alignment = UIStackViewAlignmentFill;
        _imagePickerContainer.backgroundColor = [UIColor clearColor];
    }
    return _imagePickerContainer;
}
@end
