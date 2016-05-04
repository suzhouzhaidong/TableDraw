//
//  SqliteServie.m
//  TableDraw
//
//  Created by Snail Ark on 16/3/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "SqliteServie.h"
#import "ServiceTable.h"
#import "User.h"
@implementation SqliteServie{
    sqlite3 *db;
    BOOL dbState;
}
+(instancetype)getInstance{
    static SqliteServie *shareservice = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        if (shareservice==nil) {
            shareservice = [[SqliteServie alloc] init];
            [shareservice openDB];
            [shareservice inlization];
        }
    });
    return shareservice;
}


-(void)openDB{
    if (sqlite3_open([[Util getDataBasePath] UTF8String], &db) == SQLITE_OK) {
        NSLog(@"数据库打开成功");
        dbState = YES;
    }
    else{
        NSLog(@"数据库打开失败");
        dbState = NO;
    }
}

-(void) dosql:(NSString *)sql{
    char *error;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &error)!=SQLITE_OK) {
        
    }
    else{
        
    }
    
}

-(void)inlization{
    NSString *createUserTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@)",NSStringFromClass([User class]),[Util getPropertyFromClass:[User class]]];
    NSLog(@"%@",createUserTable);
    NSString *createServiceTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@)",NSStringFromClass([ServiceTable class]),[Util getPropertyFromClass:[ServiceTable class]]];
    [self execInsertTransactionSql:@[createUserTable,createServiceTable]];
}

//批量操作时调用
-(void)execInsertTransactionSql:(NSArray *)transactionSql
{
    //使用事务，提交插入sql语句
    @try{
        char *errorMsg;
        if (sqlite3_exec(db, "BEGIN", NULL, NULL, &errorMsg)==SQLITE_OK)
        {
            NSLog(@"启动事务成功");
            sqlite3_free(errorMsg);
            sqlite3_stmt *statement;
            for (int i = 0; i<transactionSql.count; i++)
            {
                NSLog(@"%@",transactionSql[i]);
                if (sqlite3_prepare_v2(db,[[transactionSql objectAtIndex:i] UTF8String], -1, &statement,NULL)==SQLITE_OK)
                {
                    if (sqlite3_step(statement)!=SQLITE_DONE) sqlite3_finalize(statement);
                }
            }
            if (sqlite3_exec(db, "COMMIT", NULL, NULL, &errorMsg)==SQLITE_OK)   NSLog(@"提交事务成功");
            sqlite3_free(errorMsg);
        }
        else sqlite3_free(errorMsg);
    }
    @catch(NSException *e)
    {
        char *errorMsg;
        if (sqlite3_exec(db, "ROLLBACK", NULL, NULL, &errorMsg)==SQLITE_OK)  NSLog(@"回滚事务成功");
        sqlite3_free(errorMsg);
    }
    @finally{
        NSLog(@"数据库存入结束");
    }
}

-(void)removeClassWith:(Class)classname{
    [self dosql:[NSString stringWithFormat:@"DELETE FROM %@ WHERE 1=1",NSStringFromClass(classname)]];
    if ([classname isSubclassOfClass:[User class]]) {
        NSLog(@"删除所有用户信息");
    }
    if ([classname isSubclassOfClass:[ServiceTable class]]) {
        NSLog(@"删除所有报告单信息");
    }
}

-(BOOL)checkUserinfoWithUsername:(NSString *)username :(NSString *)pwd{
    NSString *sql = [NSString stringWithFormat:@"SELECT COUNT(*) FROM %@ WHERE username='%@' AND pwd='%@'",NSStringFromClass([User class]),username,pwd];
    sqlite3_stmt *statement;
    int count = 0;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, NULL)==SQLITE_OK){
        while (sqlite3_step(statement)==SQLITE_ROW){
            count=sqlite3_column_int(statement,0);
        }
    }
    else
    {
        count=0;
    }
    if (count == 0) {
        return NO;
    }
    return YES;
}

-(int)getTableCount{
    NSString *sql = [NSString stringWithFormat:@"SELECT COUNT(*) FROM %@ WHERE 1=1",NSStringFromClass([ServiceTable class])];
    sqlite3_stmt *statement;
    int count = 0;
    if(sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, NULL)==SQLITE_OK){
        while (sqlite3_step(statement)==SQLITE_ROW){
            count=sqlite3_column_int(statement,0);
        }
    }
    return count;
}
@end
