//
//  CartItemViewController.m
//  Retail
//
//  Created by Vijay Pratap Singh on 05/05/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "CartItemViewController.h"
#import "ItemDetailViewController.h"

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

- (IBAction)spicks:(id)sender {
    [self.cartItems removeObjectAtIndex:0];
    NSString *firstItem = self.cartItems[0];
    
    NSError *jsonError;
    NSData *objectData = [firstItem dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    
    NSString *imageName = [json objectForKey:@"image"];

    
    NSLog(@"%@",imageName);
    
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
