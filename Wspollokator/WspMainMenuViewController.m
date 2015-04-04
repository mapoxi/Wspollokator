//
//  WspMainMenuViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 22.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspMainMenuViewController.h"
#import "WspPeopleTableViewController.h"
#import "NSManagedObject+CRUD.h"
#import "PersonWithProduct.h"

@interface WspMainMenuViewController ()

@end

@implementation WspMainMenuViewController

- (IBAction)Wspollokatorzy:(id)sender {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    NSArray *ABPArray = [PersonWithProduct readAllObjects];
    PersonWithProduct *ABP = [ABPArray lastObject];
    NSLog(@"4. Main      %d %d %d %d", ABP.pWPID, ABP.personID, ABP.productID, ABP.positionIsOn);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
