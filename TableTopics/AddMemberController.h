//
//  AddMemberController.h
//  TableTopics
//
//  Created by k526712 on 12/13/12.
//
//

#import <UIKit/UIKit.h>
#import "TableTopicCoreDataService.h"

@interface AddMemberController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) TableTopicCoreDataService *coreDataService;

- (IBAction)dismissFirstNameKeyboard:(UITextField *)sender;
- (IBAction)dismissLastNameKeyboard:(UITextField *)sender;
- (IBAction)addMember:(UIButton *)sender;

- (IBAction)backgroundTap:(id)sender;
@end
