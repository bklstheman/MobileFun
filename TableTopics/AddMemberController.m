//
//  AddMemberController.m
//  TableTopics
//
//  Created by k526712 on 12/13/12.
//
//

#import "AddMemberController.h"
#import "MemberVO.h"

@interface AddMemberController ()

@end

@implementation AddMemberController

@synthesize firstNameTextField;
@synthesize lastNameTextField;
@synthesize coreDataService;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//TODO: Need to do logic now that we will have the keyboard up
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.coreDataService = [[TableTopicCoreDataService alloc]init];
    [self.firstNameTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setFirstNameTextField:nil];
    [self setLastNameTextField:nil];
    [super viewDidUnload];
}

- (IBAction)dismissFirstNameKeyboard:(UITextField *)sender {
    [self.lastNameTextField becomeFirstResponder];
}

- (IBAction)dismissLastNameKeyboard:(UITextField *)sender {
    [self addMember:nil];
}

- (IBAction)addMember:(id)sender {
    if([self.firstNameTextField.text length] == 0 || [self.lastNameTextField.text length] == 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You must fill out all the fields." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        MemberVO *memberVO = [[MemberVO alloc]init];

        memberVO.firstName = [firstNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        memberVO.lastName = [lastNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        NSError *error;
        BOOL response = [coreDataService createMember:memberVO withError:error];
        
        if(response){
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            UIAlertView *alert =  [TableTopicsHelper createUIAlertView:@"An error happened while adding member" withTitle:@"Add Member Error"];
            [alert show];
        }   
    }
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}
@end
