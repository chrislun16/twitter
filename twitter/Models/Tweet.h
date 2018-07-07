//
//  Tweet.h
//  twitter
//
//  Created by Ezra Bekele on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (strong, nonatomic) NSString *idStr;
@property (strong, nonatomic) NSString *text;
@property (nonatomic) int favoriteCount;
@property (nonatomic) BOOL favorited;
@property (nonatomic) int retweetCount;
@property (nonatomic) BOOL retweeted;
@property (nonatomic) User *user;
@property (strong, nonatomic) NSString *createdAtString;

@property (strong,nonatomic) User *retweetedByUser;

+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
