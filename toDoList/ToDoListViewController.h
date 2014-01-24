//
//  toDoListViewController.h
//  toDoList
//
//  Created by Alberto Campos on 1/23/14.
//  Copyright (c) 2014 Alberto Campos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray *objects;
@property (nonatomic, strong) NSMutableArray *results;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;



@end
