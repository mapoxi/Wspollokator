//
//  WspAddProductViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 03.04.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspAddProductViewController.h"
#import "NSManagedObject+CRUD.h"
#import "Product.h"

@interface WspAddProductViewController ()

@property (strong, nonatomic) IBOutlet UITextField *productNameTextBox;

@property (strong, nonatomic) IBOutlet UITextField *numberOfProductTextBox;

@property (strong, nonatomic) IBOutlet UITextField *productPriceTextBox;

@end

@implementation WspAddProductViewController

- (void)viewDidLoad {
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
    [Product saveDatabase];
    
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
