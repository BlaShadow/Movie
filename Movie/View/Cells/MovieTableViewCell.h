//
//  MovieTableViewCell.h
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieTableViewCell : UITableViewCell

/**
 Setup cell with a movie instance

 @param itemMovie instance
 */
- (void)setupMovieCellWithMovie:(Movie *)itemMovie;

@end
