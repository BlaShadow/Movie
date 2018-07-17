//
//  MovieDetailsTableViewController.m
//  Movie
//
//  Created by Blashadow on 7/17/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "MovieDetailsTableViewController.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import "Movie.h"

@interface MovieDetailsTableViewController ()

@property (strong, nonatomic) Movie *selectedMovie;

@end

@implementation MovieDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Setup table view
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.7];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupViewControllerWithMovie:(Movie *)movie{
    self.selectedMovie = movie;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
 
    UIImageView *backImageview = [cell viewWithTag:1];
    UIImageView *posterImageview = [cell viewWithTag:2];
    UILabel *previewLabel = [cell viewWithTag:5];
    UILabel *titleLabel = [cell viewWithTag:3];
    UILabel *releaseDateLabel = [cell viewWithTag:4];
    
    previewLabel.text = self.selectedMovie.overview;
    titleLabel.text = self.selectedMovie.title;
    releaseDateLabel.text = [self.selectedMovie.releaseDate formatDateAsString];
    
    [backImageview sd_setImageWithURL:[NSURL URLWithString:[self.selectedMovie thumbnailImageUrl]]];
    [posterImageview sd_setImageWithURL:[NSURL URLWithString:[self.selectedMovie thumbnailImageUrl]]];
    
    return cell;
}

@end
