//
//  TDFSectionFactory.h
//  Pods
//
//  Created by happyo on 2017/1/18.
//
//

#import <Foundation/Foundation.h>
@class DHTTableViewSection;

@interface TDFSectionFactory : NSObject

/*
 供应链需要的空section，headHeight为CGFloat_MIN
 */
+ (DHTTableViewSection *)sectionForChain;

@end
