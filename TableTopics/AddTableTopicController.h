//
//  AddTableTopicController.h
//  TableTopics
//
//  Created by k526712 on 1/2/13.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TableTopicCoreDataService.h"
#import "TableTopicsHelper.h"

@interface AddTableTopicController : UIViewController<UITextViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextView *tableTopicField;
@property (strong, nonatomic) TableTopicCoreDataService *coreDataService;

@end
