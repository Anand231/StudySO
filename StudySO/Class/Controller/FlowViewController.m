//
//  FlowViewController.m
//  StudySO
//
//  Created by ZhangYiCheng on 12-12-28.
//  Copyright (c) 2012年 ZhangYiCheng. All rights reserved.
//

#import "FlowViewController.h"
#import "FlowCell.h"
#import "FlowManager.h"

@interface FlowViewController ()

@property (strong, nonatomic) NSMutableArray *notificationIDs;
@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation FlowViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerCallback];
    
    [[FlowManager shareManager] getAllFlows];
}

- (void)registerCallback {
    id notificationid = [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFICATION_FLOW_SUCCESS object:nil queue:nil usingBlock:^(NSNotification *note){
        
        self.items = note.userInfo[@"output"];
        [self.tableView reloadData];
        
    }];
    [self.notificationIDs addObject:notificationid];
    
    notificationid = [[NSNotificationCenter defaultCenter] addObserverForName:NOTIFICATION_MOREFLOW_SUCCESS object:nil queue:nil usingBlock:^(NSNotification *note){
        
        [self.items addObjectsFromArray:note.userInfo[@"output"]];
        [self.tableView reloadData];
        
    }];
    [self.notificationIDs addObject:notificationid];
}

- (void)unRegisterCallback {
    for (id notificationid in self.notificationIDs) {
        [[NSNotificationCenter defaultCenter] removeObserver:notificationid];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [self unRegisterCallback];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FlowCell";
    FlowCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[FlowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
