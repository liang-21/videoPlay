//
//  TDFAddImageView.h
//  RestApp
//
//  Created by happyo on 16/10/27.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TDFAddImageView;

@protocol TDFAddImageViewDelegate <NSObject>

- (void)addImageViewClicked:(TDFAddImageView *)view;

@end

@interface TDFAddImageView : UIView

@property (nonatomic, weak) id<TDFAddImageViewDelegate> delegate;

@end
