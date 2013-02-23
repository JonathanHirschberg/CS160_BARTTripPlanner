//
//  BARTAppDelegate.m
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TripWrapper.h"
#import "RootViewController.h"
#import "RoutesViewController.h"
#import "BARTAppDelegate.h"
#import "ScheduleViewController.h"
#import "DisplayCostRoute.h"
#import "EnterDestination.h"
#import "MapViewController.h"
#import "PastTripsTableViewController.h"
#import "Step1ViewController.h"
#import "Step2ViewController.h"
#import "Step3ViewController.h"
#import "Step4ViewController.h"
#import "TicketInfo1ViewController.h"
#import "MainViewController.h"
#import "XMLParser.h"
#define cdFilename @"savedtripdata.plist"

@implementation BARTAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize rootViewController;
@synthesize myroutesViewController;
@synthesize stationNameList;
@synthesize stationAbbrList;
@synthesize savedAbbrFareDictionary;
@synthesize originName;
@synthesize originAbbr;
@synthesize destinationName;
@synthesize destinationAbbr;
@synthesize originDestinationDecider;
@synthesize tripFare;
@synthesize tripDate;
@synthesize ArrivalsAndDepartures;
@synthesize TripLegs;
@synthesize SavedTrips;
@synthesize tripPlanned;
@synthesize LLeg1EndStation;
@synthesize LLeg1Train;
@synthesize LLeg2EndStation;
@synthesize LLeg2Train;	
@synthesize LLeg3Train;
@synthesize LstartTime;
@synthesize Lfare;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    

//	RootViewController *rootViewController = (RootViewController *)[navigationController topViewController];
	rootViewController = [[RootViewController alloc] 
				initWithNibName:@"RootViewController" bundle:[NSBundle mainBundle]];
	rootViewController.managedObjectContext = self.managedObjectContext;

//	MainViewController *mainViewController = (MainViewController *)[navigationController topViewController];
	
	self.stationNameList = [[NSMutableArray alloc] init];
	self.stationAbbrList = [[NSMutableArray alloc] init];
	self.savedAbbrFareDictionary = [[NSMutableDictionary alloc] init];
	self.ArrivalsAndDepartures = [[NSMutableArray alloc] init];
	self.TripLegs = [[NSMutableArray alloc] init];
	if([[NSFileManager defaultManager] fileExistsAtPath:[self cddataFilePath]]) {
		self.SavedTrips = [[NSMutableArray alloc] initWithContentsOfFile:[self cddataFilePath]];
	}
	else {
		self.SavedTrips = [[NSMutableArray alloc] init];
	}
//	NSLog(@"initialized station lists");

	// Routes View
	RoutesViewController *aroutesViewController = [[RoutesViewController alloc] 
												   initWithNibName:@"RoutesViewController" bundle:[NSBundle mainBundle]];
	[aroutesViewController setTitle:@"Routes"];
	aroutesViewController.title = @"Routes";
	self.myroutesViewController = aroutesViewController;
	[aroutesViewController release];
	
	originDestinationDecider = 0; // a smart application would automatically select the nearest station 
									//and assume the user just wants to choose the destination, so it starts 
								//out selecting the destination.  If not, the user should select origin.
	[self initializeStationLists];
	
	// telling it to call UIApplicationWillTerminate later - borrowed from iphonedevbook.com, chapter 11
	UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillTerminate:)
                                                 name:UIApplicationWillTerminateNotification 
                                               object:app];	
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}

- (void)initializeStationLists {
	// XML parsing from http://www.iphonesdkarticles.com/2008/11/parsing-xml-files.html
	NSURL *url = [[NSURL alloc] initWithString:@"http://api.bart.gov/api/stn.aspx?cmd=stns&key=2SSP-6G6X-52AI-Y66I"];
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	[xmlParser setDelegate:parser];
	BOOL success = [xmlParser parse];
	if(success)
		NSLog(@"No Errors");
	else
		NSLog(@"Errors");
	
/*	for(int a = 0; a < [stationNameList count]; a++) {
		NSLog(@"[stationNameList objectAtIndex:%d] = %@", a, [stationNameList objectAtIndex:a]);
	}
	for(int b = 0; b < [stationAbbrList count]; b++) {
		NSLog(@"[stationAbbrList objectAtIndex:%d] = %@", b, [stationAbbrList objectAtIndex:b]);
	}*/
}

// borrowed from iphonedevbook.com, chapter 11
- (NSString *)cddataFilePath {
	//	PainterAppDelegate *appDelegate = (PainterAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	//	NSLog(appDelegate.dotsFilename);
    return [documentsDirectory stringByAppendingPathComponent:cdFilename];
}

/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
	[SavedTrips writeToFile:[self cddataFilePath] atomically:YES];
    NSError *error;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
			// Handle error.
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			exit(-1);  // Fail
        } 
    }
}


#pragma mark -
#pragma mark Saving

/**
 Performs the save action for the application, which is to send the save:
 message to the application's managed object context.
 */
- (IBAction)saveAction:(id)sender {
	
    NSError *error;
    if (![[self managedObjectContext] save:&error]) {
		// Handle error
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1);  // Fail
    }
}


#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
	
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"BART.sqlite"]];
	
	NSError *error;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        // Handle error
    }    
	
    return persistentStoreCoordinator;
}


#pragma mark -
#pragma mark Application's documents directory

/**
 Returns the path to the application's documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	
    [managedObjectContext release];
    [managedObjectModel release];
    [persistentStoreCoordinator release];
    
	[stationNameList release];
	[stationAbbrList release];
	[savedAbbrFareDictionary release];
	[ArrivalsAndDepartures release];
	[TripLegs release];
	[SavedTrips release];
	
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

