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
#warning TODO!!
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
#warning TODO
}

-(void)save
{
#warning TODO
}

@end
