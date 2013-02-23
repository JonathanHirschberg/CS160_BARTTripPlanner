//
//  Step3ViewController.h
//  BART
//
//  Created by Class Account on 3/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Step3ViewController : UIViewController {
	IBOutlet UILabel *SstartTimeLabel;
	IBOutlet UILabel *SLeg1StartStation;
	IBOutlet UILabel *SLeg1EndStation;
	IBOutlet UILabel *SLeg1Train;
	IBOutlet UILabel *SLeg2StartStation;
	IBOutlet UILabel *SLeg2EndStation;
	IBOutlet UILabel *SLeg2Train;
	IBOutlet UILabel *SLeg3StartStation;
	IBOutlet UILabel *SLeg3EndStation;
	IBOutlet UILabel *SLeg3Train;
}
@property (nonatomic, retain) IBOutlet UILabel *SstartTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *SLeg1StartStation;
@property (nonatomic, retain) IBOutlet UILabel *SLeg1EndStation;
@property (nonatomic, retain) IBOutlet UILabel *SLeg1Train;
@property (nonatomic, retain) IBOutlet UILabel *SLeg2StartStation;
@property (nonatomic, retain) IBOutlet UILabel *SLeg2EndStation;
@property (nonatomic, retain) IBOutlet UILabel *SLeg2Train;
@property (nonatomic, retain) IBOutlet UILabel *SLeg3StartStation;
@property (nonatomic, retain) IBOutlet UILabel *SLeg3EndStation;
@property (nonatomic, retain) IBOutlet UILabel *SLeg3Train;
- (IBAction)returnToInfo:(id)sender;
- (void)update;

@end
