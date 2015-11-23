//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by Alex on 16/11/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "TLToDoListTableViewController.h"

#import "TLAddToDoItemViewController.h"
#import "TLToDoItem.h"


static NSString *defaultCellReuseIdentifier = @"ListPrototypeCell";

@interface TLToDoListTableViewController ()

@property (nonatomic, strong) NSMutableArray *toDoItems;

@end

@implementation TLToDoListTableViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Protocols

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:defaultCellReuseIdentifier
                             forIndexPath:indexPath];
    TLToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
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
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
    }
   
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    TLToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
    
}


#pragma mark - Public

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    TLAddToDoItemViewController *source = [segue sourceViewController];
    TLToDoItem *item = source.toDoItem;
    if (item != nil) {
        
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}

#pragma mark - Private

- (void)loadInitialData {
        TLToDoItem *item1 = [[TLToDoItem alloc] init];
        item1.itemName = @"Drink vodka";
        [self.toDoItems addObject:item1];
        TLToDoItem *item2 = [[TLToDoItem alloc] init];
        item2.itemName = @"Play dotka";
        [self.toDoItems addObject:item2];
        TLToDoItem *item3 = [[TLToDoItem alloc] init];
        item3.itemName = @"Listen to balalayka";
        [self.toDoItems addObject:item3];
    }



@end

