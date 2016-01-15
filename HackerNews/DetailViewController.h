//
//  DetailViewController.h
//  HackerNews
//
//  Created by Mac on 15/01/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Story.h"

@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) NSArray<Story*>* dataSource;

@end
