//
//  User.h
//  TableDraw
//
//  Created by Snail Ark on 16/3/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(strong,nonatomic)NSString *userid;
@property(strong,nonatomic)NSString *username;
@property(strong,nonatomic)NSString *pwd;
@property(strong,nonatomic)NSString *opid;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end