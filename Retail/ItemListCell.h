//
//  ItemListCell.h
//  Retail
//
//  Created by Vijay Pratap Singh on 07/05/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemLable;

@end
