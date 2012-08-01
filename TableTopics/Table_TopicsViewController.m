//
//  Table_TopicsViewController.m
//  TableTopics
//
//  Created by William Kluss on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Table_TopicsViewController.h"
#import "EditNameTableViewController.h"
#import "SADCMember.h"

@interface Table_TopicsViewController ()

@end

@implementation Table_TopicsViewController
@synthesize nameLabel;
@synthesize topicLabel;
@synthesize nameView;
@synthesize topicView;
@synthesize nameArray;
@synthesize topicArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    topicArray = [[NSArray alloc]initWithObjects:
                  @"Tell us what is your favorite pick up line and if you have had success?",
                  @"Would bringing back dinosaurs from extinction be worth the risks?",
                  @"What is the coolest prize you can get from a cereal box?",
                  @"Describe the most embarrassing moment of your life",
                  @"Pick a city anywhere in the world that you would want to visit and tell us why.",
                  @"Describe the day you found out you were never really human, but an android",
                  @"Give a speech about the bride and groom of a wedding you are crashing.",
                  @"If given the chance to play a super hero in a movie, which one will you be and why?",
                  nil];
    
    nameArray = [[NSArray alloc]initWithObjects:
                 @"William Kluss",
                 @"Timothy Nunamaker",
                 @"Dale Kocian",
                 @"Jordan Walter",
                 @"Victor Baca",
                 @"Triest Smart",
                 @"Ashwini Achar",
                 @"Gaby Preito",
                 @"Mark Purugganan",
                 @"Justin Carreon",
                 @"Randy Le",
                 @"Briana Garcia",
                 @"Gerald Halbeisen",
                 nil];
}

- (void)createDummySADCNames {
    SADCMember *user1 = [[SADCMember alloc]init];
    
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setTopicLabel:nil];
    [self setNameView:nil];
    [self setTopicView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"EditNameSegue"]) {
        EditNameTableViewController *destination = segue.destinationViewController;
        if([destination respondsToSelector:@selector(setDelegate:)]){
            //[destination setDelegate:self];
        }
    }
}
    

- (IBAction)changeNameLabel:(UITapGestureRecognizer *)sender {
    
    NSInteger nameNumber = arc4random() % nameArray.count;
    
    [self animateNameCard];
    
    [nameLabel setText:[nameArray objectAtIndex:nameNumber]];


}

- (IBAction)changeTopicLabel:(UITapGestureRecognizer *)sender {
    
    NSInteger topicNumber = arc4random() % topicArray.count;
    
    [self animateTopicCard];
    
    [topicLabel setText:[topicArray objectAtIndex:topicNumber]];


}

- (IBAction)pressPickTopic:(UIButton *)sender {
    
    NSInteger nameNumber = arc4random() % nameArray.count;
    NSInteger topicNumber = arc4random() % topicArray.count;
    
    [self animateNoteCards];
    
    [nameLabel setText:[nameArray objectAtIndex:nameNumber]];
    [topicLabel setText:[topicArray objectAtIndex:topicNumber]];
}

- (IBAction)pressResetButton:(UIButton *)sender {
    
    [nameLabel setText:@"Name:"];
    [topicLabel setText:@"Topic:"];
}

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
@end
