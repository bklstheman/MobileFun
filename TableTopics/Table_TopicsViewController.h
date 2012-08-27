//
//  Table_TopicsViewController.h
//  TableTopics
//
//  Created by William Kluss on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditNameTableViewControllerDelegate2;

@protocol EditNameTableViewControllerDelegate <NSObject>

-(void) setNamesForNoteCard;

@end

@interface Table_TopicsViewController : UIViewController <UIGestureRecognizerDelegate, EditNameTableViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *topicLabel;
@property (strong, nonatomic) IBOutlet UIImageView *nameView;
@property (strong, nonatomic) IBOutlet UIImageView *topicView;

@property (strong, nonatomic) NSMutableArray *nameArray;
@property (strong, nonatomic) NSMutableArray *topicArray;
@property (strong, nonatomic) id<EditNameTableViewControllerDelegate2>editNameDelegate;


- (IBAction)changeNameLabel:(UITapGestureRecognizer *)sender;
- (IBAction)changeTopicLabel:(UITapGestureRecognizer *)sender;
- (IBAction)pressPickTopic:(UIButton *)sender;
- (IBAction)pressResetButton:(UIButton *)sender;


@end
