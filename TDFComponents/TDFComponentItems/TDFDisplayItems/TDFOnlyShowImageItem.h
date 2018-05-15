//
//  TDFOnlyShowImagesItem.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/17.
//
//

#import "DHTTableViewItem.h"

@interface TDFOnlyShowImageItem : DHTTableViewItem

@property (copy,nonatomic) NSString *imagePath;

@property (assign,nonatomic) BOOL isFixSize;

@property (assign,nonatomic) CGSize imageDefaultSize;

@property (strong,nonatomic) UIImage *image;

@property (strong,nonatomic) UIColor *backgroundColor;

@property (nonatomic, assign) BOOL shouldShow;

@end
