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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.coreDataService = [[TableTopicCoreDataService alloc]init];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setFirstNameTextField:nil];
    [self setLastNameTextField:nil];
    [self setSubmitButton:nil];
    [super viewDidUnload];
}

- (IBAction)dismissFirstNameKeyboard:(UITextField *)sender {
    [self.lastNameTextField becomeFirstResponder];
}

- (IBAction)dismissLastNameKeyboard:(UITextField *)sender {
    [self resignFirstResponder];
}

- (IBAction)addMember:(UIButton *)sender {
    if([self.firstNameTextField.text length] == 0 || [self.lastNameTextField.text length] == 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You must fill out all the fields." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        MemberVO *memberVO = [[MemberVO alloc]init];

        memberVO.firstName = [firstNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        memberVO.lastName = [lastNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        [coreDataService createMember:memberVO];
        //TODO:Need to check to see if an error comes back from this. If so we will need to display an error.
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}
@end
