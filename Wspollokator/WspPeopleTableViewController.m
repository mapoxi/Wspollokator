//
//  WspPeopleTableViewController.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 22.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "WspPeopleTableViewController.h"
#import "WspAddPersonViewController.h"
#import "WspPeopleViewTableViewCell.h"
#import "NSManagedObject+CRUD.h"
#import "Person.h"

@interface WspPeopleTableViewController ()

@property WspPeopleViewTableViewCell *wspPeopleViewTableViewCell;
@property (strong, nonatomic) NSArray *people;

@end

@implementation WspPeopleTableViewController

- (void)viewDidAppear {
    _people = [Person readAllObjects];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Osoby";
    _wspPeopleViewTableViewCell = [[WspPeopleViewTableViewCell alloc] init];
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
    static NSString *CellIdentifier = @"peopleTableViewCell";
    WspPeopleViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell) {
        [tableView registerNib: [UINib nibWithNibName:@"WspPeopleTableViewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    return cell;

}
- (void)tableView:(UITableView *)tableView willDisplayCell:(WspPeopleViewTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    Person *readPerson = _people[indexPath.row];
    cell.nameLabel.text = readPerson.personName;
    cell.nickLabel.text = readPerson.personNick;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
