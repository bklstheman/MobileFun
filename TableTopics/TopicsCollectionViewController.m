//
//  TopicsCollectionViewController.m
//  TableTopics
//
//  Created by William Kluss on 2/6/13.
//
//

#import "TopicsCollectionViewController.h"
#import "TableTopicsHelper.h"

@interface TopicsCollectionViewController ()

-(void) addEmptyLabelMessage;

@end

@implementation TopicsCollectionViewController

@synthesize tableTopicArray;
@synthesize coreDataService;

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
    self.coreDataService = [TableTopicCoreDataService new];
    [self.collectionView setBackgroundView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2dCF2ae.jpg"]]];
    
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSError *error;
    self.tableTopicArray = [coreDataService getAllTableTopicsWithError:error];
    if(self.tableTopicArray == nil){
        if(error){
            UIAlertView *alert = [TableTopicsHelper createUIAlertView:@"Unable to retrieve Table Topics" withTitle:@"Retrieve Table Topics Error"];
            [alert show];
        }
    } else {
        if (self.tableTopicArray.count == 0) {
            [self addEmptyLabelMessage];
        } else {
            [self.collectionView reloadData];
            
            for(id view in self.view.subviews){
                if([view isKindOfClass:[UILabel class]]){
                    [view removeFromSuperview];
                }
            }
        }
    }
}

-(void) addEmptyLabelMessage
{
    UILabel *emptyLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, 300, 300)];
    emptyLabel.text = @"You don't have any Table Topics. Go and create some!";
    emptyLabel.backgroundColor = [UIColor clearColor];
    emptyLabel.numberOfLines = 2;
    
    [self.view addSubview:emptyLabel];
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
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopicsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopicCell" forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor blueColor];
    TableTopicVO *tableTopicVO = [self.tableTopicArray objectAtIndex:indexPath.row];
    cell.tableTopicText.text = tableTopicVO.topicDescription;
    cell.topicCellIndex = indexPath;
    cell.delegate = self;
    return cell;
}

- (void)viewDidUnload {
    [self setCollectionView:nil];
    [super viewDidUnload];
}

-(void)deleteTopicCell:(TopicsCollectionViewCell *)topicCell
{
    //Delete from core data, fetch new array, and display.
    TableTopicVO *tableTopicVO = [self.tableTopicArray objectAtIndex:topicCell.topicCellIndex.row];
    NSError *error;
   BOOL response =  [self.coreDataService removeTableTopic:tableTopicVO withError:error];
    
    if(response){
        [self.tableTopicArray removeObjectAtIndex:topicCell.topicCellIndex.row];
        [self.collectionView deleteItemsAtIndexPaths:@[topicCell.topicCellIndex]];
        [self.collectionView reloadData];
    } else {
        UIAlertView *alert = [TableTopicsHelper createUIAlertView:@"Unable to delete Table Topic" withTitle:@"Delete Table Topic Error"];
        [alert show];
    }
}
@end
