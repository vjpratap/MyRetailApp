//
//  CartItem.m
//  Retail
//
//  Created by Vijay Pratap Singh on 06/05/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "CartItemDetails.h"


@implementation CartItemDetails

@dynamic title;
@dynamic price;
@dynamic discription;
@dynamic image;

static NSManagedObjectContext *managedObjectContext;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CartItemDetails" inManagedObjectContext:[CartItemDetails getManagedObjectContext]];
    CartItemDetails *cartItem = [[CartItemDetails alloc]initWithEntity:entity insertIntoManagedObjectContext:[CartItemDetails getManagedObjectContext]];
    cartItem.title = dictionary[@"title"];
    cartItem.price = dictionary[@"price"];
    cartItem.discription = dictionary[@"description"];
    cartItem.image = dictionary[@"image"];
    
    return cartItem;
}

+(void)saveCartItem:(NSDictionary *)itemDetails
{
    CartItemDetails *cartItem = [[CartItemDetails alloc]initWithDictionary:itemDetails];
    [[CartItemDetails getManagedObjectContext] save:nil];
}

+(NSManagedObjectContext *) getManagedObjectContext{
    if(!managedObjectContext)
    {
        AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        managedObjectContext = delegate.managedObjectContext;
    }
    
    return managedObjectContext;
}

@end
