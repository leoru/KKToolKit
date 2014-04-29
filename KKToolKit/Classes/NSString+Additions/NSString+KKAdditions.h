//
//  NSString+KKAdditions.h
//  KKToolKit
//
//  Created by Kirill Kunst on 29.04.14.
//  Copyright (c) 2014 Kirill Kunst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (KKAdditions)

/**
 *  Check if string is empty
 *
 *  @return if string is empty
 */
- (BOOL)isEmpty;

/**
 *  Size with constrainted size and attributes
 *
 *  @param size                 Size
 *  @param attributesDictionary Attributes
 *
 *  @return size
 */
- (CGSize)sizeConstrainedToSize:(CGSize)size attributes:(NSDictionary *)attributesDictionary;

/**
 *  Number of substring occurences
 *
 *  @param substring Substring
 *
 *  @return number of occurences
 */
- (NSInteger)numberOfOccurencesOfSubstring:(NSString *)substring;

/**
 *  Check if string has whitespaces
 *
 *  @return Whitespaces
 */
- (BOOL)hasWhitespaces;

@end

@interface NSAttributedString (KKAdditions)

- (CGSize)sizeConstrainedToSize:(CGSize)size;

@end
