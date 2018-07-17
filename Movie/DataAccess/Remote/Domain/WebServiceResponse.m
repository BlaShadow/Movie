//
//  WebServiceResponse.m
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "WebServiceResponse.h"

@implementation WebServiceResponse

@synthesize statusCode;
@synthesize responseContent;

- (instancetype)initWithStatusCode:(NSInteger)statusCode andContent:(id)content{
    self = [super init];
    
    self.statusCode = statusCode;
    self.responseContent = content;
    
    return self;
}

@end
