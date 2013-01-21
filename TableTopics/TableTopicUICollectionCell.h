//
//  TableTopicUICollectionCell.h
//  TableTopics
//
//  Created by William Kluss on 1/20/13.
//
//

#import <UIKit/UIKit.h>

@interface TableTopicUICollectionCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView *topicImageView;
@property (nonatomic, strong) NSString *topicDescription;

@end
