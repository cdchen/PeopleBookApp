//
//  MainViewController.h
//  PeopleBookApp
//
//  Created by Cd Chen on 12/9/6.
//  Copyright (c) 2012年 Cd Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PeopleRepository;

@interface MainViewController : UITableViewController
{
    PeopleRepository *_repository;
}

-(IBAction)editButtonDidClicked:(id)sender;

@end
