//
//  TOReachabilityManager.h
//  KKToolKit
//
//  Created by Кирилл Кунст on 25.07.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//
/**
 Reachability manager for checking internet connection
 Need Reachability.h
 */
#import <Foundation/Foundation.h>

@class Reachability;

@interface KKReachabilityManager : NSObject

@property (strong, nonatomic) Reachability *reachability;

#pragma mark -
#pragma mark Shared Manager
+ (KKReachabilityManager *)sharedManager;

#pragma mark -
#pragma mark Class Methods
+ (BOOL)isReachable;

+ (BOOL)isUnreachable;

+ (BOOL)isReachableViaWWAN;

+ (BOOL)isReachableViaWiFi;


@end
