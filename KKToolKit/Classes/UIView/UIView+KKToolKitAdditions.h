//
// UIView+KKToolKitAdditions.h
// KKToolKitAdditions
//
// Copyright (c) 2013 Kirill Kunst (https://github.com/leoru)
//

#import <UIKit/UIKit.h>

@interface UIView (KKToolKitAdditions)

@property (nonatomic, readwrite) CGFloat x;
@property (nonatomic, readwrite) CGFloat y;
@property (nonatomic, readwrite) CGFloat width;
@property (nonatomic, readwrite) CGFloat height;

- (void)removeAllSubviews;

@end
