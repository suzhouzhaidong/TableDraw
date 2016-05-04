//
//  Util.h
//  TableDraw
//
//  Created by Apple on 16/3/21.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Util : NSObject
+(UIImage*)createImageWithColor:(UIColor*)color;

+(NSString *)getDataBasePath;


+(NSString *)getDateFromDate:(NSDate *)date formatter:(NSString *)format;

+ (void) startLoading:(UIView *) baseView;

+ (void) stopLoading:(UIView *) baseView;

+(NSString *)getServerIp;
+(void)setServerIp:(NSString *)serverip;

+(NSString *)getPropertyFromClass:(Class)classname;

+(NSString *)getInsertStringWithObject:(NSObject *)object;

+(NSString *)getTableNameWithDeviceName:(NSString *)devicename;

@end
