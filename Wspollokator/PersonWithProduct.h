//
//  PersonWithProduct.h
//  Wspollokator
//
//  Created by Piotr Mlynarski on 04.04.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PersonWithProduct : NSManagedObject

@property (nonatomic, retain) NSNumber * billID;
@property (nonatomic, retain) NSNumber * personID;
@property (nonatomic, retain) NSNumber * positionIsOn;
@property (nonatomic, retain) NSNumber * productID;
@property (nonatomic, retain) NSNumber * pWPID;

@end
