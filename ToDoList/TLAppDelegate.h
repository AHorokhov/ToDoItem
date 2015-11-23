//
//  AppDelegate.h
//  ToDoList
//
//  Created by Alex on 12/11/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

