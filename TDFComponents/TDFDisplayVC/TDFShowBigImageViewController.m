//
//  TDFShowBigImageViewController.m
//  Pods
//
//  Created by chaiweiwei on 2017/7/17.
//
//

#import "TDFShowBigImageViewController.h"
#import "UIViewController+TopViewController.h"
#import <Masonry/Masonry.h>
#import "UIImageView+WebCache.h"
#import "ReactiveObjC.h"
#import "TDFBatchOperation.h"

#define kShowBigImageScrollerInsert 15
#define kShowBigImageViewWidth ([UIScreen mainScreen].bounds.size.width-30)
#define kShowBigImageViewHeight (7.0f*kShowBigImageViewWidth/5.0f)

@implementation TDFShowSmallImageItem

- (instancetype)init {
    if(self = [super init]) {
        self.rightDownTip = @"";
    }
    return self;
}

@end

@interface TDFShowBigImageViewController ()

@property (nonatomic,copy) NSArray <TDFShowSmallImageItem *> *imageItems;

@property (nonatomic,strong) UIView *alphaView;
@property (nonatomic,strong) UIImageView *rightTipLabel;
@property (nonatomic,strong) UIButton *closeButton;

@property (nonatomic,strong) UIScrollView *scrollerView;

@property (nonatomic,assign) NSInteger isFirstShow;

@end

@implementation TDFShowBigImageViewController

#pragma mark - Lift Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.alphaView];
    [self.alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.view addSubview:self.scrollerView];
    
    [self.view addSubview:self.closeButton];
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollerView.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(self.closeButton.imageView.image.size);
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.imageItems enumerateObjectsUsingBlock:^(TDFShowSmallImageItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [self creatrImageViewWithTip:obj.rightDownTip];
        imageView.tag = 1000 + idx;
        
        [self.scrollerView addSubview:imageView];
        
        CGFloat x = kShowBigImageScrollerInsert;
        if(idx != 0) {
            UIImageView *preview = [self.scrollerView viewWithTag:(1000+idx-1)];
            x = CGRectGetMaxX(preview.frame);
            x += kShowBigImageScrollerInsert*2;
        }
        
        imageView.frame = CGRectMake(x, 0, kShowBigImageViewWidth, kShowBigImageViewHeight);
        
        if(obj.imagePath) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:obj.imagePath]];
        }else {
            imageView.image = [UIImage imageNamed:obj.imageName];
        }
    }];
    
    self.scrollerView.contentOffset = CGPointMake(self.self.isFirstShow * [UIScreen mainScreen].bounds.size.width, 0);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGSize size = CGSizeMake(self.imageItems.count*[UIScreen mainScreen].bounds.size.width, kShowBigImageViewHeight);
    
    self.scrollerView.contentSize = size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public Method

+ (instancetype)showBigImageScrollerWindowWithImagePaths:(NSArray<TDFShowSmallImageItem *> *)items firstShowIndex:(NSInteger)index{
    TDFShowBigImageViewController *showBigImageViewController = [[TDFShowBigImageViewController alloc] init];
    showBigImageViewController.imageItems = items;
    showBigImageViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    showBigImageViewController.isFirstShow = index;
    
    return showBigImageViewController;
}

- (void)presentViewController {
    UIViewController *rootViewController = [self tdf_topViewController];
    [rootViewController presentViewController:self animated:NO completion:^{
        
    }];
}

#pragma mark - Ser Get

- (UIView *)alphaView {
    if(!_alphaView) {
        _alphaView = [[UIView alloc] init];
        _alphaView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    }
    return _alphaView;
}

- (UIImageView *)creatrImageViewWithTip:(NSString *)tip {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UILabel *tipLable = [[UILabel alloc] init];
    tipLable.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    tipLable.font = [UIFont systemFontOfSize:13];
    tipLable.textColor = [UIColor whiteColor];
    tipLable.textAlignment = NSTextAlignmentCenter;
    tipLable.text = tip;
    
    CGSize size = [tip sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    [imageView addSubview:tipLable];
    [tipLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(size.width + 10);
        make.right.equalTo(imageView.mas_right).with.offset(-10);
        make.bottom.equalTo(imageView.mas_bottom).with.offset(-10);
    }];
    
    return imageView;
}

- (UIButton *)closeButton {
    if(!_closeButton) {
        _closeButton = [[UIButton alloc] init];
        [_closeButton setImage:[UIImage imageNamed:@"icon_close_white" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
        @weakify(self);
        [[_closeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            [self dismissViewControllerAnimated:NO completion:nil];
        }];
    }
    return _closeButton;
}

- (UIScrollView *)scrollerView {
    if(!_scrollerView) {
        _scrollerView = [[UIScrollView alloc] init];
        _scrollerView.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height-kShowBigImageViewHeight-50)/2.0, [UIScreen mainScreen].bounds.size.width, kShowBigImageViewHeight);
        _scrollerView.pagingEnabled = YES;
    }
    return _scrollerView;
}

@end

