//
//  ItemListTableViewController.m
//  Retail
//
//  Created by Vijay Pratap Singh on 29/04/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "ItemListTableViewController.h"

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



@end
