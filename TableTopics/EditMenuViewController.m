//
//  EditMenuViewController.m
//  TableTopics
//
//  Created by k526712 on 8/12/12.
//
//

#import "EditMenuViewController.h"

@implementation EditMenuViewController

@synthesize membersButton;
@synthesize tableTopicButton;

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
    self.membersButton.layer.borderWidth = 1;
    self.tableTopicButton.layer.borderWidth = 1;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMembersButton:nil];
    [self setTableTopicButton:nil];
    [super viewDidUnload];
}
@end
