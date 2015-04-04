//
//  WspBillTableViewCell.h
//  Wspollokator
//
//  Created by Piotr Mlynarski on 03.04.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WspBillTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *productNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberOfProductLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UISwitch *switch1;
@property (strong, nonatomic) IBOutlet UISwitch *switch2;
@property (strong, nonatomic) IBOutlet UISwitch *switch3;
@property (strong, nonatomic) IBOutlet UISwitch *switch4;
@property (strong, nonatomic) IBOutlet UISwitch *switch5;
@property (strong, nonatomic) IBOutlet UISwitch *switch6;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel1;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel2;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel3;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel4;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel5;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel6;

@property (strong, nonatomic) NSArray *people;
- (void)addBlinkPosition: (int)aSwitchTag;

@end
