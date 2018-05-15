//
//  TDFCardBgImageBaseItem.h
//  RestApp
//
//  Created by chaiweiwei on 2016/11/3.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "TDFBaseEditItem.h"

@interface TDFCardBgImageBaseItem : TDFBaseEditItem

//图片路径
@property (nonatomic, copy) NSString *cardImagePath;
//本地上传图片的image对象
@property (nonatomic, copy) UIImage *cardImage;
//左上角的文本区域
@property (nonatomic, copy) NSString *leftTagTextValue;
//中心位置的文本
@property (nonatomic, copy) NSString *topTitleValue;
//topTitle位置下的副文本
@property (nonatomic, copy) NSString *bottomTitleValue;
//左下角的描述文字
@property (nonatomic, copy) NSString *descTitleValue;
//添加图片按钮的文案
@property (nonatomic,copy) NSString *titleForAddImageButton;

//添加图片按钮 图片
@property (nonatomic, copy) NSString *imgStrForAddImageButton;

@property (nonatomic, assign) BOOL isShowBackgoundImg;
@end
