//
//  CartItem.h
//  Retail
//
//  Created by Vijay Pratap Singh on 06/05/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"


@interface CartItemDetails : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * discription;
@property (nonatomic, retain) NSString * image;

+(void)saveCartItem:(NSDictionary *)itemDetails;

@end
