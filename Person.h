//
//  Person.h
//  Wspollokator
//
//  Created by Piotr Mlynarski on 30.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic) int personID;
@property (nonatomic, retain) NSString * personName;
@property (nonatomic, retain) NSString * personNick;

@end
