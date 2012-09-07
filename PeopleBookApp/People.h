//
//  People.h
//  PeopleBookApp
//
//  Created by Cd Chen on 12/9/7.
//  Copyright (c) 2012年 Cd Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property (retain) NSString *name;
@property NSInteger age;

-(id)initWithName:(NSString *)name age:(NSInteger)age;

@end
