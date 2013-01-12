//
//  EditTableTopicsTableViewController.h
//  TableTopics
//
//  Created by k526712 on 1/3/13.
//
//

#import <UIKit/UIKit.h>
#import "TableTopicCoreDataService.h"

@interface EditTableTopicsTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) NSMutableArray *tableTopicArray;
@property(strong, nonatomic) TableTopicCoreDataService *coreDataService;

@end
