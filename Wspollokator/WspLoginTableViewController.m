//
//  WspPeopleTableViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 22.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspLoginTableViewController.h"
#import "WspPeopleTableViewCell.h"
#import "NSManagedObject+CRUD.h"
#import "WspMainMenuViewController.h"
#import "Person.h"

@interface WspLoginTableViewController ()

@property WspPeopleTableViewCell *wspPeopleViewTableViewCell;
@property WspMainMenuViewController *wspMainMenuViewController;
@property (strong, nonatomic) NSArray *people;

@end

@implementation WspLoginTableViewController

- (void)viewDidAppear:(BOOL)animated {
    _people = [Person readAllObjects];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _wspPeopleViewTableViewCell = [[WspPeopleTableViewCell alloc] init];
    
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addPerson:(id)sender {
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
    return [_people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    WspPeopleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell) {
        [tableView registerNib: [UINib nibWithNibName:@"WspPeopleTableViewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(WspPeopleTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Person *readPerson = _people[indexPath.row];
    cell.nameLabel.text = readPerson.personName;
    cell.nickLabel.text = readPerson.personNick;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"mainMenuSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"mainMenuSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        _wspMainMenuViewController = segue.destinationViewController;
        _wspMainMenuViewController.loggedPerson = [_people objectAtIndex:indexPath.row];
    }
}

@end
