//
//  NSDate+AUAddition.m
//  shutterbee
//
//  Created by Kirill Kunst on 13.09.13.
//  Copyright (c) 2013 Auslogics. All rights reserved.
//

#import "NSDate+AUAddition.h"

#define D_MINUTE 60
#define D_HOUR 3600
#define D_DAY 86400
#define D_WEEK 604800
#define D_YEAR 31556926

@implementation NSDate (AUAddition)

- (NSString *)instagramLikeTime
{
    NSString *formatted;
    NSDate *today = [NSDate date];
    
    NSInteger seconds = fabs([today secondsAfterDate:self]);
    NSInteger minutes = [today minutesAfterDate:self];
    NSInteger hours = [today hoursAfterDate:self];
    NSInteger days = [today daysAfterDate:self];
    
    if(days >= 365) {
        formatted = [NSString stringWithFormat:@"%dy", days/365];
    } else if(days < 365 && days >= 30) {
        formatted = [NSString stringWithFormat:@"%dw", days/7];
    } else if(days >= 1) {
        formatted = [NSString stringWithFormat:@"%dd", days];
    } else if(minutes >= 60) {
        formatted = [NSString stringWithFormat:@"%dh", hours];
    } else if(minutes >= 1 && minutes < 60) {
        formatted = [NSString stringWithFormat:@"%dm", minutes];
    } else {
        formatted = [NSString stringWithFormat:@"%ds", seconds];
    }
    
    return formatted;
}

- (NSString *)postTextDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH':'mm', 'd' 'MMM' 'y"];
    
    return [formatter stringFromDate:self];
}

#pragma mark Retrieving Intervals

- (NSInteger) secondsAfterDate: (NSDate *) aDate
{
	NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
	return (NSInteger) ti;
}

- (NSInteger) minutesAfterDate: (NSDate *) aDate
{
	NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
	return (NSInteger) (ti / D_MINUTE);
}

- (NSInteger) minutesBeforeDate: (NSDate *) aDate
{
	NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
	return (NSInteger) (ti / D_MINUTE);
}

- (NSInteger) hoursAfterDate: (NSDate *) aDate
{
	NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
	return (NSInteger) (ti / D_HOUR);
}

- (NSInteger) hoursBeforeDate: (NSDate *) aDate
{
	NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
	return (NSInteger) (ti / D_HOUR);
}

- (NSInteger) daysAfterDate: (NSDate *) aDate
{
	NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
	return (NSInteger) (ti / D_DAY);
}

- (NSInteger) daysBeforeDate: (NSDate *) aDate
{
	NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
	return (NSInteger) (ti / D_DAY);
}


@end
