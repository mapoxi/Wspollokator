//
//  Bills.h
//  Wspollokator
//
//  Created by Piotr Mlynarski on 04.04.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Bills : NSManagedObject

@property (nonatomic, retain) NSDate * billDate;
@property (nonatomic, retain) NSNumber * billID;
@property (nonatomic, retain) NSNumber * billIsActive;
@property (nonatomic, retain) NSString * billName;

@end
