//
//  Step1ViewController.m
//  BART
//
//  Created by Class Account on 3/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Step1ViewController.h"
#import "TripWrapper.h"
#import "RootViewController.h"
#import "RoutesViewController.h"
#import "BARTAppDelegate.h"

@implementation Step1ViewController
@synthesize tripFareLabel;
@synthesize roundtripFareLabel;

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

- (IBAction)returnToInfo:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)loadFare {
	NSLog(@"step1 loads fare");
	BARTAppDelegate *appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
	tripFareLabel.text = [[NSString alloc] initWithFormat:@"$%@", appDelegate.Lfare];
	roundtripFareLabel.text = [[NSString alloc] initWithFormat:@"$%.2f", [appDelegate.Lfare floatValue]*2];
	NSLog(@"%@", tripFareLabel.text);
	NSLog(@"%@", roundtripFareLabel.text);
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
