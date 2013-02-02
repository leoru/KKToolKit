//
//  NSDate+Calendar.m
//  KKToolKit
//
//  Created by Кирилл Кунст on 31.10.12.
//  Copyright (c) 2012 Create. All rights reserved.
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



@end
