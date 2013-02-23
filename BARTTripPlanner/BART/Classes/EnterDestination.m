//
//  EnterDestination.m
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TripWrapper.h"
#import "RootViewController.h"
#import "RoutesViewController.h"
#import "BARTAppDelegate.h"
#import "EnterDestination.h"

@implementation EnterDestination
@synthesize appDelegate;
//@synthesize stationList;


- (void)viewDidLoad {
//	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); // gets an array of paths
//	NSString *documentsDirectory = [paths objectAtIndex:0]; // the documents directory is the first path in the array
//	stationList = [NSString stringWithFormat:@"%@/StationList.plist", documentsDirectory];
	
	appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
//	NSLog(@"Loaded table");
	[super viewDidLoad];
 
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appDelegate.stationNameList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
    // Set up the cell...
//	NSLog([appDelegate.stationNameList objectAtIndex:[indexPath row]]);
	cell.textLabel.text = [appDelegate.stationNameList objectAtIndex:[indexPath row]];
	
    return cell;
}




 // Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
 // Navigation logic may go here -- for example, create and push another view controller.
 // AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
 // [self.navigationController pushViewController:anotherViewController animated:YES];
 // [anotherViewController release];
	
	if(appDelegate.originDestinationDecider == 0) { // origin
		appDelegate.originName = [appDelegate.stationNameList objectAtIndex:[indexPath row]];
		appDelegate.originAbbr = [appDelegate.stationAbbrList objectAtIndex:[indexPath row]];
		NSLog(@"Origin %@", appDelegate.originName);
		NSLog(@"Origin %@", appDelegate.originAbbr);
		// after choosing origin, most people would want to choose the destination
//		appDelegate.originDestinationDecider = 1;
//		[self.parentViewController updateOriginDestinationButtonDisplay];
	}
	else if(appDelegate.originDestinationDecider == 1) { // destination
		appDelegate.destinationName = [appDelegate.stationNameList objectAtIndex:[indexPath row]];
		appDelegate.destinationAbbr = [appDelegate.stationAbbrList objectAtIndex:[indexPath row]];
		NSLog(@"Destination %@", appDelegate.destinationName);
		NSLog(@"Destination %@", appDelegate.destinationAbbr);
	}
//	[self.parentViewController updateStationLabels];
	
	[self.navigationController popViewControllerAnimated:YES];
}
 


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (void)dealloc {
    [super dealloc];
}


@end

