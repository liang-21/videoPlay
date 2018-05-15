//
//  TDFImagePickerView.h
//  RestApp
//
//  Created by Octree on 12/1/17.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDFImagePickerView : UIView

@property (strong, nonatomic, readonly) UIImageView *imageView;

@property (nonatomic) BOOL alwaysHideDeleteButton;

@property (strong, nonatomic) void (^deleteBlock)();
@property (strong, nonatomic) void (^selectBlock)();

@property (strong, nonatomic) NSURL *imageURL;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *prompt;
@property (copy, nonatomic) NSString *warning;

@end
