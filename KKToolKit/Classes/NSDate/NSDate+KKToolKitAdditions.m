
//
//  NSDate+Calendar.m
//  KKToolKit
//
//  Created by Кирилл Кунст on 31.10.12.
//  Copyright (c) 2012 Kirill Kunst. All rights reserved.
//

#import "NSDate+KKToolKitAdditions.h"

@implementation NSDate (KKToolKitAdditions)

-(NSDate *)nextDay {
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 1;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    return [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];
}
-(NSDate *)previousDay {
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = -1;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    return [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];
}
-(NSDate *)dateByAddingDays:(NSInteger)daysToAdd {
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * days = [[NSDateComponents alloc] init];
    [days setDay: daysToAdd];
    return [calendar dateByAddingComponents:days toDate: self options: 0];
}

-(NSDate *)nextMonth {
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.month = 1;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    return [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];
}
-(NSDate *)previousMonth {
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.month = -1;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    return [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];
}

-(NSDate *)startOfMonth {
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    NSDateComponents * currentDateComponents = [calendar components: NSYearCalendarUnit | NSMonthCalendarUnit fromDate: self];
    NSDate * startOfMonth = [calendar dateFromComponents: currentDateComponents];
    
    return startOfMonth;
}
-(NSDate *) endOfMonth {
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDate * plusOneMonthDate = [self dateByAddingMonths: 1];
    NSDateComponents * plusOneMonthDateComponents = [calendar components: NSYearCalendarUnit | NSMonthCalendarUnit fromDate: plusOneMonthDate];
    NSDate * endOfMonth = [[calendar dateFromComponents: plusOneMonthDateComponents] dateByAddingTimeInterval: -1];
    return endOfMonth;
}

-(NSDate *) dateByAddingMonths: (NSInteger) monthsToAdd {
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    NSDateComponents * months = [[NSDateComponents alloc] init];
    [months setMonth: monthsToAdd];
    
    return [calendar dateByAddingComponents: months toDate: self options: 0];
}
-(NSDate *)dateByAddingHours:(int)hours {
    NSTimeInterval secondsInEightHours = hours * 60 * 60;
    NSDate *aheadDate = [self dateByAddingTimeInterval:secondsInEightHours];
    return aheadDate;
}

-(NSDate *)startOfDay {
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"yyyy-MM-dd 00:00:00 +0000"];
    NSString *startDateString = [df stringFromDate:self];
    NSDate *startDate = [df dateFromString:startDateString];
    return startDate;
}

-(NSDate *)startOfWeek {
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:today];
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: - ([weekdayComponents weekday] - [gregorian firstWeekday])];
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:today options:0];
    NSDateComponents *components = [gregorian components: (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                                                fromDate: beginningOfWeek];
    beginningOfWeek = [gregorian dateFromComponents: components];
    return beginningOfWeek;
}
-(NSDate *)endOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	[componentsToAdd setDay:(7 - [weekdayComponents weekday])];
	NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
	return endOfWeek;
}

-(int)currentMonth{
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"MM"];
    NSString *monthString = [df stringFromDate:self];
    int month = [monthString intValue];
    return month;
}
-(int)currentDay{
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"dd"];
    NSString *monthString = [df stringFromDate:self];
    int month = [monthString intValue];
    return month;
}

@end

