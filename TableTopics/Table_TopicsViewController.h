//
//  Table_TopicsViewController.h
//  TableTopics
//
//  Created by William Kluss on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Table_TopicsAppDelegate.h"
#import "TableTopicCoreDataService.h"
#import <iAd/iAd.h>

@interface Table_TopicsViewController : UIViewController <UIGestureRecognizerDelegate, ADBannerViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *topicLabel;
@property (strong, nonatomic) IBOutlet UIImageView *nameView;
@property (strong, nonatomic) IBOutlet UIImageView *topicView;
@property (strong, nonatomic) IBOutlet ADBannerView *adBannerView;

@property (strong, nonatomic) NSMutableArray *nameArray;
@property (strong, nonatomic) NSMutableArray *topicArray;

@property (strong, nonatomic) Table_TopicsAppDelegate *delegate;
@property (strong, nonatomic) TableTopicCoreDataService *coreDataService;

- (IBAction)changeNameLabel:(UITapGestureRecognizer *)sender;
- (IBAction)changeTopicLabel:(UITapGestureRecognizer *)sender;
- (IBAction)pressPickTopic:(UIButton *)sender;
- (IBAction)pressResetButton:(id)sender;


@end
