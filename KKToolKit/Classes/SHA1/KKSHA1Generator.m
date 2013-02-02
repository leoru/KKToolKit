//
//  Sha1Generator.m
//  KKToolKit
//
//  Created by Кирилл Кунст on 10.11.12.
//  Copyright (c) 2012 Кирилл Кунст. All rights reserved.
//

#import "KKSHA1Generator.h"
#import <CommonCrypto/CommonDigest.h>

@implementation KKSHA1Generator

+ (NSString *)generate {
    
    int randomNumber = arc4random_uniform(10000);
    
    NSString *str = [[[NSDate date] description] stringByAppendingFormat:@" %d",randomNumber];
    const char *cStr = [str UTF8String];
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(cStr, strlen(cStr), result);
    NSString *s = [NSString  stringWithFormat:
                   @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   result[0], result[1], result[2], result[3], result[4],
                   result[5], result[6], result[7],
                   result[8], result[9], result[10], result[11], result[12],
                   result[13], result[14], result[15],
                   result[16], result[17], result[18], result[19]
                   ];
    return s;
}


@end
