//
//  DateFormatter.m
//  EightGlasses
//
//  Created by Divya Munni on 6/26/16.
//  Copyright © 2016 app. All rights reserved.
//

#import "DateFormatter.h"

@implementation DateFormatter

-(NSString *)getFullMonth: (NSDate *)date {
    NSString *resultString;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd-MMM-YYYY"];
    NSTimeZone *easternTimeZone = [NSTimeZone timeZoneWithName:@"US/Eastern"];
    [formatter setTimeZone:easternTimeZone];
    resultString = [formatter stringFromDate:date];
    return resultString;
}

-(NSString *)dateToString:(NSDate *)date{
    NSString *resultString;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSTimeZone *easternTimeZone = [NSTimeZone timeZoneWithName:@"US/Eastern"];
    [dateFormat setTimeZone:easternTimeZone];
    resultString = [dateFormat stringFromDate:date];
    return resultString;
}

-(NSDate *)setTimeZone: (NSDate *)date to:(NSString *)zone{
    
    return [NSDate date];
}

@end
