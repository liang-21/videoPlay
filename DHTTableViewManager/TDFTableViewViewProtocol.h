//
//  TDFTableViewViewProtocol.h
//  Pods
//
//  Created by chaiweiwei on 2017/7/20.
//
//

#ifndef TDFTableViewViewProtocol_h
#define TDFTableViewViewProtocol_h

@protocol TDFTableViewCustomViewDelegate <NSObject>

@required
/**
 view 初始化
 */
+ (instancetype)configWithModel:(NSObject *)item;
/**
 高度
 */
+ (CGFloat)heightWithModel:(NSObject *)item;

@end

#endif /* TDFTableViewViewProtocol_h */
