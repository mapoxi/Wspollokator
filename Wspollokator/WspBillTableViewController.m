//
//  WspBillTableViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 29.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "NSManagedObject+CRUD.h"
#import "Product.h"
#import "PersonWithProduct.h"
#import "WspBillTableViewCell.h"
#import "WspBillTableViewController.h"
#import "WspAddProductViewController.h"

@interface WspBillTableViewController ()

@property WspAddProductViewController *wspAddProductViewController;
@property WspBillTableViewCell *wspBillTableViewCell;
@property (strong, nonatomic) NSArray *product;

@end

@implementation WspBillTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _actualBill.billName;
    _wspBillTableViewCell = [[WspBillTableViewCell alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {
    _product = [Product readAllObjects];
    [self.tableView reloadData];
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addProductButton:(id)sender {
    [self performSegueWithIdentifier:@"addProductSegue" sender:self];
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
    // Return the number of rows in the section.
    return [_product count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 86;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"WspBillTableViewCell";
    WspBillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell) {
        [tableView registerNib: [UINib nibWithNibName:@"WspBillTableViewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(WspBillTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    Product *writeProduct = _product[indexPath.row];
    cell.productNameLabel.text = writeProduct.productName;
    cell.numberOfProductLabel.text = [NSString stringWithFormat: @"%d", writeProduct.numberOfProduct];
    cell.priceLabel.text = [NSString stringWithFormat: @"%f", writeProduct.productPrice];
    
    if (!cell.switch1.tag) {
        cell.switch1.tag = (writeProduct.productID*10) + 1;
        cell.switch2.tag = (writeProduct.productID*10) + 2;
        cell.switch3.tag = (writeProduct.productID*10) + 3;
        cell.switch4.tag = (writeProduct.productID*10) + 4;
        cell.switch5.tag = (writeProduct.productID*10) + 5;
        cell.switch6.tag = (writeProduct.productID*10) + 6;
        
        PersonWithProduct *lookSwitch1 = [PersonWithProduct readObjectWithParamterName:@"pWPID" andValue:[NSNumber numberWithInteger:cell.switch1.tag]];
        if ([lookSwitch1.positionIsOn isEqual: [NSNumber numberWithInt: 1]]) {
            cell.switch1.on = YES;
        }
        PersonWithProduct *lookSwitch2 = [PersonWithProduct readObjectWithParamterName:@"pWPID" andValue:[NSNumber numberWithInteger:cell.switch2.tag]];
        if ([lookSwitch2.positionIsOn isEqual: [NSNumber numberWithInt: 1]]) {
            cell.switch2.on = YES;
        }
        PersonWithProduct *lookSwitch3 = [PersonWithProduct readObjectWithParamterName:@"pWPID" andValue:[NSNumber numberWithInteger:cell.switch3.tag]];
        if ([lookSwitch3.positionIsOn isEqual: [NSNumber numberWithInt: 1]]) {
            cell.switch3.on = YES;
        }
        PersonWithProduct *lookSwitch4 = [PersonWithProduct readObjectWithParamterName:@"pWPID" andValue:[NSNumber numberWithInteger:cell.switch4.tag]];
        if ([lookSwitch4.positionIsOn isEqual: [NSNumber numberWithInt: 1]]) {
            cell.switch4.on = YES;
        }
        PersonWithProduct *lookSwitch5 = [PersonWithProduct readObjectWithParamterName:@"pWPID" andValue:[NSNumber numberWithInteger:cell.switch5.tag]];
        if ([lookSwitch5.positionIsOn isEqual: [NSNumber numberWithInt: 1]]) {
            cell.switch5.on = YES;
        }
        PersonWithProduct *lookSwitch6 = [PersonWithProduct readObjectWithParamterName:@"pWPID" andValue:[NSNumber numberWithInteger:cell.switch6.tag]];
        if ([lookSwitch6.positionIsOn isEqual: [NSNumber numberWithInt: 1]]) {
            cell.switch6.on = YES;
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addProductSegue"]) {
        _wspAddProductViewController = [[WspAddProductViewController alloc] init];
        _wspAddProductViewController.actualBill = _actualBill;
    }
}

@end
