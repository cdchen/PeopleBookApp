//
//  AppDelegate.h
//  PeopleBookApp
//
//  Created by Cd Chen on 12/9/6.
//  Copyright (c) 2012年 Cd Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PeopleRepository;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly) PeopleRepository *repository;

@end
