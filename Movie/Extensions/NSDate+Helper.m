//
//  NSDate+Helper.m
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate(Helper)

+ (NSDate *)dateWithString:(NSString *)strDate{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    return [dateFormat dateFromString:strDate];
}

- (NSString *)formatDateAsString{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMM dd, yyyy"];
    
    return [NSString stringWithFormat:@"%@", [dateFormat stringFromDate:self]];
}

@end
