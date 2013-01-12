//
//  EditNameTableViewController.h
//  TableTopics
//
//  Created by k526712 on 7/31/12.
//
//

@protocol EditMenuDelegate;


#import <UIKit/UIKit.h>
#import "TableTopicCoreDataService.h"

@interface EditNameTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *nameArray;
@property (strong, nonatomic) TableTopicCoreDataService *coreDataService;

@end
