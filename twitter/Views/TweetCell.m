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
    
    // TODO: Update the local tweet model
    self.tweet.favoriteCount += 1;
    self.tweet.retweeted = YES;

    // TODO: Update cell UI

    
     int *temp = self.retweetCount.text.intValue+1;
     NSString *retweettIntToText = [NSString stringWithFormat:@"%d", temp];
     self.retweetCount = retweettIntToText;
    
    

    // TODO: Send a POST request to the POST favorites/create endpoint
    
    // UNCOMMENT LATER AND DEBUG
//    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
//        if(error){
//            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
//        }
//        else{
//            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
//        }
//    }];
    
}

- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    // TODO: Update cell UI
    // TODO: Send a POST request to the POST favorites/create endpoint
}

- (void) setTweet:(Tweet *)tweet
{
    self.userName.text=tweet.user.name;
    self.screenName.text = tweet.user.screenName;
    self.tweetText.text = tweet.text;
    NSString *retweetIntToText = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    NSLog(@"%@", retweetIntToText);
    self.retweetCount.text = retweetIntToText;
    NSString *favoriteIntToText = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    self.favoriteCount.text = favoriteIntToText;
    [self.profilePic setImageWithURL:tweet.user.userImageURL];
    
}

@end
