//
//  TweetCell.m
//  twitter
//
//  Created by Ezra Bekele on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapRetweet:(id)sender {

    if (self.retweetedButton.selected)
    {
        // TODO: Update the local tweet model
        self.tweet.retweetCount -= 1;
        self.tweet.retweeted = NO;
        self.retweetedButton.selected = NO;
        
        // TODO: Update cell UI
        
        NSString *retweettIntToText = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
        self.retweetCount.text = retweettIntToText;
        
        //TODO: Send a POST request to the POST favorites/create endpoint
        
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
        }];

        
    }
    else
    {
    // TODO: Update the local tweet model
    self.tweet.retweetCount += 1;
    self.tweet.retweeted = YES;
    self.retweetedButton.selected = YES;

    // TODO: Update cell UI
        
    NSString *retweettIntToText = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.retweetCount.text = retweettIntToText;

        //TODO: Send a POST request to the POST favorites/create endpoint
        
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];

        
    }

    
    
    

}


//- (IBAction)didTapRetweet:(id)sender {
//    if (self.tweet.retweeted)
//    {
//        // TODO: Update the local tweet model
//        self.tweet.retweetCount += 1;
//        self.tweet.retweeted = YES;
//
//        // TODO: Update cell UI
//
//
//        //int *temp = self.retweetCount.text.intValue+1;
//        NSString *retweettIntToText = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
//        self.retweetCount.text = retweettIntToText;
//
//
//
//        //TODO: Send a POST request to the POST favorites/create endpoint
//
//        //UNCOMMENT LATER AND DEBUG
//        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
//        if(error){
//            NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
//        }
//        else{
//            NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
//        }
//    }];
//
//}

- (IBAction)didTapFavorite:(id)sender {
    
if (self.favoritedButton.selected)
    {
    // TODO: Update the local tweet model
    self.tweet.favoriteCount -= 1;
    self.tweet.favorited = NO;
    self.favoritedButton.selected = NO;
    
    // TODO: Update cell UI
    NSString *favoritetIntToText = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    self.favoriteCount.text = favoritetIntToText;
    
    //int *temp = self.retweetCount.text.intValue+1;
    
    //TODO: Send a POST request to the POST favorites/create endpoint
    
    //UNCOMMENT LATER AND DEBUG
    [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully unfavoriting the following Tweet: %@", tweet.text);
        }
    }];
    }
else
    {
        // TODO: Update the local tweet model
        self.tweet.favoriteCount += 1;
        self.tweet.favorited = YES;
        self.favoritedButton.selected = YES;
        
        // TODO: Update cell UI
        NSString *favoritetIntToText = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
        self.favoriteCount.text = favoritetIntToText;
        
        //int *temp = self.retweetCount.text.intValue+1;
        
        //TODO: Send a POST request to the POST favorites/create endpoint
        
        //UNCOMMENT LATER AND DEBUG
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favoriting the following Tweet: %@", tweet.text);
            }
        }];
    }
    
}


- (void) setTweet:(Tweet *)tweet
{
    _tweet = tweet;
    self.userName.text= self.tweet.user.name;
    self.screenName.text = self.tweet.user.screenName;
    self.tweetText.text = self.tweet.text;
    NSString *retweetIntToText = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    NSLog(@"%@", retweetIntToText);
    self.retweetCount.text = retweetIntToText;
    NSString *favoriteIntToText = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    self.favoriteCount.text = favoriteIntToText;
    [self.profilePic setImageWithURL:self.tweet.user.userImageURL];
    
}

@end
