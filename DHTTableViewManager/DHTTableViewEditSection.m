//
//  DHTTableViewEditSection.m
//  Pods
//
//  Created by doubanjiang on 2017/9/18.
//
//

#import "DHTTableViewEditSection.h"
#import "TDFEditColorHelper.h"
@interface DHTTableViewEditSection ()

@property (nonatomic ,copy) void (^callBack)();

@property (nonatomic ,strong) UIButton *rightBtn;


@end

@implementation DHTTableViewEditSection

+(instancetype)sectionWithTitleHeader:(NSString *)title
                          andBtnTitle:(NSString *)btnTitle
                          andCallBack:(void(^)())callBack {
    
    DHTTableViewEditSection *sec = [DHTTableViewEditSection new];
    
    sec.callBack = callBack;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 44)];
    sectionView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, screenWidth, 15)];
    lblTitle.font = [UIFont boldSystemFontOfSize:15];
    lblTitle.text = title;
    
    UIView *spliteTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 1)];
    spliteTopView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    UIView *spliteBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, screenWidth, 1)];
    spliteBottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    
    [sec.rightBtn setTitle:btnTitle forState:UIControlStateNormal];
    [sectionView addSubview:lblTitle];
    [sectionView addSubview:sec.rightBtn];
    [sectionView addSubview:spliteTopView];
    [sectionView addSubview:spliteBottomView];
    
    sec.rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [sec.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.offset(-10);
        make.centerY.equalTo(sectionView.mas_centerY);
    }];
    
    sec.headerView = sectionView;
    sec.headerHeight = 44;
    
    return sec;
}

- (void)rightBtnDidClick {

    if (self.callBack) {
        
        self.callBack();
    }
}

- (void)configSectionWithType:(TDFTableSectionStyle )style {

    self.rightBtn.hidden = false;
    
    switch (style) {
        case TDFTableSectionStyleNone:
        {
            self.rightBtn.hidden = true;
        }
            break;
        case TDFTableSectionStyleUnbind:
        {
            [self.rightBtn setTitle:@"解除绑定" forState:UIControlStateNormal];
        }
            break;
        case TDFTableSectionStyleTransfer:
        {
            [self.rightBtn setTitle:@"移交权限" forState:UIControlStateNormal];
        }
            break;
        case TDFTableSectionStyleCallAdmin:
        {
            [self.rightBtn setTitle:@"联系掌柜绑定" forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark Getter & Setter

- (UIButton *)rightBtn {
    
    if (!_rightBtn) {
        
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth - 120, 9, 120, 26)];
        rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [rightBtn setTitleColor:[TDFEditColorHelper hexBlueColor] forState:UIControlStateNormal];
        [rightBtn addTarget:self action:@selector(rightBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn = rightBtn;
    }
    return _rightBtn;
}

- (void)setSectionType:(TDFTableSectionStyle)sectionType {

    _sectionType = sectionType;
    
    [self configSectionWithType:sectionType];
}

//- (void)setEditable:(BOOL)editable {
//    
//    _editable = editable;
//    
//    self.rightBtn.hidden = !editable;
//}

@end
