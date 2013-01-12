//
//  AddTableTopicController.m
//  TableTopics
//
//  Created by k526712 on 1/2/13.
//
//

#import "AddTableTopicController.h"

@interface AddTableTopicController ()

@end

@implementation AddTableTopicController

@synthesize tableTopicField;
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
    /*self.tableTopicField.layer.borderWidth = 1;
    self.tableTopicField.layer.cornerRadius = 10;
    self.tableTopicField.layer.borderColor = [[UIColor grayColor] CGColor];*/
    self.tableTopicField.backgroundColor = [UIColor clearColor];
    self.coreDataService = [[TableTopicCoreDataService alloc]init];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableTopicField:nil];
    [super viewDidUnload];
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
    //Put this in a new method
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(textViewResign:)];
    
    NSArray *itemsArray = [NSArray arrayWithObjects:flexButton, doneButton, nil];
    [toolbar setItems:itemsArray];
    [textView setInputAccessoryView:toolbar];
    
    //Remove the Enter in Text value
    
    if(textView.text )
    textView.text = @"";
    
    return YES;
}

- (IBAction)textViewResign:(id)sender
{
    [self.tableTopicField resignFirstResponder];
}

- (IBAction)createTableTopic:(id)sender {
    
    
    //Need to check if the field is empty or over 125 characters.
    if([self.tableTopicField.text length] == 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You must enter something." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    } else if([self.tableTopicField.text length] > 125){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You may only enter 125 characters." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        NSString *tableTopicDescrip = [self.tableTopicField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        [coreDataService createTableTopic:tableTopicDescrip];
        //TODO:Need to check to see if an error comes back from this. If so we will need to display an error.
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
