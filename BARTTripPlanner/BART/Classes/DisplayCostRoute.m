//
//  DisplayCostRoute.m
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//  followed this tutorial:
//  http://www.iphonesdkarticles.com/2009/01/uipickerview-creating-simple-picker.html

#import "RoutesViewController.h"
#import "ScheduleViewController.h"
#import "displayCostRoute.h"
#import "TripWrapper.h"
#import "RootViewController.h"
#import "BARTAppDelegate.h"
#import "XMLParser.h"
#import "ScheduleViewController.h"

@implementation DisplayCostRoute
@synthesize pickerView;
@synthesize originLabel;
@synthesize destinationLabel;
@synthesize fareLabel;
@synthesize roundTripFareLabel;
@synthesize myscheduleViewController;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
//	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:appDelegate.rootViewController action:@selector([appDelegate.rootViewController insertNewObject])];
//    self.navigationItem.rightBarButtonItem = addButton;
	// Schedule
	ScheduleViewController *ascheduleViewController = [[ScheduleViewController alloc] 
										   initWithNibName:@"ScheduleViewController" bundle:[NSBundle mainBundle]];
	[ascheduleViewController setTitle:@"Schedule"];
	ascheduleViewController.title = @"Schedule";
	self.myscheduleViewController = ascheduleViewController;
	[ascheduleViewController release];
    [super viewDidLoad];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {	
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
	return [appDelegate.stationNameList count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
	return [appDelegate.stationNameList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];	
	if(component == 0) {
		appDelegate.originName = [appDelegate.stationNameList objectAtIndex:row];
		appDelegate.originAbbr = [appDelegate.stationAbbrList objectAtIndex:row];
		originLabel.text = appDelegate.originName;
	}
	else if(component == 1) {
		appDelegate.destinationName = [appDelegate.stationNameList objectAtIndex:row];
		appDelegate.destinationAbbr = [appDelegate.stationAbbrList objectAtIndex:row];
		destinationLabel.text = appDelegate.destinationName;
	}
//	NSLog(@"starting to retrieve fare");
	if(appDelegate.destinationAbbr != nil && appDelegate.originAbbr != nil) {
		[self retrieveFare:appDelegate.originAbbr destinationStation:appDelegate.destinationAbbr];
	}
//	NSLog(@"passed");
//	NSLog(@"Selected Station: %@. Index of selected station: %i", [appDelegate.stationNameList objectAtIndex:row], row);
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

- (IBAction)gotoSchedule:(id)sender {
	//	[appDelegate.rootViewController insertNewObject];
	// deal with persistent data later
	[[self navigationController] pushViewController:myscheduleViewController animated:YES];
}

- (void)retrieveFare:(NSString *)o destinationStation:(NSString *)d {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];	
	// XML parsing from http://www.iphonesdkarticles.com/2008/11/parsing-xml-files.html
	NSString *urlstring = [[NSString alloc] initWithFormat:@"http://api.bart.gov/api/sched.aspx?cmd=fare&orig=%@&dest=%@&date=today&key=2SSP-6G6X-52AI-Y66I", o, d];
	NSURL *url = [[NSURL alloc] initWithString:urlstring];
//	NSLog(@"success");
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	[xmlParser setDelegate:parser];
	BOOL success = [xmlParser parse];
	if(success)
		NSLog(@"No Errors");
	else
		NSLog(@"Errors");
	fareLabel.text = [[NSString alloc] initWithFormat:@"$%@", appDelegate.tripFare];
	roundTripFareLabel.text = [[NSString alloc] initWithFormat:@"$%.2f", (2*[appDelegate.tripFare floatValue])];
	
/*	for(int a = 0; a < [appDelegate.stationNameList count]; a++) {
		NSLog(@"[stationNameList objectAtIndex:%d] = %@", a, [appDelegate.stationNameList objectAtIndex:a]);
	}
	for(int b = 0; b < [appDelegate.stationAbbrList count]; b++) {
		NSLog(@"[stationAbbrList objectAtIndex:%d] = %@", b, [appDelegate.stationAbbrList objectAtIndex:b]);
	}*/
}

- (void)dealloc {
    [super dealloc];
}


@end
