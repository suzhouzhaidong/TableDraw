//
//  SqliteServie.h
//  TableDraw
//
//  Created by Snail Ark on 16/3/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface SqliteServie : NSObject

+(instancetype)getInstance;

-(void)removeClassWith:(Class)classname;

-(void)execInsertTransactionSql:(NSArray *)transactionSql;

-(BOOL)checkUserinfoWithUsername:(NSString *)username :(NSString *)pwd;

-(int)getTableCount;
@end
