//
//  HackerNewsTests.m
//  HackerNewsTests
//
//  Created by Mac on 14/01/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HackerNewsComm.h"

@interface HackerNewsTests : XCTestCase

@end

@implementation HackerNewsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testFetchTopStories {
    XCTestExpectation* expectation = [self expectationWithDescription:@"fetch top stories"];
    
    HackerNewsComm* comm = [HackerNewsComm new];
    [comm fetchTopStories:^(StoryCollection* topStories){
        XCTAssertEqual([topStories topStories].count, 10, @"there should be 10 top stories");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

- (void)testLatestStories {
    XCTestExpectation* expectation = [self expectationWithDescription:@"fetch latest stories"];
    
    HackerNewsComm* comm = [HackerNewsComm new];
    [comm fetchLatestStories:^(StoryCollection* topStories){
        XCTAssertEqual([topStories topStories].count, 10, @"there should be 10 top stories");
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

- (void)testPopulateStories {
    XCTestExpectation* expectationTop = [self expectationWithDescription:@"fetch top stories"];
    
    HackerNewsComm* comm = [HackerNewsComm new];
    
    [comm fetchLatestStories:^(StoryCollection * collection) {
        NSArray<Story*>* top = [collection topStories];
        
        __block int count = 0;
        
        for( Story* currentStory in top ){
            [comm fetchStory:currentStory withCompletionCallback:^(Story* story){
                NSLog(@"title: %@, url: %@", story.title, story.url);
                count ++;
                
                if( count == 10 ){
                    [expectationTop fulfill];
                }
            }];
        }
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end
