//
//  DailyWater.h
//  EightGlasses
//
//  Created by Divya Munni on 6/12/16.
//  Copyright © 2016 app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DailyWater : NSObject

@property (nonatomic, strong) NSString *date;
@property (nonatomic, assign) NSNumber *noofglasses;
@property (nonatomic, assign) BOOL working;

@end
