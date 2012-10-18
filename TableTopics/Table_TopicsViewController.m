//
//  Table_TopicsViewController.m
//  TableTopics
//
//  Created by William Kluss on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Table_TopicsViewController.h"
#import "EditNameTableViewController.h"
#import "EditMenuViewController.h"
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
@synthesize editNameDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self createNameAndTopicValues];
    [self becomeFirstResponder];
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}
- (void)createNameValues
{
    nameArray = [[NSMutableArray alloc]initWithObjects:
                 @"William Kluss",
                 @"Timothy Nunamaker",
                 @"Dale Kocian",
                 @"Victor Baca",
                 @"Triest Smart",
                 @"Ashwini Achar",
                 @"Gaby Preito",
                 @"Mark Purugganan",
                 @"Randy Le",
                 @"Briana Garcia",
                 @"Ryan Young",
                 @"Gerald Halbeisen",
                 nil];
}

- (void)createTopicValues
{
    topicArray = [[NSMutableArray alloc]initWithObjects:
                  @"How would you fight a bear with nothing but superglue?",
                  @"If you could be a Sesame Street character, who would you be and why?",
                  @"Name one of the hardest things you’ve done and how did it test you?",
                  @"What is the coolest prize you can get from a cereal box?",
                  @"Pick a city anywhere in the world that you would want to visit and tell us why.",
                  @"If you could break one law, what law would that be?",
                  @"Tell us what your perfect staycation",
                  @"If you could rename yourself what name would you choose?",
                  @"If the internet went down, how would you personally be impacted?",
                  @"Name one super power you would want and what would you use it for?",
                  @"What is the worst vacation you could go on?",
                  @"If given the chance to play a super hero in a movie, which one will you be and why?",
                  @"Describe what silence sounds like?",
                  nil];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(event.type == UIEventTypeMotion && UIEventSubtypeMotionShake){
        [self pressPickTopic:nil];
    }
}

- (void)createNameAndTopicValues
{
    [self createNameValues];
    [self createTopicValues];
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
    if([segue.identifier isEqualToString:@"EditMenuSegue"]) {
        EditMenuViewController *destination = segue.destinationViewController;
        //[editNameDelegate setNameFromTableTopicArray:self.nameArray];
        if([destination respondsToSelector:@selector(setNameArray:)]){
            [destination setNameArray:self.nameArray];
        }
        if([destination respondsToSelector:@selector(setTopicArray:)])
           {
               [destination setTopicArray:self.topicArray];
           }
    }
}
    

- (IBAction)changeNameLabel:(UITapGestureRecognizer *)sender {
    
    NSInteger nameNumber = arc4random() % nameArray.count;
    
    [self animateNameCard];
    
    [nameLabel setText:[nameArray objectAtIndex:nameNumber]];
    
    [self.nameArray removeObjectAtIndex:nameNumber];
    
    if(self.nameArray.count == 0){
        [self createNameValues];
    }


}

- (IBAction)changeTopicLabel:(UITapGestureRecognizer *)sender {
    
    NSInteger topicNumber = arc4random() % topicArray.count;
    
    [self animateTopicCard];
    
    [topicLabel setText:[topicArray objectAtIndex:topicNumber]];
    [self.topicArray removeObjectAtIndex:topicNumber];
    
    if(self.topicArray.count == 0)
    {
        [self createTopicValues];
    }


}

- (IBAction)pressPickTopic:(UIButton *)sender {
    
    NSInteger nameNumber = arc4random() % nameArray.count;
    NSInteger topicNumber = arc4random() % topicArray.count;
    
    [self animateNoteCards];
    
    [nameLabel setText:[nameArray objectAtIndex:nameNumber]];
    [topicLabel setText:[topicArray objectAtIndex:topicNumber]];
    
    
    //Removes name and topic so they do not reappear
    [self.nameArray removeObjectAtIndex:nameNumber];
    [self.topicArray removeObjectAtIndex:topicNumber];
    
    //TODO: Might need to do something if the value is 0.
    if(self.nameArray.count == 0){
        [self createNameValues];
    }
    
    if(self.topicArray.count == 0)
    {
        [self createTopicValues];
    }
}

- (IBAction)pressResetButton:(UIButton *)sender {
    
    [nameLabel setText:@"Name:"];
    [topicLabel setText:@"Topic:"];
    
    [self createNameAndTopicValues];
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
