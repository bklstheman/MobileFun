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
    //Remove the Enter in Text value
    
    if(textView.text )
    textView.text = @"";
    
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]){
        [self.tableTopicField resignFirstResponder];
        return NO;
    }
    
    return YES;
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
        
        NSError *error;
        BOOL response = [coreDataService createTableTopic:tableTopicDescrip withError:error];
        
        if (response) {
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            //TODO:NEed to do alert thing
        }
    }
}
@end
