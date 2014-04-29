//
//  NSString+Hashes.h
//  shutterbee
//
//  Created by Kirill Kunst on 30.09.13.
//  Copyright (c) 2013 Auslogics. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 MD5 and SHA1 hashes from string
 */
@interface NSString (Hashes)

- (NSString *) md5;

- (NSString*) sha1;

@end
