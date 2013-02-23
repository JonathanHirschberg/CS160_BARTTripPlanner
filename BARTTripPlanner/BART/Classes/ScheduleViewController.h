//
//  ScheduleViewController.h
//  BART
//
//  Created by Class Account on 3/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ScheduleViewController : UIViewController {
	IBOutlet UILabel *originLabel;
	IBOutlet UILabel *originTimeTrip1;
	IBOutlet UILabel *originTimeTrip2;
	IBOutlet UILabel *originTimeTrip3;
	IBOutlet UILabel *originDateTrip1;
	IBOutlet UILabel *originDateTrip2;
	IBOutlet UILabel *originDateTrip3;

	IBOutlet UILabel *destinationLabel;
	IBOutlet UILabel *destinationTimeTrip1;
	IBOutlet UILabel *destinationTimeTrip2;
	IBOutlet UILabel *destinationTimeTrip3;
	IBOutlet UILabel *destinationDateTrip1;
	IBOutlet UILabel *destinationDateTrip2;
	IBOutlet UILabel *destinationDateTrip3;
	NSTimer *gametimer;
	
	IBOutlet UIDatePicker *picker;
	IBOutlet UILabel *dateLabel;
	IBOutlet UILabel *timeLabel;

	IBOutlet UIButton *timeTripButton1;
	IBOutlet UIButton *timeTripButton2;
	IBOutlet UIButton *timeTripButton3;
}

@property (nonatomic, retain) IBOutlet UILabel *originLabel;
@property (nonatomic, retain) IBOutlet UILabel *originTimeTrip1;
@property (nonatomic, retain) IBOutlet UILabel *originTimeTrip2;
@property (nonatomic, retain) IBOutlet UILabel *originTimeTrip3;
@property (nonatomic, retain) IBOutlet UILabel *originDateTrip1;
@property (nonatomic, retain) IBOutlet UILabel *originDateTrip2;
@property (nonatomic, retain) IBOutlet UILabel *originDateTrip3;
@property (nonatomic, retain) IBOutlet UILabel *destinationLabel;
@property (nonatomic, retain) IBOutlet UILabel *destinationTimeTrip1;
@property (nonatomic, retain) IBOutlet UILabel *destinationTimeTrip2;
@property (nonatomic, retain) IBOutlet UILabel *destinationTimeTrip3;
@property (nonatomic, retain) IBOutlet UILabel *destinationDateTrip1;
@property (nonatomic, retain) IBOutlet UILabel *destinationDateTrip2;
@property (nonatomic, retain) IBOutlet UILabel *destinationDateTrip3;
@property (nonatomic, retain) NSTimer *gametimer;
@property (nonatomic, retain) IBOutlet UIDatePicker *picker;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
@property (nonatomic, retain) IBOutlet UIButton *timeTripButton1;
@property (nonatomic, retain) IBOutlet UIButton *timeTripButton2;
@property (nonatomic, retain) IBOutlet UIButton *timeTripButton3;

- (void)initializeTimer;
- (void)updateDisplay;
- (void)retrieveDepartureInformation:(NSString *)o destinationStation:(NSString *)d tripDate:(NSString *)date tripTime:(NSString *)time;
- (IBAction)changeToRouteView1:(id)sender;
- (IBAction)changeToRouteView2:(id)sender;
- (IBAction)changeToRouteView3:(id)sender;

	@end
