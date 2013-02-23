//
//  RootViewController.h
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
- (void)insertNewObject:(TripWrapper *)trip;

@end
