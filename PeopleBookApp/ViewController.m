//
//  ViewController.m
//  PeopleBookApp
//
//  Created by Cd Chen on 12/9/6.
//  Copyright (c) 2012年 Cd Chen. All rights reserved.
//

#import "ViewController.h"
#import "PeopleRepository.h"
#import "People.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize nameLabel = _nameLabel;
@synthesize ageLabel = _ageLabel;

-(void)deleteButtonDidClicked:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    PeopleRepository *repo = appDelegate.repository;
    People *people = [repo peopleAtIndex:self.peopleIndex];
    [repo removePeople:people];
    [repo save];

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc
{
    [_nameLabel release];
    [_ageLabel release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    People *people = [appDelegate.repository peopleAtIndex:self.peopleIndex];
    self.nameLabel.text = people.name;
    self.ageLabel.text = [NSString stringWithFormat:@"%d", people.age];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
