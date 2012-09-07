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

#pragma mark -
#pragma NSXMLParserDelegate

#define TAG_UNKNOWN 0
#define TAG_NAME    1
#define TAG_AGE     2


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    _currentTag = TAG_UNKNOWN;
    
    if ([elementName isEqualToString:@"people"] == YES) {
        _currentPeople = [[People alloc] init];
    } else {
    
        if (_currentPeople != nil) {
            if ([elementName isEqualToString:@"name"] == YES) {
                _currentTag = TAG_NAME;
            }
    
            if ([elementName isEqualToString:@"age"] == YES) {
                _currentTag = TAG_AGE;
            }
        }
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    _currentTag = TAG_UNKNOWN;
    
    if ([elementName isEqualToString:@"people"] == YES) {
        if (_currentPeople != nil) {
            [self addPeople:_currentPeople];
            
//            [_currentPeople release];
        }
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (_currentPeople != nil) {
        switch(_currentTag) {
            case TAG_NAME:
                _currentPeople.name = string;
                break;
                
            case TAG_AGE:
                _currentPeople.age = [string intValue];
                break;
        }
    }
}

#pragma mark - 
#pragma PeopleRepository

+(NSString *)repositoryLocation
{
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return [docPath stringByAppendingPathComponent:@"peoples.xml"];
}

+(BOOL)copyRepositoryToLocation
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *srcPath = [bundle pathForResource:@"peoples" ofType:@"xml"];
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

    NSData *data = [NSData dataWithContentsOfFile:[PeopleRepository repositoryLocation]];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
}

-(void)save
{
    NSMutableString *content = [[NSMutableString alloc] init];
    [content appendFormat:@"<peoples>"];
    for (People *p in _datas) {
        [content appendFormat:@"<people><name>%@</name><age>%d</age></people>", p.name, p.age];
    }
    [content appendFormat:@"</peoples>"];

    [content writeToFile:[PeopleRepository repositoryLocation] atomically:YES encoding:NSStringEncodingConversionAllowLossy error:nil];
}

@end
