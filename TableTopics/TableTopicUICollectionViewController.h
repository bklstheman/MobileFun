//
//  TableTopicUICollectionViewController.h
//  TableTopics
//
//  Created by William Kluss on 1/20/13.
//
//

#import <UIKit/UIKit.h>
#import "TableTopicCoreDataService.h"

@interface TableTopicUICollectionViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic) NSMutableArray *tableTopicArray;
@property(strong, nonatomic) TableTopicCoreDataService *coreDataService;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@end
