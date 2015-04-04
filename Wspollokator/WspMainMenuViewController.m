//
//  WspMainMenuViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 22.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspMainMenuViewController.h"
#import "WspPeopleTableViewController.h"
#import "PersonWithProduct.h"
#import "NSManagedObject+CRUD.h"

@interface WspMainMenuViewController ()

@end

@implementation WspMainMenuViewController

- (IBAction)Wspollokatorzy:(id)sender {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *test = [PersonWithProduct readAllObjects];
    PersonWithProduct *kokos = [test lastObject];
    NSLog(@"%d %d", kokos.personID, kokos.productID);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
