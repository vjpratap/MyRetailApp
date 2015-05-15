//
//  ItemListTableViewController.m
//  Retail
//
//  Created by Vijay Pratap Singh on 29/04/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "ItemListTableViewController.h"
#import "ItemDetailViewController.h"
#import "ItemListCell.h"

@interface ItemListTableViewController()
@end

@implementation ItemListTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemListCell *cell = (ItemListCell *)[tableView dequeueReusableCellWithIdentifier:@"Item"];
    
    cell.itemImage.image = [UIImage imageNamed:[self.items objectAtIndex:[indexPath row]][@"image"]];
    cell.itemLable.text = [self.items objectAtIndex:[indexPath row]][@"item"];
    cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailViewController *itemVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemDetail"];
    itemVC.selectedItem = [self.items objectAtIndex:[indexPath row]][@"item"];
    
    [self.navigationController pushViewController:itemVC animated:YES];
}




@end
