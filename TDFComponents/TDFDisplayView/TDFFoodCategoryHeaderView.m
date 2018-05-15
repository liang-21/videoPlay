//
//  TDFFoodCategoryHeaderView.m
//  Pods
//
//  Created by happyo on 2016/11/28.
//
//

#import "TDFFoodCategoryHeaderView.h"
#import "Masonry.h"

static CGFloat kHeaderViewHeight = 45;

@implementation TDFFoodCategoryHeaderView

- (instancetype)initWithFoodCategoryName:(NSString *)foodCategoryName
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    self = [super initWithFrame:CGRectMake(0, 0, screenWidth, kHeaderViewHeight)];
    
    if (self) {
        //
        UILabel *lblName = [[UILabel alloc] initWithFrame:CGRectZero];
        
        lblName.font = [UIFont systemFontOfSize:15];
        lblName.textColor = [UIColor redColor];
        
        [self addSubview:lblName];
        [lblName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.trailing.equalTo(self);
            make.height.equalTo(@(18));
            make.centerY.equalTo(self);
        }];
        
        lblName.text = foodCategoryName;
    }
    
    return self;
}

+ (CGFloat)heightForHeaderView
{
    return kHeaderViewHeight;
}

@end
