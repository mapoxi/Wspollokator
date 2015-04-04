//
//  WspAddProductViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 03.04.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspAddProductViewController.h"
#import "WspBillTableViewCell.h"
#import "NSManagedObject+CRUD.h"
#import "Product.h"
#import "PersonWithProduct.h"

@interface WspAddProductViewController ()

@property (strong, nonatomic) IBOutlet UITextField *productNameTextBox;
@property (strong, nonatomic) IBOutlet UITextField *numberOfProductTextBox;
@property (strong, nonatomic) IBOutlet UITextField *productPriceTextBox;
@property WspBillTableViewCell *wspBillTableViewCell;
@end

@implementation WspAddProductViewController

- (void)viewDidLoad {
    _wspBillTableViewCell = [[WspBillTableViewCell alloc] init];
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (IBAction)addProductToBillButton:(id)sender {
    NSArray *howManyCount = [Product readAllObjects];
    
    Product *lastProductID = [howManyCount lastObject];
    Product *addNewProduct = [Product createObject];
    addNewProduct.productName = _productNameTextBox.text;
    addNewProduct.numberOfProduct = [_numberOfProductTextBox.text intValue];
    addNewProduct.productPrice = [_productPriceTextBox.text floatValue];
    addNewProduct.productID = lastProductID.productID + 1;
    addNewProduct.numberOfPerson = 0;
    addNewProduct.numberOfBill = _actualBill.billID;
    [Product saveDatabase];

    
    //1..............
    
    [_wspBillTableViewCell addBlinkPosition:(addNewProduct.productID*10+1)];
    [_wspBillTableViewCell addBlinkPosition:(addNewProduct.productID*10+2)];
    [_wspBillTableViewCell addBlinkPosition:(addNewProduct.productID*10+3)];
    [_wspBillTableViewCell addBlinkPosition:(addNewProduct.productID*10+4)];
    [_wspBillTableViewCell addBlinkPosition:(addNewProduct.productID*10+5)];
    [_wspBillTableViewCell addBlinkPosition:(addNewProduct.productID*10+6)];
    
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
