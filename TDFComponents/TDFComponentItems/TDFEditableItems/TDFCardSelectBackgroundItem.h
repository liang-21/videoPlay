//
//  ASCCardSelectBackgroundItem.h
//  AssemblyComponent
//
//  Created by 黄河 on 2017/11/28.
//

#import "TDFBaseEditItem.h"

@interface TDFCardSelectBackgroundItem : TDFBaseEditItem

@property (nonatomic, strong) NSString *imageUrl;

@property (nonatomic, strong) NSString *localImageName;

@property (nonatomic, strong) NSString *leftTitle;

@property (nonatomic, strong) NSString *centerTitle;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, assign) UIEdgeInsets inset;

@property (nonatomic, assign) CGFloat imageHeight;
@end
