//
//  DataAccessFacade.m
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "DataAccessFacade.h"
#import "MovieResponseHandler.h"

@implementation DataAccessFacade

+ (id)sharedDataAccessFacade {
    static dispatch_once_t token = 0;
    static id _sharedInstance = nil;
    
    dispatch_once(&token, ^{
        _sharedInstance = [[DataAccessFacade alloc] init];
    });
    
    return _sharedInstance;
}

- (NSURLSessionTask *)retrieveListOfMoviesForPage:(NSInteger)page withCompletion:(void (^)(NSError *, NSArray *))completion{
    return [[MovieResponseHandler sharedMovieResponseHandler] retrieveListOfMoviesForPage:page withCompletion:completion];
}

@end
