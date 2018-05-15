//
//  DHTTableViewSectionWithFold.m
//  Pods
//
//  Created by 刘红琳 on 2017/6/3.
//
//

#import "DHTTableViewSectionWithFold.h"

#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenHeight  [UIScreen mainScreen].bounds.size.height

@interface DHTTableViewSectionWithFold()


@end
@implementation DHTTableViewSectionWithFold

+ (instancetype)section
{
    DHTTableViewSectionWithFold *section = [[self alloc] init];
    
    return section;
}

- (void)sectionWithTitleHeader:(NSString *)title andIsSelected:(BOOL)isSelected andIsDown:(BOOL)isDown {
    
    self.isDown = isDown;
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 44)];
    sectionView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, screenWidth/2-11, 15)];
    lblTitle.font = [UIFont boldSystemFontOfSize:15];
    lblTitle.text = title;
    
    UILabel *lblSelected = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2, 15, screenWidth/2-32, 15)];
    lblSelected.font = [UIFont boldSystemFontOfSize:13];
    lblSelected.textAlignment = NSTextAlignmentRight;
    
    UIView *spliteTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 1)];
    spliteTopView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    UIView *spliteBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, screenWidth, 1)];
    spliteBottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    [sectionView addSubview:lblTitle];
    if (isSelected) {
        [sectionView addSubview:lblSelected];
        NSString *string = nil;
        
        if (self.isSelectedCount.length==0) {
            string = @"已添选0个权限";
        }else if (self.isSelectedCount.length>0){
            string = [NSString stringWithFormat:@"已添选%@个权限",self.isSelectedCount];
        }
        if (self.isSelectedCount.length) {
            NSMutableAttributedString *mAttStr = [[NSMutableAttributedString alloc] initWithString:string];
            [mAttStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 3)];
            [mAttStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[string rangeOfString:self.isSelectedCount]];
            [mAttStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(self.isSelectedCount.length+3, 3)];
            lblSelected.attributedText = mAttStr;
        }
    }
    [sectionView addSubview:spliteTopView];
    [sectionView addSubview:spliteBottomView];
    
    [sectionView addSubview:self.imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    button.tag = 1000;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sectionView addSubview:button];
    
    self.headerView = sectionView;
    self.headerHeight = 44;    
}

+ (instancetype)sectionWithTitleHeader:(NSString *)title andIsDown:(BOOL)isDown  {
    DHTTableViewSectionWithFold *section = [[self alloc] init];
    section.isDown = isDown;
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 44)];
    sectionView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, screenWidth, 15)];
    lblTitle.font = [UIFont boldSystemFontOfSize:15];
    lblTitle.text = title;
    
    UIView *spliteTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 1)];
    spliteTopView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    UIView *spliteBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, screenWidth, 1)];
    spliteBottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    [sectionView addSubview:lblTitle];
    [sectionView addSubview:spliteTopView];
    [sectionView addSubview:spliteBottomView];
    
    [sectionView addSubview:section.imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    button.tag = 1000;
    [button addTarget:section action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sectionView addSubview:button];
    
    section.headerView = sectionView;
    section.headerHeight = 44;
    return section;
    
}

- (void)buttonClick:(UIButton *)button
{
    button.selected = !button.selected;
    
    if (self.didSelectBlock) {
        if (self.isDown) {
            self.didSelectBlock(!button.selected);
        }else{
            self.didSelectBlock(button.selected);
        }
    }
}

- (UIImageView *) imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(screenWidth - 32, 11, 22, 22);
        if (self.isDown) {
            _imageView.image = [UIImage imageNamed:@"ico_fold_down" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        }else{
            _imageView.image = [UIImage imageNamed:@"ico_fold_up" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        }
    }
    return _imageView;
}

@end
