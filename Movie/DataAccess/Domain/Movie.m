//
//  Movie.m
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "Movie.h"

@implementation Movie

@synthesize identifier;
@synthesize title;
@synthesize overview;
@synthesize releaseDate;
@synthesize movieScore;
@synthesize backdropImagePath;
@synthesize posterImagePath;

- (NSString *)thumbnailImageUrl{
    return [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w500%@", self.posterImagePath];
}

- (NSString *)backDropImageUrl{
    return [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w500%@", self.backdropImagePath];
}

@end
