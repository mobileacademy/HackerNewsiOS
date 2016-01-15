//
//  HackerNewsComm.h
//  HackerNews
//
//  Created by Mac on 14/01/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "StoryCollection.h"

@interface HackerNewsComm : NSObject

- (void) fetchLatestStories:(void(^)(StoryCollection*))callback;
- (void) fetchTopStories:(void(^)(StoryCollection*))callback;
- (void) fetchStory:(Story*)story withCompletionCallback:(void(^)(Story*))callback;

@end
