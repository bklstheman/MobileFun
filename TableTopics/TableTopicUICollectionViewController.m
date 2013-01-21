//
//  TableTopicUICollectionViewController.m
//  TableTopics
//
//  Created by William Kluss on 1/20/13.
//
//

#import "TableTopicUICollectionViewController.h"

@interface TableTopicUICollectionViewController ()

@end

@implementation TableTopicUICollectionViewController

@synthesize tableTopicArray;
@synthesize coreDataService;
@synthesize collectionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.coreDataService = [[TableTopicCoreDataService alloc]init];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"TopicCell"];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tableTopicArray = [coreDataService getAllTableTopics];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.tableTopicArray count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.tableTopicArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopicCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO
}



- (void)viewDidUnload {
    [self setCollectionView:nil];
    [super viewDidUnload];
}
@end
