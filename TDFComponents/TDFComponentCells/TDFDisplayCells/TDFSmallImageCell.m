//
//  TDFSmallImageCell.m
//  Pods
//
//  Created by 小龙虾 on 2017/7/15.
//
//

#import "TDFSmallImageCell.h"
#import "TDFSmallImageItem.h"
#import "ColorHelper.h"

@interface TDFSmallImageCell ()
@property (nonatomic, strong)UILabel *titlelbl;
@property (nonatomic, strong)UIView *lineBottom;
@end

@implementation TDFSmallImageCell

-(void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titlelbl];
    [self addSubview:self.lineBottom];
}

-(UILabel *)titlelbl
{
    if (!_titlelbl) {
        self.titlelbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, self.frame.size.width/4+20, 25)];
        self.titlelbl.textColor = [ColorHelper getTipColor3];
        self.titlelbl.font = [UIFont systemFontOfSize:15];
    }
    return _titlelbl;
}

-(UIView *)lineBottom
{
    if (!_lineBottom) {
        self.lineBottom = [[UIView alloc] initWithFrame:CGRectMake(10, 89.5, [UIScreen mainScreen].bounds.size.width-20, 0.5)];
        self.lineBottom.backgroundColor = [UIColor grayColor];
    }
    return _lineBottom;
}

+(CGFloat)heightForCellWithItem:(TDFSmallImageItem *)item
{
    return 90;
}

-(void)configCellWithItem:(TDFSmallImageItem *)item
{
    self.titlelbl.text = item.title;
    for (int i = 0; i  < item.imageAry.count; i++) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titlelbl.frame)+5+i*85, 5, 80, 80)];
        UIImage *image = [item.imageAry objectAtIndex:i];
        view.image = image;
        [self addSubview:view];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
