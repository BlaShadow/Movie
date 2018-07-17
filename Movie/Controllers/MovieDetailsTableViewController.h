//
//  MovieDetailsTableViewController.h
//  Movie
//
//  Created by Blashadow on 7/17/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieDetailsTableViewController : UITableViewController

/**
 Setup view controller with selected movie

 @param movie selecte movie
 */
- (void)setupViewControllerWithMovie:(Movie *)movie;

@end
