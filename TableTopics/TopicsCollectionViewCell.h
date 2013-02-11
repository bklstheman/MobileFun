//
//  TopicsCollectionViewCell.h
//  TableTopics
//
//  Created by William Kluss on 2/6/13.
//
//

#import <UIKit/UIKit.h>

@protocol TopicsCollectionViewCellDelegate <NSObject>

- (void) deleteTopicCell:(UICollectionViewCell *) topicCell;

@end

@interface TopicsCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UITextView *tableTopicText;
@property (strong, nonatomic) NSIndexPath *topicCellIndex;
@property (strong, nonatomic) id<TopicsCollectionViewCellDelegate> delegate;

- (IBAction)deleteTopicCollectionCell:(id)sender;
@end
