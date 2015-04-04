//
//  WspBillTableViewCell.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 03.04.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspBillTableViewCell.h"
#import "NSManagedObject+CRUD.h"
#import "Person.h"
#import "Product.h"
#import "PersonWithProduct.h"

@implementation WspBillTableViewCell

- (void)awakeFromNib {
    
    _nameLabel1.hidden = YES;
    _nameLabel2.hidden = YES;
    _nameLabel3.hidden = YES;
    _nameLabel4.hidden = YES;
    _nameLabel5.hidden = YES;
    _nameLabel6.hidden = YES;
    
    _switch1.hidden = YES;
    _switch2.hidden = YES;
    _switch3.hidden = YES;
    _switch4.hidden = YES;
    _switch5.hidden = YES;
    _switch6.hidden = YES;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    _people = [Person readAllObjects];
    
    if ([_people count] > 0) {
        Person *person = _people[0];
        _switch1.hidden = NO;
        _nameLabel1.hidden = NO;
        _nameLabel1.text = [NSString stringWithFormat:@"%@", person.personNick];
        _nameLabel1.adjustsFontSizeToFitWidth = YES;
    }
    if ([_people count] > 1) {
        Person *person = _people[1];
        _switch2.hidden = NO;
        _nameLabel2.hidden = NO;
        _nameLabel2.text = [NSString stringWithFormat:@"%@", person.personNick];
        _nameLabel2.adjustsFontSizeToFitWidth = YES;
    }
    if ([_people count] > 2) {
        Person *person = _people[2];
        _switch3.hidden = NO;
        _nameLabel3.hidden = NO;
        _nameLabel3.text = [NSString stringWithFormat:@"%@", person.personNick];
        _nameLabel3.adjustsFontSizeToFitWidth = YES;
    }
    if ([_people count] > 3) {
        Person *person = _people[3];
        _switch4.hidden = NO;
        _nameLabel4.hidden = NO;
        _nameLabel4.text = [NSString stringWithFormat:@"%@", person.personNick];
        _nameLabel4.adjustsFontSizeToFitWidth = YES;
    }
    if ([_people count] > 4) {
        Person *person = _people[4];
        _switch5.hidden = NO;
        _nameLabel5.hidden = NO;
        _nameLabel5.text = [NSString stringWithFormat:@"%@", person.personNick];
        _nameLabel5.adjustsFontSizeToFitWidth = YES;
    }
    if ([_people count] > 5) {
        Person *person = _people[5];
        _switch6.hidden = NO;
        _nameLabel6.hidden = NO;
        _nameLabel6.text = [NSString stringWithFormat:@"%@", person.personNick];
        _nameLabel6.adjustsFontSizeToFitWidth = YES;
    }
}

- (IBAction)clickSwitch: (UISwitch *) aSwitch {
    /*NSNumber *prodID = [NSNumber numberWithLong:((aSwitch.tag - (aSwitch.tag%10))/10)];
    Product  *record = [Product readObjectWithParamterName:@"productID" andValue:prodID];
    PersonWithProduct *editPWPID = [PersonWithProduct readObjectWithParamterName:@"pWPID" andValue:[NSNumber numberWithLong: aSwitch.tag]];
    
    if(aSwitch.isOn) {
        record.numberOfPerson = record.numberOfPerson + 1;
        editPWPID.positionIsOn = 1;
    }
    else {
        record.numberOfPerson = record.numberOfPerson - 1;
        editPWPID.positionIsOn = 0;
    }
    [Product saveDatabase];
    [PersonWithProduct saveDatabase];*/
}

- (void)addBlinkPosition: (int)aSwitchTag {
    NSLog(@"1 -> %d", aSwitchTag);
    PersonWithProduct *addNewPosition = [PersonWithProduct createObject];
    
    addNewPosition.pWPID = aSwitchTag;
    addNewPosition.personID = aSwitchTag%10;
    addNewPosition.productID = (aSwitchTag - (aSwitchTag%10))/10;
    addNewPosition.positionIsOn = 0;
    
    NSLog(@"2 -> PWP %d %d %d %d", addNewPosition.pWPID, addNewPosition.personID, addNewPosition.productID, addNewPosition.positionIsOn);
    
    [PersonWithProduct saveDatabase];
    
    NSArray *ABPArray = [PersonWithProduct readAllObjects];
    PersonWithProduct *ABP = [ABPArray lastObject];
    NSLog(@"3 -> PWP %d %d %d %d", ABP.pWPID, ABP.personID, ABP.productID, ABP.positionIsOn);

}


@end
