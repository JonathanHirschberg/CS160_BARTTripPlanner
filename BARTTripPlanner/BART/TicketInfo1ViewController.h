//
//  TicketInfo1ViewController.h
//  BART
//
//  Created by Class Account on 3/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TicketInfo1ViewController : UIViewController {
	Step1ViewController *step1VC;
	Step2ViewController *step2VC;
	Step3ViewController *step3VC;
	Step4ViewController *step4VC;
}
@property (nonatomic, retain) Step1ViewController *step1VC;
@property (nonatomic, retain) Step2ViewController *step2VC;
@property (nonatomic, retain) Step3ViewController *step3VC;
@property (nonatomic, retain) Step4ViewController *step4VC;
- (IBAction)changeToStep1:(id)sender;
- (IBAction)changeToStep2:(id)sender;
- (IBAction)changeToStep3:(id)sender;
- (IBAction)changeToStep4:(id)sender;

@end
