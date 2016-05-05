//
//  NSObject+SqliteObject.h
//  TableDraw
//
//  Created by Snail Ark on 16/3/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//测试

#import <Foundation/Foundation.h>

@interface NSObject (SqliteObject)
- (NSString *)className;
- (NSArray *)getPropertyList;
@end
