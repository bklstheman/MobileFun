//
//  AddMemberController.h
//  TableTopics
//
//  Created by k526712 on 12/13/12.
//
//

#import <UIKit/UIKit.h>
#import "TableTopicCoreDataService.h"
#import <QuartzCore/QuartzCore.h>

@interface AddMemberController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) TableTopicCoreDataService *coreDataService;
@property (weak, nonatomic) IBOutlet UIButton *memberSubmitButton;

- (IBAction)dismissFirstNameKeyboard:(UITextField *)sender;
- (IBAction)dismissLastNameKeyboard:(UITextField *)sender;
- (IBAction)addMember:(UIButton *)sender;

//TODO:Make this a "private" method
-(void)addEmptyLabelMessage;

- (IBAction)backgroundTap:(id)sender;
@end
