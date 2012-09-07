//
//  ViewController.h
//  PeopleBookApp
//
//  Created by Cd Chen on 12/9/6.
//  Copyright (c) 2012年 Cd Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain) IBOutlet UILabel *nameLabel;
@property (retain) IBOutlet UILabel *ageLabel;
@property NSInteger peopleIndex;

-(IBAction)deleteButtonDidClicked:(id)sender;

@end
