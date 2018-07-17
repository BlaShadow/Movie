//
//  MovieTableViewCell.m
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "MovieTableViewCell.h"
#import "Movie.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface MovieTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *backgroundContent;
@property (weak, nonatomic) IBOutlet UIView *contentContainer;
@property (weak, nonatomic) IBOutlet UIImageView *moviePosterImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreMovieLabel;

@end

@implementation MovieTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setupCornersRounded{
    self.backgroundContent.layer.masksToBounds = NO;
    self.backgroundContent.layer.shadowColor = [[[UIColor blackColor] colorWithAlphaComponent:0.6] CGColor];
    self.backgroundContent.layer.shadowOffset = CGSizeMake(0.7, 2.0);
    self.backgroundContent.layer.shadowOpacity = 0.7;
    self.backgroundContent.layer.shadowRadius = 4.0;
    
    //A little round for corners & shadow content
    self.contentContainer.layer.cornerRadius = 10.0;
    self.contentContainer.clipsToBounds = YES;
    
    //circle shape for score
    self.scoreMovieLabel.layer.cornerRadius = self.scoreMovieLabel.frame.size.width / 2;
    self.scoreMovieLabel.clipsToBounds = YES;
}

- (void)setupMovieCellWithMovie:(Movie *)itemMovie{
    self.movieTitleLabel.text = itemMovie.title;
    self.scoreMovieLabel.text = [NSString stringWithFormat:@"%.1f", [itemMovie.movieScore floatValue]];
    self.releaseDateLabel.text = [itemMovie.releaseDate formatDateAsString];
    
    //Setup image
    [self.moviePosterImageView sd_setImageWithURL:[NSURL URLWithString:[itemMovie thumbnailImageUrl]] placeholderImage:[UIImage imageNamed:@"poster_placeholder"]];
    
    //Custom setup
    [self setupCornersRounded];
}

@end
