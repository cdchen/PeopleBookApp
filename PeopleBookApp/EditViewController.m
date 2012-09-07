//
//  EditViewController.m
//  PeopleBookApp
//
//  Created by Cd Chen on 12/9/6.
//  Copyright (c) 2012年 Cd Chen. All rights reserved.
//

#import "EditViewController.h"
#import "AppDelegate.h"
#import "PeopleRepository.h"
#import "People.h"

@interface EditViewController ()

@end

@implementation EditViewController
@synthesize nameField = _nameField;
@synthesize ageField = _ageField;


-(void)saveButtonDidClicked:(id)sender
{
    NSString *name = self.nameField.text;
    NSInteger age = [self.ageField.text intValue];

    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    PeopleRepository *repo = [appDelegate repository];
    People *people = [[People alloc] initWithName:name age:age];
    [repo addPeople:people];
    [people release];
    [repo save];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc
{
    [_nameField release];
    [_ageField release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
