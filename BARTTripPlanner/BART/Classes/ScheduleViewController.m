//
//  ScheduleViewController.m
//  BART
//
//  Created by Class Account on 3/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//  Date Picker tutorial:
//  http://www.roseindia.net/tutorial/iphone/examples/iphone-datetime.html

#import "TripWrapper.h"
#import "RootViewController.h"
#import "RoutesViewController.h"
#import "BARTAppDelegate.h"
#import "ScheduleViewController.h"
#import "XMLParser.h"
#import "TimeWrapper.h"

@implementation ScheduleViewController
@synthesize originLabel;
@synthesize destinationLabel;
@synthesize originTimeTrip1;
@synthesize originTimeTrip2;
@synthesize originTimeTrip3;
@synthesize originDateTrip1;
@synthesize originDateTrip2;
@synthesize originDateTrip3;
@synthesize destinationTimeTrip1;
@synthesize destinationTimeTrip2;
@synthesize destinationTimeTrip3;
@synthesize destinationDateTrip1;
@synthesize destinationDateTrip2;
@synthesize destinationDateTrip3;
@synthesize gametimer;
@synthesize picker;
@synthesize dateLabel;
@synthesize timeLabel;
@synthesize timeTripButton1;
@synthesize timeTripButton2;
@synthesize timeTripButton3;

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
	const float framerate = 10;
	const float frequency = 1.0f/framerate;
	gametimer = [NSTimer scheduledTimerWithTimeInterval:frequency 
												 target:self selector:@selector(elapseTime) 
											   userInfo:nil repeats:YES];
}

- (void) elapseTime {
	[self updateDisplay];
}

- (void) updateDisplay {
	// NSDateFormatter format string codes:
	// http://www.alexcurylo.com/blog/2009/01/29/nsdateformatter-formatting/
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateFormat:@"MM/dd/yyyy hh:mm+aa"];
	NSRange daterange;
	daterange.location = 0;
	daterange.length = 10;
	NSRange timerange;
	timerange.location = 11;
	timerange.length = 8;
	NSString *dateString = [[formatter stringFromDate:[picker date]] substringWithRange:daterange];
	NSString *timeString = [[formatter stringFromDate:[picker date]] substringWithRange:timerange];

	[timeTripButton1 setTitle:@"" forState:UIControlStateDisabled];
	[timeTripButton2 setTitle:@"" forState:UIControlStateDisabled];
	[timeTripButton3 setTitle:@"" forState:UIControlStateDisabled];
	timeTripButton1.enabled = NO;
	timeTripButton2.enabled = NO;
	timeTripButton3.enabled = NO;
	
	appDelegate.tripDate = dateString;
	dateLabel.text = dateString;
	timeLabel.text = timeString;
	if(appDelegate.originName != nil && appDelegate.destinationName != nil) {
		[appDelegate.ArrivalsAndDepartures removeAllObjects];
		[appDelegate.TripLegs removeAllObjects];
		[self retrieveDepartureInformation:appDelegate.originAbbr destinationStation:appDelegate.destinationAbbr tripDate:dateString tripTime:timeString];
//		NSLog(@"starting to parse %d", [appDelegate.ArrivalsAndDepartures count]);
		
/*		for(int a = 0; a < [appDelegate.ArrivalsAndDepartures count]; a++) {
			NSLog(@"[ArrivalsAndDepartures objectAtIndex:%d] = %@", a, [[appDelegate.ArrivalsAndDepartures objectAtIndex:a] originTime]);
		}
		for(int a = 0; a < [appDelegate.TripLegs count]; a++) {
			NSLog(@"[TripLegs objectAtIndex:%d] = %@ %@ %@ %@", a, [[appDelegate.TripLegs objectAtIndex:a] torder], [[appDelegate.TripLegs objectAtIndex:a] torigin], [[appDelegate.TripLegs objectAtIndex:a] tdestination], [[appDelegate.TripLegs objectAtIndex:a] trainHeadStation]);
		}
		NSLog(@"one iteration");
*/		
		originLabel.text = appDelegate.originName;
		destinationLabel.text = appDelegate.destinationName;
		if([appDelegate.ArrivalsAndDepartures count] == 1) {
			originTimeTrip1.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] originTime];
			destinationTimeTrip1.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] destinationTime];
			timeTripButton1.enabled = YES;
			NSString *buttonText1 = [[NSString alloc] initWithFormat:@"%@                     %@", [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] originTime], [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] destinationTime]];
			[timeTripButton1 setTitle:buttonText1 forState:UIControlStateNormal];
		}
		if([appDelegate.ArrivalsAndDepartures count] == 2) {
			originTimeTrip1.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] originTime];
			originTimeTrip2.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] originTime];
			destinationTimeTrip1.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] destinationTime];
			destinationTimeTrip2.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] destinationTime];
			timeTripButton1.enabled = YES;
			timeTripButton2.enabled = YES;
			NSString *buttonText1 = [[NSString alloc] initWithFormat:@"%@                     %@", [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] originTime], [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] destinationTime]];
			NSString *buttonText2 = [[NSString alloc] initWithFormat:@"%@                     %@", [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] originTime], [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] destinationTime]];
			[timeTripButton1 setTitle:buttonText1 forState:UIControlStateNormal];
			[timeTripButton2 setTitle:buttonText2 forState:UIControlStateNormal];
		}
		if([appDelegate.ArrivalsAndDepartures count] >= 3) {
			originTimeTrip3.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:2] originTime];
			originTimeTrip1.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] originTime];
			originTimeTrip2.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] originTime];
			destinationTimeTrip1.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] destinationTime];
			destinationTimeTrip2.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] destinationTime];
			destinationTimeTrip3.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:2] destinationTime];
			timeTripButton1.enabled = YES;
			timeTripButton2.enabled = YES;
			timeTripButton3.enabled = YES;
			NSString *buttonText1 = [[NSString alloc] initWithFormat:@"%@                     %@", [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] originTime], [[appDelegate.ArrivalsAndDepartures objectAtIndex:0] destinationTime]];
			NSString *buttonText2 = [[NSString alloc] initWithFormat:@"%@                     %@", [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] originTime], [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] destinationTime]];
			NSString *buttonText3 = [[NSString alloc] initWithFormat:@"%@                     %@", [[appDelegate.ArrivalsAndDepartures objectAtIndex:2] originTime], [[appDelegate.ArrivalsAndDepartures objectAtIndex:2] destinationTime]];
			[timeTripButton1 setTitle:buttonText1 forState:UIControlStateNormal];
			[timeTripButton2 setTitle:buttonText2 forState:UIControlStateNormal];
			[timeTripButton3 setTitle:buttonText3 forState:UIControlStateNormal];
		}
//		originDateTrip1.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] originDate];
//		originDateTrip2.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:2] originDate];
//		originDateTrip3.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:3] originDate];
//		destinationTimeTrip1.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] destinationTime];
//		destinationTimeTrip2.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:2] destinationTime];
//		destinationTimeTrip3.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:3] destinationTime];
//		destinationDateTrip1.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:1] destinationDate];
//		destinationDateTrip2.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:2] destinationDate];
//		destinationDateTrip3.text = [[appDelegate.ArrivalsAndDepartures objectAtIndex:3] destinationDate];
		
	}
}

- (void)retrieveDepartureInformation:(NSString *)o destinationStation:(NSString *)d tripDate:(NSString *)date tripTime:(NSString *)time {
//	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];	
	// XML parsing from http://www.iphonesdkarticles.com/2008/11/parsing-xml-files.html
	NSString *urlstring = [[NSString alloc] initWithFormat:@"http://api.bart.gov/api/sched.aspx?cmd=depart&orig=%@&dest=%@&date=%@&time=%@&a=3&key=2SSP-6G6X-52AI-Y66I", o, d, date, time];
	NSURL *url = [[NSURL alloc] initWithString:urlstring];
//	NSLog(urlstring);
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	[xmlParser setDelegate:parser];
/*	BOOL success =*/ [xmlParser parse];
/*	if(success)
		NSLog(@"No Errors");
	else
		NSLog(@"Errors");
*/	
/*	for(int a = 0; a < [appDelegate.ArrivalsAndDepartures count]; a++) {
		NSLog(@"[ArrivalsAndDepartures objectAtIndex:%d] = %@", a, [[appDelegate.ArrivalsAndDepartures objectAtIndex:a] originTime]);
	}*/
}

- (IBAction)changeToRouteView1:(id)sender {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];	
	NSLog(@"tripleg size %d", [appDelegate.TripLegs count]);
	[appDelegate.myroutesViewController LoadTripData:0];
	[[self navigationController] pushViewController:appDelegate.myroutesViewController animated:YES];
}

- (IBAction)changeToRouteView2:(id)sender {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];	
	NSLog(@"tripleg size %d", [appDelegate.TripLegs count]);
	[appDelegate.myroutesViewController LoadTripData:1];
	[[self navigationController] pushViewController:appDelegate.myroutesViewController animated:YES];
}

- (IBAction)changeToRouteView3:(id)sender {
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];	
	NSLog(@"tripleg size %d", [appDelegate.TripLegs count]);
	[appDelegate.myroutesViewController LoadTripData:2];
	[[self navigationController] pushViewController:appDelegate.myroutesViewController animated:YES];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self initializeTimer];
	[picker setDate:[NSDate date] animated:YES];
    [super viewDidLoad];
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
