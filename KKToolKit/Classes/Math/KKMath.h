//
//  KKMath.h
//  KKToolKit
//
//  Created by Kirill Kunst on 29.04.14.
//  Copyright (c) 2014 Kirill Kunst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKMath : NSObject

/**
 *  Random number float
 *
 *  @param from from value
 *  @param to   to value
 *
 *  @return random number
 */
+ (float)floatRandomNumberBetween:(float)from to:(float)to;

/**
 *  Int random number
 *
 *  @param from from value
 *  @param to   to value
 *
 *  @return int random number
 */
+ (int)randomNumberBetween:(int)from to:(int)to;

/**
 *  Int random number with step (for example 0,5,10,15,20)
 *
 *  @param from from value
 *  @param to   to value
 *  @param step step
 *
 *  @return int random number
 */
+ (int)randomNumberBetween:(int)from to:(int)to withStep:(int)step;

@end
