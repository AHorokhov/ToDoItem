//
//  ToDoItem.h
//  ToDoList
//
//  Created by Alex on 17/11/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLToDoItem : NSObject
@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
