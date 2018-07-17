//
//  MoviesApiClientProtocol.h
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "WebServiceResponse.h"

@protocol MoviesApiClientProtocol

/**
 Fetch a list of movies according to the page, each contain 20 items
 
 @param page
 @param completion handler
 @return request session
 */
@required
- (NSURLSessionTask *)retrieveListOfMoviesForPage:(NSInteger)page andCompletionHandler:(void (^)(WebServiceResponse *))completion;

@end
