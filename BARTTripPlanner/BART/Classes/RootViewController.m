//
//  RootViewController.m
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TripWrapper.h"
#import "RoutesViewController.h"
#import "RootViewController.h"
#import "BARTAppDelegate.h"

@implementation RootViewController

@synthesize fetchedResultsController;
@synthesize managedObjectContext;


- (void)viewDidLoad {
    [super viewDidLoad];
	// Set up the edit and back buttons.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject)];
//	self.navigationItem.leftBarButtonItem = addButton;
//    self.navigationItem.rightBarButtonItem = addButton;
//    [addButton release];
	
	NSError *error;
	if (![[self fetchedResultsController] performFetch:&error]) {
		// Handle the error...
	}
}

- (void)insertNewObject:(TripWrapper *)trip {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
	// the following bug fix was from:
	// http://stackoverflow.com/questions/1632497/core-data-iphone-could-not-locate-an-nsmanagedobjectmodel
	if (managedObjectContext == nil) 
	{ 
        managedObjectContext = [(BARTAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext]; 
        NSLog(@"After managedObjectContext: %@",  managedObjectContext);
	}
	// Create a new instance of the entity managed by the fetched results controller.
	NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
	NSEntityDescription *entity = [[fetchedResultsController fetchRequest] entity];
	NSLog(@"Starting out");
	TripWrapper *tw = [NSEntityDescription insertNewObjectForEntityForName:@"TripWrapper" inManagedObjectContext:appDelegate.managedObjectContext];
//	NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
	NSLog(@"Got past the hurdle");
	
	// If appropriate, configure the new managed object.
	tw.originName = trip.originName;
	tw.originAbbr = trip.originAbbr;
	tw.destinationName = trip.destinationName;
	tw.destinationAbbr = trip.destinationAbbr;
	tw.tripFare = trip.tripFare;
	tw.tripStartTime = trip.tripStartTime;
	tw.tripEndTime = trip.tripEndTime;
	tw.tripDate = trip.tripDate;
	tw.identifier = trip.identifier;
	
//	[newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
//	[newManagedObject setValue:trip forKey:trip.identifier];

/*	// Create a new instance of the entity managed by the fetched results controller.
	NSManagedObjectContext *context2 = [fetchedResultsController managedObjectContext];
	NSEntityDescription *entity2 = [[fetchedResultsController fetchRequest] entity];
	NSManagedObject *newManagedObject2 = [NSEntityDescription insertNewObjectForEntityForName:[entity2 name] inManagedObjectContext:context2];
	
	// If appropriate, configure the new managed object.
	//	[newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
	[newManagedObject2 setValue:appDelegate.destinationAbbr forKey:appDelegate.destinationName];	
*/	
	// Save the context.
    NSError *error;
    if (![context save:&error]) {
		// Handle the error...
    }

    [self.tableView reloadData];
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
    return [[fetchedResultsController sections] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.

	NSManagedObject *managedObject = [fetchedResultsController objectAtIndexPath:indexPath];

	cell.textLabel.text = [[managedObject valueForKey:@"timeStamp"] description];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here -- for example, create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
    // NSManagedObject *selectedObject = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    // Pass the selected object to the new view controller.
    /// ...
	// [self.navigationController pushViewController:anotherViewController animated:YES];
	// [anotherViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the managed object for the given index path
		NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
		[context deleteObject:[fetchedResultsController objectAtIndexPath:indexPath]];
		
		// Save the context.
		NSError *error;
		if (![context save:&error]) {
			// Handle the error...
		}
		
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // The table view should not be re-orderable.
    return NO;
}


/*
// NSFetchedResultsControllerDelegate method to notify the delegate that all section and object changes have been processed. 
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	[self.tableView reloadData];
}
*/


- (NSFetchedResultsController *)fetchedResultsController {
    
    if (fetchedResultsController != nil) {
        return fetchedResultsController;
    }
    
    /*
	 Set up the fetched results controller.
	*/
	// Create the fetch request for the entity.
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	// Edit the entity name as appropriate.
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:managedObjectContext];
	[fetchRequest setEntity:entity];
	
	// Edit the sort key as appropriate.
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:YES];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
	
	[fetchRequest setSortDescriptors:sortDescriptors];
	
	// Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
	NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:@"Root"];
    aFetchedResultsController.delegate = self;
	self.fetchedResultsController = aFetchedResultsController;
	
	[aFetchedResultsController release];
	[fetchRequest release];
	[sortDescriptor release];
	[sortDescriptors release];
	
	return fetchedResultsController;
}    


- (void)dealloc {
	[fetchedResultsController release];
	[managedObjectContext release];
    [super dealloc];
}


@end

