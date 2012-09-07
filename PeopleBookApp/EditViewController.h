//
//  EditViewController.h
//  PeopleBookApp
//
//  Created by Cd Chen on 12/9/6.
//  Copyright (c) 2012年 Cd Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController

@property (retain) IBOutlet UITextField *nameField;
@property (retain) IBOutlet UITextField *ageField;

-(IBAction)saveButtonDidClicked:(id)sender;

@end
