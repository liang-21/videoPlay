//
//  TDFUnionPayTextView.h
//  Pods
//
//  Created by chaiweiwei on 2017/8/2.
//
//

#import <UIKit/UIKit.h>
#import "TDFUnionPayTextItem.h"
#import "TDFTableViewViewProtocol.h"

@interface TDFUnionPayTextView : UIView<TDFTableViewCustomViewDelegate>

@property (nonatomic,strong) TDFUnionPayTextItem *unionPaymodel;

@end
