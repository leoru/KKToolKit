//
//  TOReachabilityManager.m
//  KKToolKit
//
//  Created by Кирилл Кунст on 25.07.13.
//  Copyright (c) 2013 Kirill Kunst. All rights reserved.
//

#import "KKReachabilityManager.h"
#import "Reachability.h"

@implementation KKReachabilityManager

#pragma mark -
#pragma mark Default Manager
+ (KKReachabilityManager *)sharedManager {
    static KKReachabilityManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

#pragma mark -
#pragma mark Memory Management
- (void)dealloc {
    // Stop Notifier
    if (_reachability) {
        [_reachability stopNotifier];
    }
}

#pragma mark -
#pragma mark Class Methods
+ (BOOL)isReachable {
    return [[[KKReachabilityManager sharedManager] reachability] isReachable];
}

+ (BOOL)isUnreachable {
    return ![[[KKReachabilityManager sharedManager] reachability] isReachable];
}

+ (BOOL)isReachableViaWWAN {
    return [[[KKReachabilityManager sharedManager] reachability] isReachableViaWWAN];
}

+ (BOOL)isReachableViaWiFi {
    return [[[KKReachabilityManager sharedManager] reachability] isReachableViaWiFi];
}

#pragma mark -
#pragma mark Private Initialization
- (id)init {
    self = [super init];
    
    if (self) {
        // Initialize Reachability
        self.reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
        
        // Start Monitoring
        [self.reachability startNotifier];
    }
    
    return self;
}

@end

