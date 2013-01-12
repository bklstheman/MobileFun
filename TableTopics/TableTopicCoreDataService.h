//
//  TableTopicCoreDataService.h
//  TableTopics
//
//  Created by k526712 on 12/31/12.
//
//

#import <Foundation/Foundation.h>
#import "MemberVO.h"
#import "TableTopicVO.h"

@interface TableTopicCoreDataService : NSObject

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

-(NSMutableArray *) getAllMembers;
-(NSMutableArray *) getAllSelectedMembers;
-(NSMutableArray *) getAllTableTopics;
-(void) removeMember:(MemberVO *) memberVO;
-(void) editIsSelect:(MemberVO *) memberVO;
-(void) createMember:(MemberVO *) memberVO;
-(void) createTableTopic:(NSString *) tableTopicDescription;
-(void) removeTableTopic:(TableTopicVO *) tableTopicVO;

-(void)saveContext;
-(NSURL *)applicationDocumentsDirectory;


@end
