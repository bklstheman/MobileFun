//
//  EditNameTableViewController.m
//  TableTopics
//
//  Created by k526712 on 7/31/12.
//
//

#import "EditNameTableViewController.h"
#import "Member.h"
#import "MemberVO.h"

@implementation EditNameTableViewController

@synthesize nameArray;
@synthesize coreDataService;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.coreDataService = [[TableTopicCoreDataService alloc]init];
    [self.tableView setBackgroundView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2dCF2ae.jpg"]]];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSError *error;
    self.nameArray = [coreDataService getAllMembersWithError:error];
    
    if(self.nameArray == nil){
        if(error){
            UIAlertView *alert = [TableTopicsHelper createUIAlertView:@"Unable to display members" withTitle:@"Retrieve Member Error"];
            [alert show];
        }
    }
    
    if(self.nameArray.count == 0){
        //create the message on the board.
        [self addEmptyLabelMessage];
                
        //This is to remove the warning after someone adds a member to the list.
    } else if (self.nameArray.count != 0){
        for(id view in self.view.subviews){
            if([view isKindOfClass:[UILabel class]]){
                [view removeFromSuperview];
            }
        }
    }
    
    [self.tableView reloadData];

}

-(void) addEmptyLabelMessage
{
    UILabel *emptyLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 0, 300, 300)];
    emptyLabel.text = @"You don't have any Members. Go and create some!";
    emptyLabel.backgroundColor = [UIColor clearColor];
    emptyLabel.numberOfLines = 2;
    
    [self.view addSubview:emptyLabel];
}

- (void)viewWillDisappear:(BOOL)animated
{
    /*
    [super viewWillDisappear:animated];
    
    if([self.delegate respondsToSelector:setNewNam ]){
        
    } */
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    MemberVO *memberVO = [[MemberVO alloc]init];
        
    memberVO = [self.nameArray objectAtIndex:indexPath.row];

    cell.textLabel.text = memberVO.printFullName;
    
    if([memberVO.isMemberSelected isEqualToNumber:[NSNumber numberWithBool:TRUE]]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source       
        MemberVO *memberVO = [self.nameArray objectAtIndex:indexPath.row];
        
        NSError *error;
        BOOL response = [coreDataService removeMember:memberVO withError:error];
        
        if(response){
            [self.nameArray removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            if (self.nameArray.count == 0) {
                [self addEmptyLabelMessage];
            }
            
        } else {
            UIAlertView *alert = [TableTopicsHelper createUIAlertView:@"Unable to remove member" withTitle:@"Remobe Member Error"];
            [alert show];
        }
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    MemberVO *memberVO = [self.nameArray objectAtIndex:indexPath.row];
    
    NSError *error;
    BOOL response = [coreDataService editIsSelect:memberVO withError:error];
    
    if(response){
        if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
            memberVO.isMemberSelected = [NSNumber numberWithBool:FALSE];
        } else {
            memberVO.isMemberSelected = [NSNumber numberWithBool:TRUE];
        }
        
        [self.nameArray replaceObjectAtIndex:indexPath.row withObject:memberVO];
        [cell setSelected:NO];
        [tableView reloadData];
    } else {
        UIAlertView *alert = [TableTopicsHelper createUIAlertView:@"Unable to select member" withTitle:@"Select Member Error"];
        [alert show];
    }
}

@end
