//
//  Product.h
//  Wspollokator
//
//  Created by Piotr Mlynarski on 30.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Product : NSManagedObject

@property (nonatomic) int productID;
@property (nonatomic) float productPrice;
@property (nonatomic, retain) NSString * productName;
@property (nonatomic) int numberOfProduct;
@property (nonatomic) int numberOfPerson;
@property (nonatomic) NSNumber *numberOfBill;

@end
