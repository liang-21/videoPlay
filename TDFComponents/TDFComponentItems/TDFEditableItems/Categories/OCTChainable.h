//
//  OCTChainable.h
//  RestApp
//
//  Created by Octree on 30/8/16.
//  https://github.com/octree/OCTMacro
//  Copyright © 2016年 Octree. All rights reserved.
//

#ifndef OCTChainable_h
#define OCTChainable_h

#import <Foundation/Foundation.h>

#define __chain_block_name(x,y) OCT##x##y##Chainable

#define declare_block_no_asterisk(x, y) \
typedef x* (^ __chain_block_name(x,y))(y value);

#define declare_block_asterisk(x, y)\
typedef x* (^ __chain_block_name(x,y))(y * value);

#define auto_declare_block(x) \
@class x;\
declare_block_no_asterisk(x, NSUInteger)\
declare_block_no_asterisk(x, double)\
declare_block_no_asterisk(x, CGRect)\
declare_block_no_asterisk(x, CGSize)\
declare_block_no_asterisk(x, NSTimeInterval)\
declare_block_no_asterisk(x, CGPoint)\
declare_block_no_asterisk(x, CGFloat)\
declare_block_no_asterisk(x, NSInteger)\
declare_block_no_asterisk(x, BOOL)\
declare_block_no_asterisk(x, id)\
declare_block_asterisk(x, NSString)\
declare_block_asterisk(x, NSMutableString)\
declare_block_asterisk(x, NSNumber)\
declare_block_asterisk(x, NSArray)\
declare_block_asterisk(x, NSMutableArray)\
declare_block_asterisk(x, NSDictionary)\
declare_block_asterisk(x, NSMutableDictionary)\
declare_block_asterisk(x, NSURL)\
declare_block_asterisk(x, NSData)\
declare_block_asterisk(x, NSDate)\
declare_block_asterisk(x, NSMutableData)


#define declare_method(x,y,z) \
- (__chain_block_name(x,y))tdf_##z;

#define imp_method_no_asterisk(x,y,z) \
- (__chain_block_name(x,y))tdf_##z {\
__weak typeof(self) wself = self;\
return ^x *(y value) {\
__strong typeof(self) sself = wself;\
if (sself) {\
sself.z = value;\
}\
return self;\
};\
}


#define imp_method_asterisk(x,y,z) \
- (__chain_block_name(x,y))tdf_##z {\
__weak typeof(self) wself = self;\
return ^x *(y * value) {\
__strong typeof(self) sself = wself;\
if (sself) {\
sself.z = value;\
}\
return self;\
};\
}

#endif /* OCTChainable_h */
