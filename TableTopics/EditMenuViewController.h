//
//  EditMenuViewController.h
//  TableTopics
//
//  Created by k526712 on 8/12/12.
//
//

@protocol EditMenuDelegate <NSObject>

-(void)setNameArray:(NSMutableArray *)newNameArray;

@end


#import <UIKit/UIKit.h>

@interface EditMenuViewController : UITableViewController<EditMenuDelegate>

@property (strong, nonatomic) NSMutableArray *nameArray;
@property (strong, nonatomic) NSMutableArray *topicArray;
@property (strong, nonatomic) id<EditMenuDelegate>delegate;

@end
