//
//  Util.m
//  TableDraw
//
//  Created by Apple on 16/3/21.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "Util.h"
#import <objc/runtime.h>
#import "SqliteServie.h"
@implementation Util
+ (UIImage*)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(NSString *)getDataBasePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:@"xhdj.sqlite"];
    return database_path;
}

+(NSString *)getServerIp{
    NSLog(@"currentip is %@",[CACHE objectForKey:@"serverIP"]);
    return [CACHE objectForKey:@"serverIP"];
}

+(void)setServerIp:(NSString *)serverip{
    NSLog(@"serverip is %@",serverip);
    [CACHE setObject:serverip forKey:@"serverIP"];
    [CACHE synchronize];
}

+(NSString *)getDateFromDate:(NSDate *)date formatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (void) startLoading:(UIView *) baseView{
    //    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"1" message:[NSString stringWithFormat:@"%f,%f",baseView.frame.size.width,baseView.frame.size.height] delegate:nil cancelButtonTitle:@"1" otherButtonTitles:nil];
    //    [alert show];
    baseView.userInteractionEnabled=NO;
    UILabel *bigView = [[UILabel alloc] initWithFrame:CGRectMake((baseView.bounds.size.width-60.0)/2.0, (baseView.bounds.size.height-60)/2.0, 60.0, 60.0)];
    bigView.tag = 9999;
    bigView.text = @"加载中";
    bigView.textAlignment = NSTextAlignmentCenter;
    bigView.textColor = [UIColor redColor];
    bigView.font = [UIFont boldSystemFontOfSize:30.0];
    bigView.layer.cornerRadius = 30.0;
    bigView.layer.masksToBounds=YES;
    UIBezierPath *pacmanOpenPath;
    CGFloat radius = 30.0f;
    pacmanOpenPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(30.0, 30.0) radius:radius startAngle:0 endAngle:2*M_PI clockwise:YES];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    NSMutableArray *colors = nil;
    if (colors == nil) {
        colors = [[NSMutableArray alloc] initWithCapacity:3];
        [colors addObject:(id)[UIColor redColor].CGColor];
        [colors addObject:(id)[UIColor clearColor].CGColor];
    }
    [gradientLayer setColors:colors];
    gradientLayer.frame = CGRectMake(0, 0, 60, 60);
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    shapelayer.fillColor = [UIColor clearColor].CGColor;
    shapelayer.fillMode = kCAFillRuleEvenOdd;
    shapelayer.path = pacmanOpenPath.CGPath;
    shapelayer.strokeColor = [UIColor blueColor].CGColor;
    shapelayer.lineWidth = 10.0;
    shapelayer.frame = CGRectMake(0, 0, 50.0,50.0);
    gradientLayer.mask = shapelayer;
    [bigView.layer addSublayer:gradientLayer];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:2*M_PI];
    animation.duration = 1;
    animation.repeatCount = HUGE_VALF;
    [gradientLayer addAnimation:animation forKey:@"GradientRotateAnimation"];
    [baseView addSubview:bigView];
}

+ (void) stopLoading:(UIView *) baseView{
    baseView.userInteractionEnabled=YES;
    UIView *view = [baseView viewWithTag:9999];
    [view removeFromSuperview];
}

+(NSString *)getPropertyFromClass:(Class)classname{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(classname, &count);
    NSMutableString *result = [[NSMutableString alloc] init];
    for (int i = 0; i < count; i++) {
     objc_property_t property = properties[i];
        NSString *propertyname = [[NSString alloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        char * type = property_copyAttributeValue(property, "T");
        NSString *propertytype =[NSString stringWithUTF8String:type];
        if ([propertytype isEqualToString:@"c"]) {
            propertytype = @"REAL";
        }
        propertytype = [[propertytype stringByReplacingOccurrencesOfString:@"\"" withString:@""] stringByReplacingOccurrencesOfString:@"@" withString:@""];
      
        if ([NSClassFromString(propertytype) isSubclassOfClass:[NSString class]]) {
            propertytype = @"TEXT";
        }
        if ([NSClassFromString(propertytype) isSubclassOfClass:[NSData class]]) {
            propertytype = @"BLOB";
        }
        if (i==0) {
            [result appendString:[NSString stringWithFormat:@"%@ %@",propertyname,propertytype]];
        }
        else{
            [result appendString:[NSString stringWithFormat:@",%@ %@",propertyname,propertytype]];
        }
    }
    free(properties);
    return result;
}

+(NSString *)getInsertStringWithObject:(NSObject *)object{
        NSString *tablename = [object className];
        NSMutableString *sql = [[NSMutableString alloc] init];
        NSArray *array = [object getPropertyList];
        [sql appendFormat:@"INSERT INTO %@ (",tablename] ;
        NSInteger i = 0;
        for (NSString *key in array) {
            if (i>0) {
                [sql appendString:@","];
            }
            [sql appendFormat:@"%@",key];
            i++;
        }
        [sql appendString:@") VALUES ("];
        NSMutableArray *arrayValue = [NSMutableArray array];
        i=0;
        for (NSString *key in array) {
            SEL selector = NSSelectorFromString(key);
       #pragma clang diagnostic push
       #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            id value = [object performSelector:selector];
       #pragma clang diagnostic pop
            
            if ([[value class] isSubclassOfClass:[NSString class]]) {

            }
            else{
                if ([[value class] isSubclassOfClass:[NSData class]]) {
           
                }
                else{
              
                }
            }
            
            if (value==nil) {
                value = @"";
            }
           
            [arrayValue addObject:value];
            if (i>0) {
                [sql appendString:@","];
            }
            [sql appendString:[NSString stringWithFormat:@"'%@'",value]];
            i++;
        }
        [sql appendString:@")"];
        return sql;
}


+(NSString *)getTableNameWithDeviceName:(NSString *)devicename{
    int currentnum = [[SqliteServie getInstance] getTableCount];
    NSString *uuid =  [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString *date = [self getDateFromDate:[NSDate date] formatter:@"yyyyMMdd"];
    NSString *result = [NSString stringWithFormat:@"%@%@%@%d",devicename,date,uuid,currentnum+1];
    return result;
}

@end
