//
//  User.m
//  TableDraw
//
//  Created by Snail Ark on 16/3/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "User.h"

@implementation User
-(instancetype)initWithDict:(NSDictionary *)dict{
    self  = [super init];
    self.userid = [[dict objectForKey:@"Id"] stringValue];
    self.username = [dict objectForKey:@"Username"];
    self.pwd = [dict objectForKey:@"Pwd"];
    self.opid = [dict objectForKey:@"opid"];
    return self;
}
@end
