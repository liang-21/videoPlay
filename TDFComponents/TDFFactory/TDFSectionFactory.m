//
//  TDFSectionFactory.m
//  Pods
//
//  Created by happyo on 2017/1/18.
//
//

#import "TDFSectionFactory.h"
#import "DHTTableViewSection.h"

@implementation TDFSectionFactory

+ (DHTTableViewSection *)sectionForChain
{
    DHTTableViewSection *section = [DHTTableViewSection section];
    section.headerHeight = CGFLOAT_MIN;
    
    return section;
}

@end
