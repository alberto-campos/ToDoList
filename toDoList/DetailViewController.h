//
//  DetailViewController.h
//  toDoList
//
//  Created by Alberto Campos on 1/23/14.
//  Copyright (c) 2014 Alberto Campos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *detailTextBox;
@property (weak, nonatomic) NSString *detailLabelContents;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;


@end
