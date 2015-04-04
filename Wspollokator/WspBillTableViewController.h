//
//  WspBillTableViewController.h
//  Wspollokator
//
//  Created by Piotr Mlynarski on 29.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bills.h"

@interface WspBillTableViewController : UITableViewController

@property (nonatomic, strong) Bills *currentBill;

@end
