//
//  MovieDetailsTableViewController.m
//  Movie
//
//  Created by Blashadow on 7/17/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "MovieDetailsTableViewController.h"
#import "Movie.h"

@interface MovieDetailsTableViewController ()

@property (strong, nonatomic) Movie *selectedMovie;

@end

@implementation MovieDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Setup table view
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
 
    return cell;
}

@end
