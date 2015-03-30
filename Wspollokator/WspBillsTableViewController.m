//
//  WspBillsTableViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 28.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspBillsTableViewController.h"
#import "WspBillTableViewController.h"
#import "WspBillsTableViewCell.h"
#import "NSManagedObject+CRUD.h"
#import "Bills.h"


@interface WspBillsTableViewController ()
@property WspBillsTableViewCell *wspBillTableViewCell;
@property WspBillTableViewController *wspBillTableViewController;
@property (strong, nonatomic) NSArray *bills;

@end

@implementation WspBillsTableViewController

- (void)viewDidAppear:(BOOL)animated {
    _bills = [Bills readAllObjects];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _wspBillTableViewCell = [[WspBillsTableViewCell alloc] init];
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addBill:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_bills count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    WspBillsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell) {
        [tableView registerNib: [UINib nibWithNibName:@"WspBillsTableViewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(WspBillsTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    Bills *readBill = _bills[indexPath.row];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd.MM.YYYY";
    cell.billNameLabel.text = readBill.billName;
    cell.billDateLabel.text = [formatter stringFromDate:readBill.billDate];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showBillSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showBillSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        _wspBillTableViewController = [[WspBillTableViewController alloc] init];
        _wspBillTableViewController.actualBill = [_bills objectAtIndex:indexPath.row];
    }
}

@end
