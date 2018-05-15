//
//  TDFStepsTableCell.m
//  TDFComponents
//
//  Created by 刘红琳 on 2017/11/14.
//

#import "TDFStepsTableCell.h"
#import "TDFStepsTableItem.h"
#import "UIColor+Hex.h"
#import "UIColor+tdf_standard.h"
#import "Masonry.h"

#define LEFTDISTANCE 60
#define CIRCLEWIDTH 10

@interface TDFStepsTableCell()

@end

@implementation TDFStepsTableCell

#pragma mark DHTTableViewCellDelegate
- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, 0,[UIApplication sharedApplication].keyWindow.frame.size.width, 64);
}

- (void) layoutContentView:(NSInteger)stepNumber
{
    for (int i=0; i<stepNumber;i++) {
        int col = i%stepNumber;
        UIImageView * circleImage = [[UIImageView alloc]init];
        [self addSubview:circleImage];
                circleImage.frame = CGRectMake(LEFTDISTANCE+col*CIRCLEWIDTH+ col*(self.frame.size.width-LEFTDISTANCE*2-stepNumber*CIRCLEWIDTH)/(stepNumber-1), 15, CIRCLEWIDTH, CIRCLEWIDTH);
        circleImage.image = [UIImage imageNamed:@"clearCircle"];
        circleImage.layer.masksToBounds = YES;
        circleImage.layer.cornerRadius = CIRCLEWIDTH/2;
        circleImage.tag = 100+i;
        
        if (i<stepNumber-1) {
            UILabel *line = [[UILabel alloc] init];
            [self addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(circleImage.mas_right);
                make.centerY.equalTo(circleImage.mas_centerY);
                make.height.equalTo(@(0.5));
                make.width.equalTo(@((self.frame.size.width-LEFTDISTANCE*2-stepNumber*CIRCLEWIDTH)/(stepNumber-1)));
            }];
            line.backgroundColor = [UIColor colorWithHexString:@"#999999"];
        }

        UILabel *titleLabel = [[UILabel alloc] init];
         [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(circleImage.mas_bottom).with.offset(9.5);
            make.centerX.equalTo(circleImage.mas_centerX);
            make.width.equalTo(@(self.frame.size.width/stepNumber));
        }];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:13];
        titleLabel.tag = 200+i;
        titleLabel.textColor = [UIColor colorWithHexString:@"#000000"];
    }
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(@(0.5));
        make.right.equalTo(self);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFStepsTableItem *)item
{
    return 64;
}

 - (void)configCellWithItem:(TDFStepsTableItem *)item
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    [self layoutContentView:item.titleArray.count];

    for (int i=0; i<item.stepIndex;i++) {
        UIImageView *image = [self viewWithTag:100+i];
        image.image = [UIImage imageNamed:@"blueCircle"];
    }
    
    UILabel *label = [self viewWithTag:200+item.stepIndex-1];
    label.textColor = [UIColor tdf_hex_0088FF];
    for (int i=0; i<item.titleArray.count;i++) {
        UILabel *label = [self viewWithTag:200+i];
        label.text = item.titleArray[i];
    }
}

@end
