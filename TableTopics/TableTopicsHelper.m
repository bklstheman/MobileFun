//
//  TableTopicsHelper.m
//  TableTopics
//
//  Created by William Kluss on 2/14/13.
//
//

#import "TableTopicsHelper.h"

@implementation TableTopicsHelper

+ (UIAlertView *)createUIAlertView:(NSString *)message withTitle:(NSString *)title
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    return alert;
}

@end
