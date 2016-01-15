//
//  StoryCollection.h
//  HackerNews
//
//  Created by Mac on 14/01/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Story.h"

@interface StoryCollection : NSObject

- (NSArray<Story*>*) topStories;
- (void) addStory:(Story*)newStory;

@end
