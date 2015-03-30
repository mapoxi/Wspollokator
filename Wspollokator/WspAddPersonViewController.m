//
//  WspAddPersonViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 23.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspAddPersonViewController.h"
#import "NSManagedObject+CRUD.h"
#import "Person.h"

@interface WspAddPersonViewController ()

@property (weak, nonatomic) IBOutlet UITextField *addNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *addNickTextBox;

@end

@implementation WspAddPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (IBAction)addPersonButton:(id)sender {
    NSArray *howManyCount = [Person readAllObjects];
    Person *lastPerson = [howManyCount lastObject];
    Person *addNewPerson = [Person createObject];
    addNewPerson.personName = _addNameTextBox.text;
    addNewPerson.personNick = _addNickTextBox.text;
    addNewPerson.personID = lastPerson.personID + 1;
    [Person saveDatabase];
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
