//
//  MovieResponseHandler.m
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "MovieResponseHandler.h"
#import "Movie.h"

#import "WebServiceClient.h"

@implementation MovieResponseHandler

+ (id)sharedMovieResponseHandler {
    static dispatch_once_t token = 0;
    static id _sharedInstance = nil;
    
    dispatch_once(&token, ^{
        _sharedInstance = [[MovieResponseHandler alloc] init];
    });
    
    return _sharedInstance;
}

- (NSURLSessionTask *)retrieveListOfMoviesForPage:(NSInteger)page withCompletion:(void (^)(NSError *, NSArray *))completion{
    void (^handler)(WebServiceResponse *) = ^(WebServiceResponse *response) {
        
        NSArray *movieList = nil;
        NSError *error = nil;
        
        if(response.statusCode == 200){
            NSArray *rawResults = [response.responseContent objectForKey:@"results"];
            
            //Parse a list of movies
            movieList = [self parseAListOfMoviesWithArray:rawResults];
        } else {
            NSDictionary *errorInfo = @{@"errorDescription": @"Unkown error"};
            
            error = [[NSError alloc] initWithDomain:@"movie" code:0 userInfo:errorInfo];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(error, movieList);
        });
    };
    
    return [[[WebServiceClient alloc] init] retrieveListOfMoviesForPage:page andCompletionHandler:handler];
}

#pragma mark -
#pragma mark Parsing Data

- (NSArray *)parseAListOfMoviesWithArray:(NSArray *)rawData{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:rawData.count];
    
    for (NSDictionary *rawMovie in rawData) {
        [result addObject:[self parseMovieWithDictionary:rawMovie]];
    }
    
    return result;
}

- (Movie *)parseMovieWithDictionary:(NSDictionary *)rawItem{
    Movie *item = [Movie new];
    
    item.identifier = [[rawItem objectForKey:@"id"] integerValue];
    item.title = [rawItem objectForKey:@"title"];
    item.overview = [rawItem objectForKey:@"overview"];
    item.releaseDate = [NSDate dateWithString:[rawItem objectForKey:@"release_date"]];
    item.backdropImagePath = [rawItem objectForKey:@"backdrop_path"];
    item.posterImagePath = [rawItem objectForKey:@"poster_path"];
    item.movieScore = @([[rawItem objectForKey:@"vote_average"] floatValue]);
    
    return item;
}

@end
