//
//  ItemListTableViewController.m
//  Retail
//
//  Created by Vijay Pratap Singh on 29/04/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "ItemListTableViewController.h"
#import "ItemDetailViewController.h"

@interface ItemListTableViewController()

@property(strong, nonatomic)NSMutableArray *item;

@property(strong, nonatomic)NSMutableDictionary *itemDetails;

@end

@implementation ItemListTableViewController


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Item"];
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailViewController *itemVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemDetail"];
    itemVC.items = [self.itemDetails objectForKey:[self.item objectAtIndex:[indexPath row]]];
    
    [self.navigationController pushViewController:itemVC animated:YES];
}




@end
