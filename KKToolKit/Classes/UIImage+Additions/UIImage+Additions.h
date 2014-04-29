//
//  UIImage+Additions.h
//  KKToolKit
//
//  Created by Kirill Kunst on 29.04.14.
//  Copyright (c) 2014 Kirill Kunst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additions)

/**
 *  Get image from view
 *
 *  @param view View
 *
 *  @return Image
 */
+ (UIImage *)imageWithView:(UIView *)view;

/**
 *  Fix image orientation to vertical
 *
 *  @return Image
 */
- (UIImage *)fixOrientation;

/**
 *  Crop image to rect
 *
 *  @param rect Rect
 *
 *  @return Image
 */
- (UIImage *)crop:(CGRect)rect;

/**
 *  Scale image to size
 *
 *  @param size Size
 *
 *  @return Image
 */
- (UIImage *)imageScaledToSize:(CGSize)size;

@end
