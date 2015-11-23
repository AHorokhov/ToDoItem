//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by Alex on 16/11/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "TLToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

NSString *ReuseIdentifier = @"ListPrototypeCell";

@interface TLToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end

@implementation TLToDoListTableViewController

    - (void)loadInitialData {
        ToDoItem *item1 = [[ToDoItem alloc] init];
        item1.itemName = @"Drink vodka";
        [self.toDoItems addObject:item1];
        ToDoItem *item2 = [[ToDoItem alloc] init];
        item2.itemName = @"Play dotka";
        [self.toDoItems addObject:item2];
        ToDoItem *item3 = [[ToDoItem alloc] init];
        item3.itemName = @"Listen to balalayka";
        [self.toDoItems addObject:item3];
    }


- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    AddToDoItemViewController *source = [segue sourceViewController];
    ToDoItem *item = source.toDoItem;
    if (item != nil) {
    
    [self.toDoItems addObject:item];
    [self.tableView reloadData];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDoItems count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:ReuseIdentifier
                             forIndexPath:indexPath];
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    if (toDoItem.completed){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
    }
    [tableView endUpdates];
    
        
//        [self.toDoItems objectAtIndex:indexPath.row];
//        [self.toDoItems removeObject:indexPath];//remove array object
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [self.tableView reloadData];
    }
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        
//       
//      





#pragma mark - Table ciew delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
    
}
@end
