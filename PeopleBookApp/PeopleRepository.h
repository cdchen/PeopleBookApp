//
//  PeopleRepository.h
//  PeopleBookApp
//
//  Created by Cd Chen on 12/9/7.
//  Copyright (c) 2012年 Cd Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class People;

@interface PeopleRepository : NSObject
{
    NSMutableArray *_datas;
}

+(NSString *)repositoryLocation;
+(BOOL)copyRepositoryToLocation;
-(void)addPeople:(People *)p;
-(void)removePeople:(People *)p;
-(NSInteger)indexOfPeople:(People *)p;
-(People *)peopleAtIndex:(NSInteger)index;
-(NSInteger)count;
-(void)load;
-(void)save;


@end
