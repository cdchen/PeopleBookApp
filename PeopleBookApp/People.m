//
//  People.m
//  PeopleBookApp
//
//  Created by Cd Chen on 12/9/7.
//  Copyright (c) 2012年 Cd Chen. All rights reserved.
//

#import "People.h"

@implementation People
@synthesize name = _name;


-(id)initWithName:(NSString *)name age:(NSInteger)age
{
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
    }
    return self;
}

- (void)dealloc
{
    [_name release];
    [super dealloc];
}


@end
