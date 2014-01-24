//
//  toDoListViewController.m
//  toDoList
//
//  Created by Alberto Campos on 1/23/14.
//  Copyright (c) 2014 Alberto Campos. All rights reserved.
//

#import "ToDoListViewController.h"
#import "DetailViewController.h"

@interface ToDoListViewController ()

@end

@implementation ToDoListViewController

- (NSMutableArray *)objects
{
    if (!_objects)
    {
        _objects = [[NSMutableArray alloc]init];
    }
    
    return _objects;
}

- (NSMutableArray *)results
{
    if (!_results)
    {
        _results = [[NSMutableArray alloc]init];
    }
    return _results;
}


//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // retrieve tasks if User has already enabled them.
    
    [self.objects addObject:@"Alberto"];
    [self.objects addObject:@"Campos"];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)searchThroughTasks
{
    self.results = nil;
    
    NSPredicate *resultsPredicate = [NSPredicate predicateWithFormat:@"SELF contains [search] %@", self.searchBar.text];
    
    self.results = [[self.objects filteredArrayUsingPredicate:resultsPredicate] mutableCopy];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self searchThroughTasks];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView)
    {
        return self.objects.count;
    }
    else
    {
        [self searchThroughTasks];
        return self.results.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    }
    if (tableView == self.tableView) {
        cell.textLabel.text = self.objects[indexPath.row];
    }
    else {
        cell.textLabel.text = self.results[indexPath.row];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.searchDisplayController.isActive) {
		[self performSegueWithIdentifier:@"ShowDetail" sender:self];
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        

        if ([[segue identifier] isEqualToString:@"ShowDetail"])
        {
            NSString *object = nil;
            NSIndexPath *indexPath = nil;
            
            if (self.searchDisplayController.isActive) {
                indexPath = [[self.searchDisplayController searchResultsTableView] indexPathForSelectedRow];
                object = self.results[indexPath.row];
            } else {
                indexPath = [self.tableView indexPathForSelectedRow];
                object = self.objects[indexPath.row];
            }
            
            [[segue destinationViewController] setDetailLabelContents:object];
        }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */




@end
