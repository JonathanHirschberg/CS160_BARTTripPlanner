//
//  TicketInfo1ViewController.m
//  BART
//
//  Created by Class Account on 3/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Step1ViewController.h"
#import "Step2ViewController.h"
#import "Step3ViewController.h"
#import "Step4ViewController.h"
#import "TicketInfo1ViewController.h"

@implementation TicketInfo1ViewController
@synthesize step1VC;
@synthesize step2VC;
@synthesize step3VC;
@synthesize step4VC;

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
	// Step1
	Step1ViewController *astep1ViewController = [[Step1ViewController alloc] 
												initWithNibName:@"Step1ViewController" bundle:[NSBundle mainBundle]];
	[astep1ViewController setTitle:@"Purchasing Your Ticket"];
	astep1ViewController.title = @"Purchasing Your Ticket";
	self.step1VC = astep1ViewController;
	[astep1ViewController release];
	
	// Step2
	Step2ViewController *astep2ViewController = [[Step1ViewController alloc] 
												 initWithNibName:@"Step2ViewController" bundle:[NSBundle mainBundle]];
	[astep2ViewController setTitle:@"Purchasing Your Ticket"];
	astep2ViewController.title = @"Purchasing Your Ticket";
	self.step2VC = astep2ViewController;
	[astep2ViewController release];
	
	// Step3
	Step3ViewController *astep3ViewController = [[Step3ViewController alloc] 
												 initWithNibName:@"Step3ViewController" bundle:[NSBundle mainBundle]];
	[astep3ViewController setTitle:@"Purchasing Your Ticket"];
	astep3ViewController.title = @"Purchasing Your Ticket";
	self.step3VC = astep3ViewController;
	[astep3ViewController release];
	
	// Step4
	Step4ViewController *astep4ViewController = [[Step4ViewController alloc] 
												 initWithNibName:@"Step4ViewController" bundle:[NSBundle mainBundle]];
	[astep4ViewController setTitle:@"Purchasing Your Ticket"];
	astep4ViewController.title = @"Purchasing Your Ticket";
	self.step4VC = astep4ViewController;
	[astep4ViewController release];
	
    [super viewDidLoad];
}

- (IBAction)changeToStep1:(id)sender {
	[step1VC loadFare];
	[self presentModalViewController:step1VC animated:YES];
}

- (IBAction)changeToStep2:(id)sender {
	//	[myenterDestination updateView]; // call this to update the view 
	[self presentModalViewController:step2VC animated:YES];
}

- (IBAction)changeToStep3:(id)sender {
	[step3VC update];
	[self presentModalViewController:step3VC animated:YES];
}

- (IBAction)changeToStep4:(id)sender {
	//	[myenterDestination updateView]; // call this to update the view 
	[self presentModalViewController:step4VC animated:YES];
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
