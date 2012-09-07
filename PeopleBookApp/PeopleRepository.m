//
//  PeopleRepository.m
//  PeopleBookApp
//
//  Created by Cd Chen on 12/9/7.
//  Copyright (c) 2012年 Cd Chen. All rights reserved.
//

#import "PeopleRepository.h"
#import "People.h"

@implementation PeopleRepository

+(NSString *)repositoryLocation
{
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return [docPath stringByAppendingPathComponent:@"peoples.plist"];
}

+(BOOL)copyRepositoryToLocation
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *srcPath = [bundle pathForResource:@"peoples" ofType:@"plist"];
    NSFileManager *fm = [NSFileManager defaultManager];
    return [fm copyItemAtPath:srcPath toPath:[PeopleRepository repositoryLocation] error:nil];
}

- (id)init
{
    self = [super init];
    if (self) {
        _datas = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [_datas release];
    [super dealloc];
}

-(void)addPeople:(People *)p
{
    [_datas addObject:p];
}

-(void)removePeople:(People *)p
{
    [_datas removeObject:p];
}

-(People *)peopleAtIndex:(NSInteger)index
{
    return [_datas objectAtIndex:index];
}

-(NSInteger)indexOfPeople:(People *)p
{
    return [_datas indexOfObject:p];
}

-(NSInteger)count
{
    return [_datas count];
}

-(void)load
{
    [_datas removeAllObjects];
    
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:[PeopleRepository repositoryLocation]];
    for (NSDictionary *dict in array) {
        NSString *name = [dict valueForKey:@"name"];
        NSInteger age = [[dict valueForKey:@"age"] intValue];
        People *people = [[People alloc]initWithName:name age:age];
        [_datas addObject:people];
        [people release];
    }

    [array release];
}

-(void)save
{
    [_datas writeToFile:[PeopleRepository repositoryLocation] atomically:YES];
}

@end
