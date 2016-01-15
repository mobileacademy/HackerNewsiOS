//
//  MasterTableViewController.m
//  HackerNews
//
//  Created by Mac on 15/01/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import "MasterTableViewController.h"
#import "HackerNewsComm.h"
#import "StoryCollection.h"
#import "DetailViewController.h"

@interface MasterTableViewController ()

@property (nonatomic) HackerNewsComm* comm;
@property (nonatomic) DetailViewController* detailController;

@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.comm = [HackerNewsComm new];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if( indexPath.row == 0 ){
        [self.comm fetchTopStories:^(StoryCollection * stories) {
            __block int i = 0;
            
            for( Story* story in stories.topStories ){
                [self.comm fetchStory:story withCompletionCallback:^(Story *s) {
                    i++;
                    if( i >= stories.topStories.count ){
                        self.detailController.dataSource = stories.topStories;
                    }
                }];
            }
        }];
    }
    else{
        [self.comm fetchLatestStories:^(StoryCollection * stories) {
            __block int i = 0;
            
            for( Story* story in stories.topStories ){
                [self.comm fetchStory:story withCompletionCallback:^(Story *s) {
                    i++;
                    if( i >= stories.topStories.count ){
                        self.detailController.dataSource = stories.topStories;
                    }
                }];
            }
        }];
    }
}

#pragma mark - Table view data source

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.detailController = (DetailViewController*)segue.destinationViewController;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
