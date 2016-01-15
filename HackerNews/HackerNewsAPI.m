//
//  HackerNewsAPI.m
//  HackerNews
//
//  Created by Mac on 14/01/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import "HackerNewsAPI.h"

@implementation HackerNewsAPI

+ (NSString*) topStoriesEndpoint{
    return @"https://hacker-news.firebaseio.com/v0/topstories.json";
}

+ (NSString*) latestStoriesEnpoint{
    return @"https://hacker-news.firebaseio.com/v0/newstories.json";
}

+ (NSString*) objectEndpoint:(long)id{
    return [NSString stringWithFormat:@"https://hacker-news.firebaseio.com/v0/item/%lu.json?print=pretty", id];
}

@end
