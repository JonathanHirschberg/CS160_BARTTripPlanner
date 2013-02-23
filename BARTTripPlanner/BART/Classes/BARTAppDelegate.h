//
//  BARTAppDelegate.h
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//
//  EnterDestination is the table view that lists all destinations and you can choose one.
//  RootViewController is the table view that lists all stations visited before.

@interface BARTAppDelegate : NSObject <UIApplicationDelegate> {
    
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;

    UIWindow *window;
    UINavigationController *navigationController;
	RootViewController *rootViewController;
	RoutesViewController *myroutesViewController;
	
	// application global variables
	NSMutableArray *stationNameList;
	NSMutableArray *stationAbbrList;
	NSMutableDictionary *savedAbbrFareDictionary;
	NSString *originName;
	NSString *originAbbr;
	NSString *destinationName;
	NSString *destinationAbbr;
	int originDestinationDecider;
	NSString *tripFare;
	NSString *tripDate;
	BOOL tripPlanned;
	
	NSMutableArray *ArrivalsAndDepartures;
	NSMutableArray *TripLegs; // array storing all trip legs, with trips separated by the trip leg 'order' member
	NSMutableArray *SavedTrips;

	NSString *LLeg1EndStation;
	NSString *LLeg1Train;
	NSString *LLeg2EndStation;
	NSString *LLeg2Train;	
	NSString *LLeg3Train;
	NSString *LstartTime;
	NSString *Lfare;
}

- (IBAction)saveAction:sender;
- (void)initializeStationLists;
- (NSString *)cddataFilePath;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, readonly) NSString *applicationDocumentsDirectory;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) RootViewController *rootViewController;
@property (nonatomic, retain) RoutesViewController *myroutesViewController;

@property (nonatomic, retain) NSMutableArray *stationNameList;
@property (nonatomic, retain) NSMutableArray *stationAbbrList;
@property (nonatomic, retain) NSMutableDictionary *savedAbbrFareDictionary;
@property (nonatomic, retain) NSString *originName;
@property (nonatomic, retain) NSString *originAbbr;
@property (nonatomic, retain) NSString *destinationName;
@property (nonatomic, retain) NSString *destinationAbbr;
@property int originDestinationDecider;
@property (nonatomic, retain) NSString *tripFare;
@property (nonatomic, retain) NSString *tripDate;
@property BOOL tripPlanned;

@property (nonatomic, retain) NSMutableArray *ArrivalsAndDepartures;
@property (nonatomic, retain) NSMutableArray *TripLegs;
@property (nonatomic, retain) NSMutableArray *SavedTrips;

@property (nonatomic, retain) NSString *LLeg1EndStation;
@property (nonatomic, retain) NSString *LLeg1Train;
@property (nonatomic, retain) NSString *LLeg2EndStation;
@property (nonatomic, retain) NSString *LLeg2Train;	
@property (nonatomic, retain) NSString *LLeg3Train;
@property (nonatomic, retain) NSString *LstartTime;
@property (nonatomic, retain) NSString *Lfare;

@end

