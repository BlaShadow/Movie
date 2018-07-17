//
//  NSDate+Helper.h
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(Helper)

/**
 Parse a date string to NSDate instance, it works for fotmat yyyy-MM-dd

 @param strDate string date
 @return NSDate instance
 */
+ (NSDate *)dateWithString:(NSString *)strDate;


/**
 Return Date string formatted MMM dd, yyyy

 @return string date
 */
- (NSString *)formatDateAsString;

@end
