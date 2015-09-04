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
    return [self.cartItemArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemListCell *cell = (ItemListCell *)[tableView dequeueReusableCellWithIdentifier:@"SingleCartItem"];
    cell.itemImage.image = [UIImage imageNamed:[_cartItemArray objectAtIndex:[indexPath row]][@"image"]];
    cell.itemLable.text = [_cartItemArray objectAtIndex:[indexPath row]][@"title"];
    cell.cartItemPriceLable.text = [_cartItemArray objectAtIndex:[indexPath row]][@"price"];
    cell.cartItemQuantity.text = [@"" stringByAppendingString:[_cartItemArray objectAtIndex:[indexPath row]][@"quantity"]];
    return cell;
}


-(void)setLableProperty:(UILabel*)label sectionHeaderView: (UIView *)sectionHeaderView labelText: (NSString*)text{
    [label setFont:[UIFont fontWithName:@"Verdana" size:20.0]];
    [sectionHeaderView addSubview:label];
    label.text = text;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc]init];
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
