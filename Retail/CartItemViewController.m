//
//  CartItemViewController.m
//  Retail
//
//  Created by Vijay Pratap Singh on 08/05/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "CartItemViewController.h"
#import "CartItemDetails.h"
#import "ItemListCell.h"

@interface CartItemViewController ()

@end

@implementation CartItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.itemsInCart count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemListCell *cell = (ItemListCell *)[tableView dequeueReusableCellWithIdentifier:@"SingleCartItem"];
    cell.itemImage.image = [UIImage imageNamed:[[self.itemsInCart objectAtIndex:[indexPath row]] valueForKey:@"image"]];
    cell.itemLable.text = [[self.itemsInCart objectAtIndex:[indexPath row]] valueForKey:@"title"];
    cell.cartItemPriceLable.text = [[self.itemsInCart objectAtIndex:[indexPath row]] valueForKey:@"price"];

    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
