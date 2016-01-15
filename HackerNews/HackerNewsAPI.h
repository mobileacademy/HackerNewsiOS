//
//  HackerNewsAPI.h
//  HackerNews
//
//  Created by Mac on 14/01/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HackerNewsAPI : NSObject

+ (NSString*) topStoriesEndpoint;
+ (NSString*) latestStoriesEnpoint;
+ (NSString*) objectEndpoint:(long)id;

@end
