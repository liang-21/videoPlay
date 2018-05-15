//
//  TDFAvatarImageView.h
//  Pods
//
//  Created by chaiweiwei on 2016/12/28.
//
//

#import "TDFBaseEditView.h"
#import "TDFAvatarImageItem.h"

@interface TDFAvatarImageView : TDFBaseEditView

@property (nonatomic, strong) TDFAvatarImageItem *model;

+ (CGFloat)getHeight;

@end
