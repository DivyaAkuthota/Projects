//
//  DateFormatter.h
//  EightGlasses
//
//  Created by Divya Munni on 6/26/16.
//  Copyright © 2016 app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFormatter : NSObject

-(NSString *)getFullMonth: (NSDate *)date;
-(NSDate *)dateToString: (NSDate *)date;
-(NSDate *)setTimeZone: (NSDate *)date to:(NSString *)zone;
@end
