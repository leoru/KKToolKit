//
//  NSDate+Calendar.h
//  KKToolKit
//
//  Created by Кирилл Кунст on 31.10.12.
//  Copyright (c) 2012 Kirill Kunst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (KKToolKitAdditions)

- (NSDate *)nextDay;

- (NSDate *)previousDay;

- (NSDate *)previousMonth;

- (NSDate *)nextMonth;

- (NSDate *)startOfMonth;

- (NSDate *)endOfMonth;

- (NSDate *)dateByAddingMonths:(NSInteger)monthsToAdd;

- (NSDate *)dateByAddingDays:(NSInteger)daysToAdd;

- (NSDate *)startOfDay;

- (NSDate *)endOfDay;

- (NSDate *)startOfWeek;

- (NSDate *)endOfWeek;

@end

@interface NSDate (TDToolkit)

- (NSDate *)dateByAddingHours:(int)hours;

- (NSDate *)dateByAddingMinutes:(int)minutes;

- (NSString *)time;

- (int)currentDay;

- (int)currentMonth;

+ (int)currentYear;

- (NSDate *)toSpecificTime:(NSDate *)time;


@end

