//
//  AddMemberController.h
//  TableTopics
//
//  Created by k526712 on 12/13/12.
//
//

#import <UIKit/UIKit.h>
#import "TableTopicCoreDataService.h"
#import "TableTopicsHelper.h"
#import <QuartzCore/QuartzCore.h>

@interface AddMemberController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) TableTopicCoreDataService *coreDataService;

- (IBAction)dismissFirstNameKeyboard:(UITextField *)sender;
- (IBAction)dismissLastNameKeyboard:(UITextField *)sender;
- (IBAction)addMember:(id)sender;

- (IBAction)backgroundTap:(id)sender;
@end
