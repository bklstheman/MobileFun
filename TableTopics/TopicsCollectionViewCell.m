//
//  TopicsCollectionViewCell.m
//  TableTopics
//
//  Created by William Kluss on 2/6/13.
//
//

#import "TopicsCollectionViewCell.h"

@implementation TopicsCollectionViewCell

@synthesize tableTopicText, delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)deleteTopicCollectionCell:(id)sender {
    [self.delegate deleteTopicCell:self];
}
@end
