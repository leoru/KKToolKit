//
//  UIButton+AFNetworkingCustom.h
//  shutterbee
//
//  Created by Kirill Kunst on 23.09.13.
//  Copyright (c) 2013 Auslogics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AFNetworkingCustom)

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage forState:(UIControlState)state;

@end
