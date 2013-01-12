//
//  MemberVO.m
//  TableTopics
//
//  Created by k526712 on 12/12/12.
//
//

#import "MemberVO.h"

@implementation MemberVO

@synthesize firstName;
@synthesize lastName;
@synthesize isMemberSelected;
@synthesize timesCalledOn;
@synthesize objectId;


-(NSString *)printFullName
{
    NSMutableString *displayName = [[NSMutableString alloc]init];
    [displayName appendString:self.firstName];
    [displayName appendString:@" "];
    [displayName appendString:self.lastName];
    
    return displayName;
}

-(id)initWithMember:(Member *)member;
{
    
    self = [super init];
    
    if(self){
        firstName = member.firstName;
        lastName = member.lastName;
        objectId = member.objectID;
        isMemberSelected = member.isMemberSelected;
    }
    
    return self;
}
@end
