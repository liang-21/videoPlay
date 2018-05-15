//
//  TDFAvatarImageCell.m
//  Pods
//
//  Created by chaiweiwei on 2016/12/28.
//
//

#import "TDFAvatarImageCell.h"
#import "TDFAvatarImageView.h"
#import "TDFAvatarImageItem.h"
#import "Masonry.h"

@interface TDFAvatarImageCell()

@property (nonatomic,strong) TDFAvatarImageView *avatarImageView;
@property (nonatomic,strong) UIView *spliteView;

@end

@implementation TDFAvatarImageCell

- (void)cellDidLoad
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.avatarImageView];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self addSubview:self.spliteView];
    [self.spliteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom);
        make.height.mas_equalTo(1);
    }];
}

+ (CGFloat)heightForCellWithItem:(TDFAvatarImageItem *)item
{
    CGFloat height = [TDFAvatarImageView getHeight];
    
    return height;
}

- (UIView *)spliteView
{
    if (!_spliteView) {
        _spliteView = [[UIView alloc] initWithFrame:CGRectZero];
        _spliteView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    
    return _spliteView;
}

- (void)configCellWithItem:(TDFAvatarImageItem *)item
{
    [self.avatarImageView configureViewWithModel:item];
}

- (TDFAvatarImageView *)avatarImageView {
    if(!_avatarImageView){
        _avatarImageView = [[TDFAvatarImageView alloc] init];
    }
    return _avatarImageView;
}

@end
