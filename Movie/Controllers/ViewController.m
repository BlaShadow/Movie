//
//  ViewController.m
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "ViewController.h"
#import "MovieDetailsTableViewController.h"

#import "MovieTableViewCell.h"
#import "DataAccessFacade.h"

@interface ViewController ()

//Movies table view reference
@property (weak, nonatomic) IBOutlet UITableView *moviesTableView;

//Movie List
@property (strong, nonatomic) NSArray *movies;

@end

@implementation ViewController

//Const
NSString * const kMovieCellIdentifier = @"MOVIE_CELL";
NSString * const kMovideDetailsSegue = @"MOVIE_DETAILS_SEGUE";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Setup table view initial configuration
    self.moviesTableView.tableFooterView = [UIView new];
    self.moviesTableView.rowHeight = UITableViewAutomaticDimension;
    self.moviesTableView.estimatedRowHeight = 300.0;
    self.moviesTableView.backgroundColor = [UIColor clearColor];
    
    //Setup data source & delegate
    self.moviesTableView.delegate = self;
    self.moviesTableView.dataSource = self;
    
    //Add custom cell
    [self.moviesTableView registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:nil] forCellReuseIdentifier:kMovieCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Load remote data
    [self loadMovies];
}

- (void)loadMovies{
    [[DataAccessFacade sharedDataAccessFacade] retrieveListOfMoviesForPage:1 withCompletion:^(NSError *error, NSArray *movies) {
        self.movies = movies;
        
        //Reload movies table view
        [self.moviesTableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:kMovideDetailsSegue]){
        MovieDetailsTableViewController *controller = segue.destinationViewController;
        
        //Setup details view controller
        [controller setupViewControllerWithMovie:sender];
    }
}

#pragma mark -
#pragma mark Table view delegate & Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMovieCellIdentifier forIndexPath:indexPath];
    Movie *item = [self.movies objectAtIndex:indexPath.row];
    
    //Setup cell with data
    [cell setupMovieCellWithMovie:item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Movie *selectedMovie = [self.movies objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:kMovideDetailsSegue sender:selectedMovie];
}

@end
