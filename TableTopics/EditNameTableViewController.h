//
//  EditNameTableViewController.h
//  TableTopics
//
//  Created by k526712 on 7/31/12.
//
//

@protocol EditNameTableViewControllerDelegate2 <NSObject>

-(void)setNameFromTableTopicArray:(NSArray *)tableTopicArray;

@end

#import <UIKit/UIKit.h>

@interface EditNameTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, EditNameTableViewControllerDelegate2>

@property (strong, nonatomic) id<EditNameTableViewControllerDelegate2>delegate2;
@property (strong, nonatomic) NSArray *nameArray;
@property (strong, nonatomic) NSArray *namesFromTableTopicControllerArray;

@end
