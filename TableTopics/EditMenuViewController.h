//
//  EditMenuViewController.h
//  TableTopics
//
//  Created by k526712 on 8/12/12.
//
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>

@interface EditMenuViewController : UIViewController<ADBannerViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *membersButton;
@property (strong, nonatomic) IBOutlet UIButton *tableTopicButton;

@end
