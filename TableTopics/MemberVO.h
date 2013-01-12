//
//  MemberVO.h
//  TableTopics
//
//  Created by k526712 on 12/12/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Member.h"

@interface MemberVO : NSObject

@property (strong, nonatomic) NSString * firstName;
@property (strong, nonatomic) NSString * lastName;
@property (strong, nonatomic) NSNumber * timesCalledOn;
@property (strong, nonatomic) NSNumber * isMemberSelected;
@property (strong, nonatomic) NSManagedObjectID *objectId;


-(id)initWithMember:(Member *)member;
-(NSString *) printFullName;


@end
