//
//  SADCMember.m
//  TableTopics
//
//  Created by k526712 on 7/29/12.
//
//

#import "SADCMember.h"

@implementation SADCMember

@synthesize firstName;
@synthesize lastName;

- (NSString *) printFullName {
    return [NSString stringWithFormat:firstName," ",lastName];
}


@end
