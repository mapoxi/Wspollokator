//
//  WspBillTableViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 29.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspBillTableViewController.h"

@interface WspBillTableViewController ()

@end

@implementation WspBillTableViewController

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addProductButton:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _actualBill.billName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}

@end
