//
//  ItemDetailViewController.m
//  Retail
//
//  Created by Vijay Pratap Singh on 30/04/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "CartItemDetails.h"
#import "CartItemViewController.h"

static NSDictionary *itemDetailsDictionary;

@interface ItemDetailViewController ()
{
 
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLable;
@property (weak, nonatomic) IBOutlet UIImageView *displeyImageView;

@end

@implementation ItemDetailViewController

+(void)initialize {
    itemDetailsDictionary = @{@"TV":
  @{@"title": @"Sony HD TV", @"price": @"12,000 ₹", @"description":@"This is an awesome TV", @"image":@"tv"},
                              @"AC":
                                  @{@"title": @"Samsung AC", @"price": @"15,000 ₹", @"description":@"This is an awesome AC", @"image":@"ac"},
                              @"Printer":
                                  @{@"title": @"HP printer", @"price": @"5,000 ₹", @"description":@"This is an awesome printer", @"image":@"printer"},
                              @"Sofa":
                                  @{@"title": @"Italiano Sofa", @"price": @"19,000 ₹", @"description":@"This is an awesome Sofa", @"image":@"sofa"},
                              @"Chair":
                                  @{@"title": @"Italiano Chair", @"price": @"4,000 ₹", @"description":@"This is an awesome chair", @"image":@"chair"},
                              @"T-shirt":
                                  @{@"title": @"T-shirt", @"price": @"400 ₹", @"description":@"Feel like a Super Hero", @"image":@"t-shirt"},
                              @"Jeans":
                                  @{@"title": @"Jeans", @"price": @"800 ₹", @"description":@"Made for feel comfort", @"image":@"jeans"},
                              @"Cricket Bat":
                                  @{@"title": @"Cricket Bat", @"price": @"1,500 ₹", @"description":@"For playing good cricket", @"image":@"bat"},
                              @"Tennis Ball":
                                  @{@"title": @"Tennis Ball", @"price": @"150 ₹", @"description":@"For playing good tennis", @"image":@"ball"}};
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *key = _selectedItem;
    _titleLabel.text = itemDetailsDictionary[key][@"title"];
    _priceLabel.text = itemDetailsDictionary[key][@"price"];
    _descriptionLable.text = itemDetailsDictionary[key][@"description"];
    _displeyImageView.image = [UIImage imageNamed:itemDetailsDictionary[key][@"image"]];
                                                    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)addQuantity{
    NSMutableArray *itemsInCart = [NSMutableArray arrayWithArray:[CartItemDetails fetchFromDataBase]];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableArray *titles = [[NSMutableArray alloc]init];
    NSMutableArray *cartItemWithQuntity = [[NSMutableArray alloc]init];
    
    for (NSInteger i = 0; i < [itemsInCart count]; i++) {
        NSString *title = [[itemsInCart objectAtIndex:i] valueForKey:@"title"];
        if (![titles containsObject: title]) {
            [array addObject:@{@"item":title, @"index":[NSString stringWithFormat:@"%ld",(long)i]}];
        }
        
        [titles addObject:title];
        
    }
    
    for (NSDictionary *arr in array) {
        NSInteger i = 0;
        
        for (NSString *title in titles) {
            if ([arr[@"item"] isEqualToString:title]) {
                i = i + 1;
            }
        }
        NSDictionary *dictionary = @{@"title":[[itemsInCart objectAtIndex:[arr[@"index"] integerValue]] valueForKey:@"title"],
                                     @"image":[[itemsInCart objectAtIndex:[arr[@"index"] integerValue]] valueForKey:@"image"],
                                     @"price":[[itemsInCart objectAtIndex:[arr[@"index"] integerValue]] valueForKey:@"price"],
                                     @"description":[[itemsInCart objectAtIndex:[arr[@"index"] integerValue]] valueForKey:@"description"],
                                     @"quantity":[NSString stringWithFormat:@"%ld", (long)i]
                                     };
        [cartItemWithQuntity addObject:dictionary];
        
    }
    return cartItemWithQuntity;
}



- (IBAction)AddToCart:(id)sender {
    
    [CartItemDetails saveCartItem: itemDetailsDictionary[_selectedItem]];
    
//    [CartItemDetails fetchFromDataBase];
    UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil message:@"Item is added in cart" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [toast show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [toast dismissWithClickedButtonIndex:0 animated:YES];
    });
}


- (IBAction)ShowMyCartPage:(id)sender {

    NSMutableArray *mutableArray = [self addQuantity];
    CartItemViewController *itemVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CartItems"];
//    [sender setTitle:[NSString stringWithFormat:@"%lu",(unsigned long)[mutableArray count]]];
    
    itemVC.cartItemArray = mutableArray;
    [self.navigationController pushViewController:itemVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//}
*/

@end
