
//
//  NSDate+Calendar.m
//  KKToolKit
//
//  Created by Кирилл Кунст on 31.10.12.
//  Copyright (c) 2012 Kirill Kunst. All rights reserved.
//
@implementation NSDate (KKToolKitAdditions)

- (NSDate *)nextDay {
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 1;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    return [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];
}

- (NSDate *)previousDay {
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = -1;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    return [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];
}

- (NSDate *)dateByAddingDays:(NSInteger)daysToAdd {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *days = [[NSDateComponents alloc] init];
    [days setDay:daysToAdd];
    return [calendar dateByAddingComponents:days toDate:self options:0];
}

- (NSDate *)nextMonth {
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.month = 1;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    return [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];
}

- (NSDate *)previousMonth {
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.month = -1;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    return [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];
}

- (NSDate *)startOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *currentDateComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDate *startOfMonth = [calendar dateFromComponents:currentDateComponents];
    
    return startOfMonth;
}

- (NSDate *)endOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *plusOneMonthDate = [self dateByAddingMonths:1];
    NSDateComponents *plusOneMonthDateComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:plusOneMonthDate];
    NSDate *endOfMonth = [[calendar dateFromComponents:plusOneMonthDateComponents] dateByAddingTimeInterval:-1];
    return endOfMonth;
}

- (NSDate *)dateByAddingMonths:(NSInteger)monthsToAdd {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *months = [[NSDateComponents alloc] init];
    [months setMonth:monthsToAdd];
    
    return [calendar dateByAddingComponents:months toDate:self options:0];
}

- (NSDate *)startOfDay {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:
                                    ( NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit )
                                          fromDate:self];
    
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    
    return [cal dateFromComponents:components];
    
}

- (NSDate *)endOfDay {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:
                                    ( NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit )
                                          fromDate:self];
    
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    
    return [cal dateFromComponents:components];
}

- (NSDate *)startOfWeek {
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:today];
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay:-([weekdayComponents weekday] - [gregorian firstWeekday])];
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:today options:0];
    NSDateComponents *components = [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:beginningOfWeek];
    beginningOfWeek = [gregorian dateFromComponents:components];
    return beginningOfWeek;
}

- (NSDate *)endOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:(7 - [weekdayComponents weekday])];
    NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    return endOfWeek;
}

@end

@implementation NSDate (TDToolkit)

- (NSDate *)dateByAddingHours:(int)hours {
    NSTimeInterval secondsInEightHours = hours * 60 * 60;
    NSDate *aheadDate = [self dateByAddingTimeInterval:secondsInEightHours];
    return aheadDate;
}

- (NSDate *)dateByAddingMinutes:(int)minutes {
    NSTimeInterval secondsInEightHours = minutes * 60;
    NSDate *aheadDate = [self dateByAddingTimeInterval:secondsInEightHours];
    return aheadDate;
}

- (NSString *)time {
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateStyle:NSDateFormatterNoStyle];
    [df setTimeStyle:NSDateFormatterShortStyle];
    return [NSString stringWithFormat:@"%@", [df stringFromDate:self]];
}


- (int)currentMonth {
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"MM"];
    NSString *monthString = [df stringFromDate:self];
    int month = [monthString intValue];
    return month;
}

- (int)currentDay {
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"dd"];
    NSString *monthString = [df stringFromDate:self];
    int month = [monthString intValue];
    return month;
}

- (NSDate *)toCurrentYear {
    NSDateFormatter *df = [NSDateFormatter new];
    [df setTimeZone:[NSTimeZone localTimeZone]];
    [df setDateFormat:@"dd-MM"];
    NSString *stringDate = [df stringFromDate:self];
    stringDate = [stringDate stringByAppendingFormat:@"-%d", [NSDate currentYear]];
    df = [NSDateFormatter new];
    [df setTimeZone:[NSTimeZone localTimeZone]];
    [df setDateFormat:@"dd-MM-yyyy"];
    return [df dateFromString:stringDate];
}

- (NSDate *)toSpecificTime:(NSDate *)time {
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"HH:mm"];
    [df setTimeZone:[NSTimeZone localTimeZone]];
    NSString *timeString = [df stringFromDate:time];
    
    NSDateFormatter *df1 = [NSDateFormatter new];
    [df1 setTimeZone:[NSTimeZone localTimeZone]];
    [df1 setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [df1 stringFromDate:self];
    NSString *dateTime = [NSString stringWithFormat:@"%@ %@", dateString, timeString];
    
    NSDateFormatter *df2 = [NSDateFormatter new];
    [df2 setTimeZone:[NSTimeZone localTimeZone]];
    [df2 setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *d = [df2 dateFromString:dateTime];
    return d;
}

+ (int)currentYear {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger year = [components year];
    return year;
}

@end

