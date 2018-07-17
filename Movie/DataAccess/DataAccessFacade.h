//
//  DataAccessFacade.h
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataAccessFacade : NSObject

/*
 *  Singleton instance
 *
 * **/
+ (id)sharedDataAccessFacade;

/**
 DataAccessFacade - Handle response from request a list of movies from API, then parse all the data and send it back to view
 
 @param page number
 @param completion handler
 @return task session
 */
- (NSURLSessionTask *)retrieveListOfMoviesForPage:(NSInteger)page withCompletion:(void (^)(NSError *, NSArray *))completion;


@end
