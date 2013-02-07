//
//  TopicsCollectionViewController.h
//  TableTopics
//
//  Created by William Kluss on 2/6/13.
//
//

#import <UIKit/UIKit.h>
#import "TableTopicCoreDataService.h"
#import "TopicsCollectionViewCell.h"


@interface TopicsCollectionViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegate>


@property(strong, nonatomic) NSMutableArray *tableTopicArray;
@property(strong, nonatomic) TableTopicCoreDataService *coreDataService;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@end
