//
//  RoutesViewController.m
//  BART
//
//  Created by Class Account on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TripWrapper.h"
#import "RootViewController.h"
#import "RoutesViewController.h"
#import "BARTAppDelegate.h"
#import "TripLegWrapper.h"
#import "TimeWrapper.h"
#import "TripWrapper.h"

@implementation RoutesViewController
@synthesize Leg1StartStation;
@synthesize Leg1EndStation;
@synthesize Leg1Train;
@synthesize Leg2StartStation;
@synthesize Leg2EndStation;
@synthesize Leg2Train;
@synthesize Leg3StartStation;
@synthesize Leg3EndStation;
@synthesize Leg3Train;
@synthesize originLabel;
@synthesize destinationLabel;
@synthesize fare;
@synthesize roundTripFare;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)LoadTripData:(int)tripNumber {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
//	appDelegate.tripPlanned = TRUE;
	int i = 0;
	int j = 0;
	while(j < tripNumber) {
		i++;
		if([[[appDelegate.TripLegs objectAtIndex:i] torder] intValue] == 1) { // when order == 1, it's the beginning of a trip
			j++;
		}
		NSLog(@"i:%d j:%d", i, j);
	}
	Leg1StartStation.text = @"";
	Leg1EndStation.text = @"";
	Leg1Train.text = @"";
	Leg2StartStation.text = @"";
	Leg2EndStation.text = @"";
	Leg2Train.text = @"";
	Leg3StartStation.text = @"";
	Leg3EndStation.text = @"";
	Leg3Train.text = @"";
	NSLog(@"index:%d trip:%d", i, j);
	
	startTime.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:tripNumber] originTime];
	endTime.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:tripNumber] destinationTime];
	originLabel.text = appDelegate.originName;
	destinationLabel.text = appDelegate.destinationName;
	date.text = appDelegate.tripDate;
	fare.text = [[NSString alloc] initWithFormat:@"$%@", appDelegate.tripFare];
	roundTripFare.text = [[NSString alloc] initWithFormat:@"$%.2f", 2*[appDelegate.tripFare floatValue]];
	
	Leg1StartStation.text = [self ResolveStationName:[[appDelegate.TripLegs objectAtIndex:i] torigin]];
	Leg1EndStation.text = [self ResolveStationName:[[appDelegate.TripLegs objectAtIndex:i] tdestination]];
	Leg1Train.text = [self ResolveStationName:[[appDelegate.TripLegs objectAtIndex:i] trainHeadStation]];
	NSLog(@"something that should be shown %@", [self ResolveStationName:[[appDelegate.TripLegs objectAtIndex:i] trainHeadStation]]);
	i++;
	if([[[appDelegate.TripLegs objectAtIndex:i] torder] intValue] == 2) {
		Leg2StartStation.text = [self ResolveStationName:[[appDelegate.TripLegs objectAtIndex:i] torigin]];
		Leg2EndStation.text = [self ResolveStationName:[[appDelegate.TripLegs objectAtIndex:i] tdestination]];
		Leg2Train.text = [self ResolveStationName:[[appDelegate.TripLegs objectAtIndex:i] trainHeadStation]];
		i++;
		if([[[appDelegate.TripLegs objectAtIndex:i] torder] intValue] == 3) {
			Leg3StartStation.text = [self ResolveStationName:[[appDelegate.TripLegs objectAtIndex:i] torigin]];
			Leg3EndStation.text = [self ResolveStationName:[[appDelegate.TripLegs objectAtIndex:i] tdestination]];
			Leg3Train.text = [self ResolveStationName:[[appDelegate.TripLegs objectAtIndex:i] trainHeadStation]];
			i++;
		}		
	}
	[self UpdateAppD];
}

- (void)LoadFromSavedData:(int)tripNumber {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
//	appDelegate.tripPlanned = TRUE;
	startTime.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:5];
	endTime.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:6];
	originLabel.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:0];
	destinationLabel.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:2];
	date.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:7];
	fare.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:4];
	
	Leg1StartStation.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:9];
	Leg1EndStation.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:10];
	Leg1Train.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:11];
	Leg2StartStation.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:12];
	Leg2EndStation.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:13];
	Leg2Train.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:14];
	Leg3StartStation.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:15];
	Leg3EndStation.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:16];
	Leg3Train.text = [[appDelegate.SavedTrips objectAtIndex:tripNumber] objectAtIndex:17];
	[self UpdateAppD];
}

- (void)UpdateAppD {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.LstartTime = startTime.text;
	appDelegate.LLeg1EndStation = Leg1EndStation.text;
	appDelegate.LLeg1Train = Leg1Train.text;
	appDelegate.LLeg2EndStation = Leg2EndStation.text;
	appDelegate.LLeg2Train = Leg2Train.text;	
	appDelegate.LLeg3Train = Leg3Train.text;
	appDelegate.Lfare = fare.text;
	NSLog(@"I updated the appD %@", appDelegate.LLeg1Train);
}

- (NSString *)ResolveStationName:(NSString *)stationAbbr {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
	for(int i = 0; i < [appDelegate.stationAbbrList count]; i++) {
		if([[appDelegate.stationAbbrList objectAtIndex:i] isEqualToString:stationAbbr]) {
			return [appDelegate.stationNameList objectAtIndex:i];
		}
	}
	return nil;
}

- (IBAction)SaveTrip:(id)sender {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSLog(@"started");
	NSLog(@"created");
/*	TripWrapper *tw = [[TripWrapper alloc] init];
	tw.originName = appDelegate.originName;
	tw.originAbbr = appDelegate.originAbbr;
	tw.destinationName = appDelegate.destinationName;
	tw.destinationAbbr = appDelegate.destinationAbbr;
	tw.tripFare = appDelegate.tripFare;
	tw.tripStartTime = startTime.text;
	tw.tripEndTime = endTime.text;
	tw.tripDate = appDelegate.tripDate;
	tw.identifier = [[NSString alloc] initWithFormat:@"%@ to %@", appDelegate.originName, appDelegate.destinationName];
	[appDelegate.rootViewController insertNewObject:tw];*/
	
	NSMutableArray *tw = [[NSMutableArray alloc] init];
	[tw addObject:appDelegate.originName];//0
	[tw addObject:appDelegate.originAbbr];//1
	[tw addObject:appDelegate.destinationName];//2
	[tw addObject:appDelegate.destinationAbbr];//3
	[tw addObject:appDelegate.tripFare];//4
	[tw addObject:startTime.text];//5
	[tw addObject:endTime.text];//6
	[tw addObject:appDelegate.tripDate];//7
	[tw addObject:[[NSString alloc] initWithFormat:@"%@ to %@", appDelegate.originName, appDelegate.destinationName]];//8
	[tw addObject:Leg1StartStation.text];//9
	[tw addObject:Leg1EndStation.text];//10
	[tw addObject:Leg1Train.text];//11
	[tw addObject:Leg2StartStation.text];//12
	[tw addObject:Leg2EndStation.text];//13
	[tw addObject:Leg2Train.text];//14
	[tw addObject:Leg3StartStation.text];//15
	[tw addObject:Leg3EndStation.text];//16
	[tw addObject:Leg3Train.text];//17
	[appDelegate.SavedTrips addObject:tw];
	NSLog(@"savedtrips count %d",[appDelegate.SavedTrips count]);
	[tw release];
//	NSLog([self cddataFilePath]);

	for(int a = 0; a < [appDelegate.SavedTrips count]; a++) {
		NSLog(@"[SavedTrips objectAtIndex:%d] = %@", a, [[appDelegate.SavedTrips objectAtIndex:a] objectAtIndex:8]);
	}
}

- (IBAction)CancelTrip:(id)sender {
	[self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
