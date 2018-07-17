//
//  Movie.h
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

@interface Movie : NSObject

//Movie Identifier
@property (assign) NSInteger identifier;

//Movie name
@property (strong, nonatomic) NSString *title;

//A little movie description
@property (strong, nonatomic) NSString *overview;

//Movie released date
@property (strong, nonatomic) NSDate *releaseDate;

//Movie score so far
@property (strong, nonatomic) NSNumber *movieScore;

//Image Path
@property (strong, nonatomic) NSString *backdropImagePath;

//Image Path
@property (strong, nonatomic) NSString *posterImagePath;

/**
 Return poster image url in a short dimention
 */
- (NSString *)thumbnailImageUrl;

/**
 Backdrop image url

 @return url string
 */
- (NSString *)backDropImageUrl;

@end
