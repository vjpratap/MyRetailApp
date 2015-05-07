//
//  ViewController.m
//  Retail
//
//  Created by Vijay Pratap Singh on 29/04/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "ViewController.h"
#import "ItemListTableViewController.h"

@interface ViewController ()

@property (strong, nonatomic)NSMutableDictionary *categoryItems;
@property (strong, nonatomic)NSMutableArray *categories;
@end

@implementation ViewController

- (void)viewDidLoad
{
[super viewDidLoad];
// table view data is being set here
self.categoryItems = [[NSMutableDictionary alloc]init];
self.categories = [[NSMutableArray alloc]initWithObjects:@"Electronics",@"Furniture",@"Clothes",@"Sports", nil];
    
    NSMutableArray *electronicsItems = [[NSMutableArray alloc]initWithObjects:@{@"item":@"TV", @"image":@"tv"},@{@"item":@"AC", @"image":@"ac"},@{@"item":@"Printer", @"image":@"printer"}, nil];
[self.categoryItems setValue:electronicsItems forKey:@"Electronics"];
    
    NSMutableArray *furnitureItems = [[NSMutableArray alloc]initWithObjects:@{@"item":@"Sofa", @"image":@"sofa"},@{@"item":@"Chair", @"image":@"chair"}, nil];
[self.categoryItems setValue:furnitureItems forKey:@"Furniture"];
    
    NSMutableArray *clothesItems = [[NSMutableArray alloc]initWithObjects:@{@"item":@"T-shirt", @"image":@"t-shirt"},@{@"item":@"Jeans", @"image":@"jeans"}, nil];
[self.categoryItems setValue:clothesItems forKey:@"Clothes"];
    
    NSMutableArray *sportsItems = [[NSMutableArray alloc]initWithObjects:@{@"item":@"Cricket Bat", @"image":@"bat"},@{@"item":@"Tennis Ball", @"image":@"ball"}, nil];
[self.categoryItems setValue:sportsItems forKey:@"Sports"];


// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SingleCategory"];
    cell.textLabel.text = [self.categories objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemListTableViewController *itemList = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemList"];
    itemList.items = [self.categoryItems objectForKey:[self.categories objectAtIndex:[indexPath row]]];
    
    [self.navigationController pushViewController:itemList animated:YES];
}



@end
