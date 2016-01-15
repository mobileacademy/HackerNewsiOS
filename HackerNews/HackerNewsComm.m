//
//  HackerNewsComm.m
//  HackerNews
//
//  Created by Mac on 14/01/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import "HackerNewsComm.h"
@import Foundation;

#import "HackerNewsAPI.h"
#import "StoryCollection.h"

@interface HackerNewsComm ()


@end

@implementation HackerNewsComm

- (void) fetchTopStories:(void(^)(StoryCollection*))callback{
    NSURL* endPoint = [NSURL URLWithString:[HackerNewsAPI topStoriesEndpoint]];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:endPoint completionHandler:^( NSData* data, NSURLResponse* response, NSError* err){
        NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        StoryCollection* topStories = [StoryCollection new];
        
        for (NSNumber* id in json) {
            Story* story = [Story new];
            story.id = id.longValue;
            
            [topStories addStory:story];
        }
        
        callback(topStories);
    }] resume];
}

- (void) fetchLatestStories:(void(^)(StoryCollection*))callback{
    NSURL* endPoint = [NSURL URLWithString:[HackerNewsAPI latestStoriesEnpoint]];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:endPoint completionHandler:^( NSData* data, NSURLResponse* response, NSError* err){
        NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        StoryCollection* topStories = [StoryCollection new];
        
        for (NSNumber* id in json) {
            Story* story = [Story new];
            story.id = id.longValue;
            
            [topStories addStory:story];
        }
        
        callback(topStories);
    }] resume];
}

- (void) fetchStory:(Story*)story withCompletionCallback:(void (^)(Story*))callback{
    NSURL* endPoint = [NSURL URLWithString:[HackerNewsAPI objectEndpoint:story.id]];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:endPoint completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary* jsonStory = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        story.title = jsonStory[@"title"];
        story.url = jsonStory[@"url"];
        
        callback(story);
    }] resume];
}
@end
