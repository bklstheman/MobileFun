//
//  Member.h
//  TableTopics
//
//  Created by k526712 on 12/11/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Member : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * timesCalledOn;
@property (nonatomic, retain) NSNumber * isMemberSelected;

@end
