//
//  NSObject+SqliteObject.m
//  TableDraw
//
//  Created by Snail Ark on 16/3/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "NSObject+SqliteObject.h"
#import <objc/runtime.h>
@implementation NSObject (SqliteObject)
- (NSArray *)getPropertyList{
    u_int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertyArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        [propertyArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties); 
    return propertyArray;
}


- (NSString *)className{
    return [NSString stringWithUTF8String:object_getClassName(self)];
}
@end
