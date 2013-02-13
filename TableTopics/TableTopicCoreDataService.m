//
//  TableTopicCoreDataService.m
//  TableTopics
//
//  Created by k526712 on 12/31/12.
//
//

#import "TableTopicCoreDataService.h"
#import "Table_TopicsAppDelegate.h"
#import "Member.h"
#import "TableTopic.h"

@interface TableTopicCoreDataService(private)

-(NSMutableArray *) populateMemberVOArray:(NSArray *) fetchResults;

@end

@implementation TableTopicCoreDataService(private)

-(NSMutableArray *) populateMemberVOArray:(NSArray *) fetchResults
{
    NSMutableArray *memberArray = [[NSMutableArray alloc]init];
    
    for(int i=0; i < fetchResults.count; i++)
    {
        MemberVO *memberVO = [[MemberVO alloc]initWithMember:[fetchResults objectAtIndex:i]];
        [memberArray addObject:memberVO];
    }
    
    return memberArray;
}

@end

@implementation TableTopicCoreDataService

@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;
@synthesize fetchedResultsController = _fetchedResultsController;

-(NSMutableArray *) getAllMembers
{
    NSManagedObjectContext *moc = [[[TableTopicCoreDataService alloc]init] managedObjectContext];
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Member" inManagedObjectContext:self.managedObjectContext];
    
    [fetch setEntity:entity];
    [fetch setFetchBatchSize:100];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]initWithKey:@"firstName" ascending:YES];
    NSArray *sortArray = [[NSArray alloc] initWithObjects:sort, nil];
    [fetch setSortDescriptors:sortArray];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetch managedObjectContext:moc sectionNameKeyPath:nil cacheName:@"MembersCache"];
    
    NSError *error;
    NSMutableArray *memberArray = [[NSMutableArray alloc]init];
    [self.fetchedResultsController performFetch:&error];

    if(error){
        return nil;
    }
    
    [memberArray addObjectsFromArray:[self populateMemberVOArray:[self.fetchedResultsController fetchedObjects]]];
    return memberArray;
}

-(NSMutableArray *) getAllSelectedMembers
{
    NSManagedObjectContext *moc = [[[TableTopicCoreDataService alloc]init] managedObjectContext];
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]init];
    [fetch setEntity:[NSEntityDescription entityForName:@"Member" inManagedObjectContext:self.managedObjectContext]];
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"isMemberSelected = %@", [NSNumber numberWithBool:TRUE]]];
    [fetch setFetchBatchSize:100];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]initWithKey:@"firstName" ascending:YES];
    NSArray *sortArray = [[NSArray alloc] initWithObjects:sort, nil];
    [fetch setSortDescriptors:sortArray];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetch managedObjectContext:moc sectionNameKeyPath:nil cacheName:@"MembersCache"];
    
    NSError *error;
    NSMutableArray *selectedMemberArray = [[NSMutableArray alloc]init];
    [self.fetchedResultsController performFetch:&error];
    
    if(error){
        return nil;
    }
    
    [selectedMemberArray addObjectsFromArray:[self populateMemberVOArray:[self.fetchedResultsController fetchedObjects]]];
    return selectedMemberArray;
}

-(NSMutableArray *) getAllTableTopics
{
    NSManagedObjectContext *moc = [[[TableTopicCoreDataService alloc]init] managedObjectContext];
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TableTopic" inManagedObjectContext:self.managedObjectContext];
    
    [fetch setEntity:entity];
    [fetch setFetchBatchSize:100];
  
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]initWithKey:@"topicDescription" ascending:YES];
    NSArray *sortArray = [[NSArray alloc] initWithObjects:sort, nil];
    [fetch setSortDescriptors:sortArray];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetch managedObjectContext:moc sectionNameKeyPath:nil cacheName:@"TableTopicCache"];
    
    NSError *error;
    [self.fetchedResultsController performFetch:&error];
    
    if(error){
        return nil;
    }
    
    NSArray *fetchedResults = [self.fetchedResultsController fetchedObjects];
    
    NSMutableArray *tableTopicsArray = [[NSMutableArray alloc]init];
    
    for(int i=0; i< fetchedResults.count; i++){
        
        TableTopicVO *tableTopicVO = [[TableTopicVO alloc]init];
        tableTopicVO.topicDescription = [[fetchedResults objectAtIndex:i] topicDescription];
        [tableTopicsArray addObject:tableTopicVO];
    }
    
    return tableTopicsArray;
}

-(void) removeMember:(MemberVO *)member;
{
    NSError *error;
    Member *memberToDelete = (Member *)[self.managedObjectContext existingObjectWithID:member.objectId error:&error];
    
    [self.managedObjectContext deleteObject:memberToDelete];
    
    if(![self.managedObjectContext save:&error]){
        NSLog(@"Error %@", [error localizedFailureReason]);
    }
}

-(void) createMember:(MemberVO *) memberVO
{
    Member *newMember = (Member *)[NSEntityDescription insertNewObjectForEntityForName:@"Member" inManagedObjectContext:self.managedObjectContext];
    
    newMember.firstName = memberVO.firstName;
    newMember.lastName = memberVO.lastName;
    newMember.isMemberSelected = [NSNumber numberWithBool:FALSE];
    
    NSError *error;
    [self.managedObjectContext save:&error];
}

-(void) editIsSelect:(MemberVO *) memberVO
{
    NSError *error;
    Member *memberToUpdate = (Member *)[self.managedObjectContext existingObjectWithID:memberVO.objectId error:&error];
           
    if([memberVO.isMemberSelected isEqualToNumber:[NSNumber numberWithBool:FALSE]]){
        memberToUpdate.isMemberSelected = [NSNumber numberWithBool:TRUE];
    } else {
        memberToUpdate.isMemberSelected = [NSNumber numberWithBool:FALSE];
    }
    [self.managedObjectContext save:&error];
}

-(void) createTableTopic:(NSString *) tableTopicDescription
{
    TableTopic *newTableTopic = (TableTopic *)[NSEntityDescription insertNewObjectForEntityForName:@"TableTopic" inManagedObjectContext:self.managedObjectContext];
    
    newTableTopic.topicDescription = tableTopicDescription;
    
    NSError *error;
    [self.managedObjectContext save:&error];
}

-(void) removeTableTopic:(TableTopicVO *)tableTopicVO
{
    NSFetchRequest *fetch = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TableTopic" inManagedObjectContext:self.managedObjectContext];
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"topicDescription = %@", tableTopicVO.topicDescription]];
    [fetch setEntity:entity];

    
    NSError *error;    
    NSArray *fetchedResults = [self.managedObjectContext executeFetchRequest:fetch error:&error];
    
    TableTopic *tableTopicToRemove = [fetchedResults objectAtIndex:0];
    
    [self.managedObjectContext deleteObject:tableTopicToRemove];
    
    if(![self.managedObjectContext save:&error]){
        NSLog(@"Error %@", [error localizedFailureReason]);
    }
}


#pragma mark - Core Data stack
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
    {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"TableTopics.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return __persistentStoreCoordinator;
}

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"TableTopics" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}
@end
