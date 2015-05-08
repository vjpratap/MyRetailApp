//
//  CartItemViewController.h
//  Retail
//
//  Created by Vijay Pratap Singh on 08/05/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "BaseViewController.h"

@interface CartItemViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) NSMutableArray* itemsInCart;

@end
