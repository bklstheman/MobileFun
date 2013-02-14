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

-(NSMutableArray *) getAllMembersWithError:(NSError *)error;
-(NSMutableArray *) getAllSelectedMembersWithError:(NSError *)error;
-(NSMutableArray *) getAllTableTopicsWithError:(NSError *)error;
-(BOOL) removeMember:(MemberVO *) memberVO withError:(NSError *)error;
-(BOOL) editIsSelect:(MemberVO *) memberVO withError:(NSError *)error;
-(BOOL) createMember:(MemberVO *) memberVO withError:(NSError *)error;
-(BOOL) createTableTopic:(NSString *) tableTopicDescription withError:(NSError *)error;
-(BOOL) removeTableTopic:(TableTopicVO *) tableTopicVO withError:(NSError *)error;

-(void)saveContext;
-(NSURL *)applicationDocumentsDirectory;


@end
