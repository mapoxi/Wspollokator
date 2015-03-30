//
//  PersonWithProduct.h
//  Wspollokator
//
//  Created by Piotr Mlynarski on 30.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PersonWithProduct : NSManagedObject

@property (nonatomic) int billID;
@property (nonatomic) int positionIsOn;
@property (nonatomic) int productID;
@property (nonatomic) int personID;
@property (nonatomic) int pWPID;

@end
