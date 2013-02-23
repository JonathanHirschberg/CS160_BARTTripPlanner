//
//  Step3ViewController.m
//  BART
//
//  Created by Class Account on 3/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Step3ViewController.h"
#import "RoutesViewController.h"
#import "TripWrapper.h"
#import "RootViewController.h"
#import "BARTAppDelegate.h"

@implementation Step3ViewController
@synthesize SstartTimeLabel;
@synthesize SLeg1StartStation;
@synthesize SLeg1EndStation;
@synthesize SLeg1Train;
@synthesize SLeg2StartStation;
@synthesize SLeg2EndStation;
@synthesize SLeg2Train;
@synthesize SLeg3StartStation;
@synthesize SLeg3EndStation;
@synthesize SLeg3Train;

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

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (IBAction)returnToInfo:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)update {
	NSLog(@"step3 updates");
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
	SLeg1Train.text = appDelegate.LLeg1Train;
	SstartTimeLabel.text = appDelegate.LstartTime;
	SLeg1EndStation.text = appDelegate.LLeg1EndStation;
	SLeg2Train.text = appDelegate.LLeg2Train;
	SLeg2EndStation.text = appDelegate.LLeg2EndStation;
	SLeg3Train.text = appDelegate.LLeg3Train;
	NSLog(@"%@", appDelegate.LLeg3Train);
}

- (void)dealloc {
    [super dealloc];
}


@end
