//
//  WebServiceResponse.h
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceResponse : NSObject

//HTTP code (200, 404, 500, ...)
@property (assign) NSInteger statusCode;

//Payload response (NSDictionary)
@property (strong, nonatomic) NSDictionary *responseContent;

/**
 Create a web service response with some basic info.

 @param statusCode http response code
 @param content payload
 @return WebServiceResponse instance
 */
- (instancetype)initWithStatusCode:(NSInteger)statusCode andContent:(id)content;

@end
