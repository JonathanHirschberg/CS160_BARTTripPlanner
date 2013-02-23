//
//  MainViewController.h
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController {
	EnterDestination *myenterDestination;
	MapViewController *mymapViewController;
	DisplayCostRoute *mydisplayCostRoute;
	PastTripsTableViewController *mypastTrips;
	UISegmentedControl *originDestinationSelector;
	UILabel *originLabel;
	UILabel *destinationLabel;
	BARTAppDelegate *appDelegate;
	NSTimer *gametimer;
	
	// informational screens
	TicketInfo1ViewController *ti1vc;
	IBOutlet UIButton *ticketInfoButton;
}
@property (nonatomic, retain) EnterDestination *myenterDestination;
@property (nonatomic, retain) MapViewController *mymapViewController;
@property (nonatomic, retain) DisplayCostRoute *mydisplayCostRoute;
@property (nonatomic, retain) PastTripsTableViewController *mypastTrips;
@property (nonatomic, retain) IBOutlet UISegmentedControl *originDestinationSelector;
@property (nonatomic, retain) IBOutlet UILabel *originLabel;
@property (nonatomic, retain) IBOutlet UILabel *destinationLabel;
@property (nonatomic, retain) BARTAppDelegate *appDelegate;
@property (nonatomic, retain) NSTimer *gametimer;
@property (nonatomic, retain) TicketInfo1ViewController *ti1vc;
@property (nonatomic, retain) IBOutlet UIButton *ticketInfoButton;
- (IBAction)changeToEnterDestinationView:(id)sender;
- (IBAction)changeToPastDestinationView:(id)sender;
- (IBAction)changeToMapView:(id)sender;
- (IBAction)changeToPastTrips:(id)sender;
- (IBAction)changeToTI1VC:(id)sender;
- (IBAction)CalculateFare:(id)sender;
- (IBAction)updateOriginDestinationState:(id)sender; // update internal state when user changes segmented button state
- (void)updateOriginDestinationButtonDisplay; // update button display when internal state is changed
- (void)updateStationLabels; // update station label fields to match internal data
- (void)initializeTimer;

@end
