//
//  RoutesViewController.h
//  BART
//
//  Created by Class Account on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RoutesViewController : UIViewController {
	IBOutlet UILabel *startTime;
	IBOutlet UILabel *endTime;
	IBOutlet UILabel *date;
	IBOutlet UILabel *Leg1StartStation;
	IBOutlet UILabel *Leg1EndStation;
	IBOutlet UILabel *Leg1Train;
	IBOutlet UILabel *Leg2StartStation;
	IBOutlet UILabel *Leg2EndStation;
	IBOutlet UILabel *Leg2Train;
	IBOutlet UILabel *Leg3StartStation;
	IBOutlet UILabel *Leg3EndStation;
	IBOutlet UILabel *Leg3Train;
	IBOutlet UILabel *originLabel;
	IBOutlet UILabel *destinationLabel;
	IBOutlet UILabel *fare;
	IBOutlet UILabel *roundTripFare;
}
@property (nonatomic, retain) IBOutlet UILabel *Leg1StartStation;
@property (nonatomic, retain) IBOutlet UILabel *Leg1EndStation;
@property (nonatomic, retain) IBOutlet UILabel *Leg1Train;
@property (nonatomic, retain) IBOutlet UILabel *Leg2StartStation;
@property (nonatomic, retain) IBOutlet UILabel *Leg2EndStation;
@property (nonatomic, retain) IBOutlet UILabel *Leg2Train;
@property (nonatomic, retain) IBOutlet UILabel *Leg3StartStation;
@property (nonatomic, retain) IBOutlet UILabel *Leg3EndStation;
@property (nonatomic, retain) IBOutlet UILabel *Leg3Train;
@property (nonatomic, retain) IBOutlet UILabel *originLabel;
@property (nonatomic, retain) IBOutlet UILabel *destinationLabel;
@property (nonatomic, retain) IBOutlet UILabel *fare;
@property (nonatomic, retain) IBOutlet UILabel *roundTripFare;
- (void)LoadTripData:(int)tripNumber;
- (void)LoadFromSavedData:(int)tripNumber;
- (NSString *)ResolveStationName:(NSString *)stationAbbr;
- (IBAction)SaveTrip:(id)sender;
- (IBAction)CancelTrip:(id)sender;
- (void)UpdateAppD;

@end
