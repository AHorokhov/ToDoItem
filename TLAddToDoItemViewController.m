//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by Alex on 16/11/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "TLAddToDoItemViewController.h"

@interface TLAddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation TLAddToDoItemViewController


#pragma mark - Lifecycle

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (sender != self.saveButton) return;
    
    if (self.textField.text.length > 2) {
        self.toDoItem = [[TLToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


#pragma mark - Protocols




#pragma mark - Public

#pragma mark - Private






@end
