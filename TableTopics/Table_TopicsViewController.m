//
//  Table_TopicsViewController.m
//  TableTopics
//
//  Created by William Kluss on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Table_TopicsViewController.h"
#import "Table_TopicsAppDelegate.h"
#import "TableTopicsHelper.h"
#import "TableTopicVO.h"

@interface Table_TopicsViewController ()

@end

@implementation Table_TopicsViewController
@synthesize nameLabel;
@synthesize topicLabel;
@synthesize nameView;
@synthesize topicView;
@synthesize nameArray;
@synthesize topicArray;
@synthesize delegate;
@synthesize coreDataService;
@synthesize adBannerView;


#pragma Inital Controller setup methods
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.coreDataService = [[TableTopicCoreDataService alloc]init];
    //self.adBannerView.hidden = YES;
    
    [self becomeFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self createNameAndTopicValues];

}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)createNameValues
{
    NSError *error;
    self.nameArray = [coreDataService getAllSelectedMembersWithError:error];
    
    if(self.nameArray == nil){
        if(error){
            UIAlertView *alert = [TableTopicsHelper createUIAlertView:@"Unable to retrieve all selected members" withTitle:@"Retrieve Selected Member Error"];
            [alert show];
        }
    }
}

- (void)createTopicValues
{
    NSError *error;
    self.topicArray = [coreDataService getAllTableTopicsWithError:error];
}

- (void)createNameAndTopicValues
{
    [self createNameValues];
    [self createTopicValues];
}


- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(event.type == UIEventTypeMotion && UIEventSubtypeMotionShake){
        [self pressPickTopic:nil];
    }
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setTopicLabel:nil];
    [self setNameView:nil];
    [self setTopicView:nil];
    [self setAdBannerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma Card Selecting Methods
- (IBAction)changeNameLabel:(UITapGestureRecognizer *)sender {
    
    //If the array is empty just get the fudge out of here.
    if(self.nameArray.count == 0){
        return;
    }
    
    NSInteger nameNumber = arc4random() % nameArray.count;
    
    [self animateNameCard];
    
    MemberVO *memberVO = [self.nameArray objectAtIndex:nameNumber];
    NSString *displayName = memberVO.printFullName;
    [nameLabel setText:displayName];
    
    [self.nameArray removeObjectAtIndex:nameNumber];
    
    //If we hit the last person in the list, go back and repopulate the list. This way we can start over
    if(self.nameArray.count == 0){
        [self createNameValues];
    }
}

- (IBAction)changeTopicLabel:(UITapGestureRecognizer *)sender {
    
    if(self.topicArray.count == 0){
        return;
    }
    
    NSInteger topicNumber = arc4random() % topicArray.count;
    
    [self animateTopicCard];
    
    TableTopicVO *topicVO = [topicArray objectAtIndex:topicNumber];
    [topicLabel setText:topicVO.topicDescription];
    [self.topicArray removeObjectAtIndex:topicNumber];
    
    if(self.topicArray.count == 0)
    {
        [self createTopicValues];
    }
}

- (IBAction)pressPickTopic:(UIButton *)sender {
        
    [self animateNoteCards];
    
    [self changeNameLabel:nil];
    [self changeTopicLabel:nil];
}

- (IBAction)pressResetButton:(id)sender {
    [nameLabel setText:@"Name"];
    [topicLabel setText:@"Topic"];
    
    [self createNameAndTopicValues];
}

#pragma Animation Methods
- (void)animateNoteCards {
    
    [self animateNameCard];
    [self animateTopicCard];

}

- (void)animateNameCard {
    
    [UILabel beginAnimations:nil context:UIGraphicsGetCurrentContext()];
    [UILabel setAnimationDuration:.75];
    [UILabel setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.nameLabel cache:YES];
    [UILabel commitAnimations];
    
    [UIView beginAnimations:nil context:UIGraphicsGetCurrentContext()];
    [UIView setAnimationDuration:.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.nameView cache:YES];
    [UIView commitAnimations];
    
}

- (void)animateTopicCard {
    
    [UILabel beginAnimations:nil context:UIGraphicsGetCurrentContext()];
    [UILabel setAnimationDuration:.75];
    [UILabel setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.topicLabel cache:YES];
    [UILabel commitAnimations];
    
    [UIView beginAnimations:nil context:UIGraphicsGetCurrentContext()];
    [UIView setAnimationDuration:.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.topicView cache:YES];
    [UIView commitAnimations];
    
}

#pragma Ad Banner methods
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"Hiding view");
    if(!banner.hidden){
        banner.hidden = YES;
    }
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"Showing view");
    if(banner.hidden){
        banner.hidden = NO;
    }
}
@end
