//
//  DisplayCostRoute.h
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//  http://www.iphonesdkarticles.com/2009/01/uipickerview-creating-simple-picker.html

#import <UIKit/UIKit.h>


@interface DisplayCostRoute : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
	IBOutlet UIPickerView *pickerView;
	IBOutlet UILabel *originLabel;
	IBOutlet UILabel *destinationLabel;
	IBOutlet UILabel *fareLabel;
	IBOutlet UILabel *roundTripFareLabel;
	ScheduleViewController *myscheduleViewController;
}
@property (nonatomic, retain) UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UILabel *originLabel;
@property (nonatomic, retain) IBOutlet UILabel *destinationLabel;
@property (nonatomic, retain) IBOutlet UILabel *fareLabel;
@property (nonatomic, retain) IBOutlet UILabel *roundTripFareLabel;
@property (nonatomic, retain) ScheduleViewController *myscheduleViewController;
- (void)retrieveFare:(NSString *)o destinationStation:(NSString *)d;
- (IBAction)gotoSchedule:(id)sender;

@end
