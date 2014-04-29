//
//  KKMath.m
//  KKToolKit
//
//  Created by Kirill Kunst on 29.04.14.
//  Copyright (c) 2014 Kirill Kunst. All rights reserved.
//

#import "KKMath.h"

#define ARC4RANDOM_MAX 0x100000000

@implementation KKMath

+ (float)floatRandomNumberBetween:(float)from to:(float)to
{
    return ((float)arc4random() / ARC4RANDOM_MAX * (from - to)) + from;
}

+ (int)randomNumberBetween:(int)from to:(int)to
{
    return (int)from + arc4random() % (to-from+1);
}

+ (int)randomNumberBetween:(int)from to:(int)to withStep:(int)step
{
    int rand = ([self randomNumberBetween:from to:to] / step) * step;
    return rand;
}

@end
