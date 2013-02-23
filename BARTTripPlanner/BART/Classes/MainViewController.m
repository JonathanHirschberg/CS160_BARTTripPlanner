//
//  MainViewController.m
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
#import "ScheduleViewController.h"
#import "DisplayCostRoute.h"
#import "PastTripsTableViewController.h"
#import "MapViewController.h"
#import "Step1ViewController.h"
#import "Step2ViewController.h"
#import "Step3ViewController.h"
#import "Step4ViewController.h"
#import "TicketInfo1ViewController.h"
#import "MainViewController.h"

@implementation MainViewController
@synthesize myenterDestination;
@synthesize mymapViewController;
@synthesize mydisplayCostRoute;
@synthesize mypastTrips;
@synthesize originDestinationSelector;
@synthesize originLabel;
@synthesize destinationLabel;
@synthesize appDelegate;
@synthesize gametimer;
@synthesize ti1vc;
@synthesize ticketInfoButton;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

- (void) initializeTimer { // from http://stackoverflow.com/questions/1116817/do-cocoa-applications-have-a-main-loop/1116839
	const float framerate = 20;
	const float frequency = 1.0f/framerate;
	gametimer = [NSTimer scheduledTimerWithTimeInterval:frequency 
												 target:self selector:@selector(elapseTime) 
											   userInfo:nil repeats:YES];
}

- (void) elapseTime {
	[self updateOriginDestinationButtonDisplay];
	[self updateStationLabels];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.title = @"Home";
	appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
	ticketInfoButton.enabled = NO; // can't click until they plan their trip!
	
	// Enter Destination
	EnterDestination *aenterDestination = [[EnterDestination alloc] 
			initWithNibName:@"EnterDestination" bundle:[NSBundle mainBundle]];
	[aenterDestination setTitle:@"Enter Destination"];
	aenterDestination.title = @"Enter Destination";
	self.myenterDestination = aenterDestination;
	[aenterDestination release];

	// Map View
	MapViewController *amapViewController = [[MapViewController alloc] 
										   initWithNibName:@"MapViewController" bundle:[NSBundle mainBundle]];
	[amapViewController setTitle:@"BART System Map"];
	amapViewController.title = @"BART System Map";
	self.mymapViewController = amapViewController;
	[amapViewController release];	
	
	// Display Cost of Route
	DisplayCostRoute *adisplayCostRoute = [[DisplayCostRoute alloc] 
										   initWithNibName:@"DisplayCostRoute" bundle:[NSBundle mainBundle]];
	[adisplayCostRoute setTitle:@"Trip Fare"];
	adisplayCostRoute.title = @"Trip Fare";
	self.mydisplayCostRoute = adisplayCostRoute;
	[adisplayCostRoute release];	
	
	// Past Trips
	PastTripsTableViewController *apastTrips = [[PastTripsTableViewController alloc] 
										   initWithNibName:@"PastTripsTableViewController" bundle:[NSBundle mainBundle]];
	[apastTrips setTitle:@"Past Trips"];
	apastTrips.title = @"Past Trips";
	self.mypastTrips = apastTrips;
	[apastTrips release];	
	
	// Ticket Info 1
	TicketInfo1ViewController *ati1vc = [[TicketInfo1ViewController alloc] 
												initWithNibName:@"TicketInfo1ViewController" bundle:[NSBundle mainBundle]];
	[ati1vc setTitle:@"How to Use Your Ticket"];
	ati1vc.title = @"How to Use Your Ticket";
	self.ti1vc = ati1vc;
	[ati1vc release];
	
	[self initializeTimer];

    [super viewDidLoad];
}

- (IBAction)changeToEnterDestinationView:(id)sender {
//	[myenterDestination updateView]; // call this to update the view 
	[[self navigationController] pushViewController:myenterDestination animated:YES];
}

- (IBAction)changeToPastDestinationView:(id)sender {
	//	[myenterDestination updateView]; // call this to update the view 
	[[self navigationController] pushViewController:appDelegate.rootViewController animated:YES];
}

- (IBAction)changeToMapView:(id)sender {
	//	[myenterDestination updateView]; // call this to update the view 
	[[self navigationController] pushViewController:mymapViewController animated:YES];
}

- (IBAction)changeToPastTrips:(id)sender {
    [mypastTrips.tableView reloadData];
	[[self navigationController] pushViewController:mypastTrips animated:YES];
}

- (IBAction)changeToTI1VC:(id)sender {
	[[self navigationController] pushViewController:ti1vc animated:YES];
}

- (IBAction)CalculateFare:(id)sender {
//	[appDelegate.rootViewController insertNewObject];
	// deal with persistent data later
	[[self navigationController] pushViewController:mydisplayCostRoute animated:YES];
}

- (IBAction)updateOriginDestinationState:(id)sender {
	appDelegate.originDestinationDecider = originDestinationSelector.selectedSegmentIndex;
}

- (void)updateOriginDestinationButtonDisplay {
	originDestinationSelector.selectedSegmentIndex = appDelegate.originDestinationDecider;
}

- (void)updateStationLabels {
	originLabel.text = appDelegate.originName;
	destinationLabel.text = appDelegate.destinationName;
//	NSLog(@"updating station labels");
	if(appDelegate.tripPlanned) {
		ticketInfoButton.enabled = YES;
	}
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
