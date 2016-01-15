//
//  StoryCollection.m
//  HackerNews
//
//  Created by Mac on 14/01/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import "StoryCollection.h"

@interface StoryCollection()
@property (nonatomic) NSMutableArray<Story*>* stories;
@end

@implementation StoryCollection

-(instancetype) init{
    self = [super init];
    
    if(self) {
        self.stories = [NSMutableArray<Story*> new];
    }
    
    return self;
}

- (NSArray<Story*>*) topStories{
    NSRange firstTenRange;
    firstTenRange.location = 0;
    firstTenRange.length = 10;
    
    NSArray<Story*>* ret = [self.stories subarrayWithRange:firstTenRange];
    
    return ret;
}

- (void) addStory:(Story *)newStory{
    [_stories addObject:newStory];
}

@end
