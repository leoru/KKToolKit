//
//  NSString+KKAdditions.m
//  KKToolKit
//
//  Created by Kirill Kunst on 29.04.14.
//  Copyright (c) 2014 Kirill Kunst. All rights reserved.
//

#import "NSString+KKAdditions.h"
#import <CoreText/CoreText.h>

@implementation NSString (KKAdditions)

- (BOOL)isEmpty
{
    if ([self isEqual:[NSNull null]]) {
        return YES;
    }
    
    if (self == nil) {
        return YES;
    } else if ([self length] == 0) {
        return YES;
    } else if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    
    return NO;
}

- (CGSize)sizeConstrainedToSize:(CGSize)size attributes:(NSDictionary *)attributesDictionary
{
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:self attributes:attributesDictionary];
    return [string sizeConstrainedToSize:size];
}

- (NSInteger)numberOfOccurencesOfSubstring:(NSString *)substring
{
    NSArray *components = [self componentsSeparatedByString:substring];
    return components.count - 1;
}

- (BOOL)hasWhitespaces
{
    NSRange whiteSpaceRange = [self rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
    if (whiteSpaceRange.location != NSNotFound) {
        return YES;
    }
    return NO;
}


@end

@implementation NSAttributedString (AUAdditions)

- (CGSize)sizeConstrainedToSize:(CGSize)size
{
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self);
    CGSize fitSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, [self length]), NULL, size, NULL);
    CFRelease(framesetter);
    
    return CGSizeMake(ceilf(fitSize.width), ceilf(fitSize.height));
}

@end
