//
//  WspAddBillViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 28.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspAddBillViewController.h"
#import "NSManagedObject+CRUD.h"
#import "Bills.h"

@interface WspAddBillViewController ()

@property (strong, nonatomic) IBOutlet UITextField *addShopNameTextBox;

@property (strong, nonatomic) IBOutlet UIDatePicker *addBillDatePicker;

@end

@implementation WspAddBillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (IBAction)addBillButton:(id)sender {
    NSArray *howManyCount = [Bills readAllObjects];
    Bills *lastBill = [howManyCount lastObject];
    Bills *addNewBill = [Bills createObject];
    addNewBill.billName = _addShopNameTextBox.text;
    addNewBill.billDate = _addBillDatePicker.date;
    addNewBill.billIsActive = 1;
    addNewBill.billID = lastBill.billID + 1;
    [Bills saveDatabase];
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
