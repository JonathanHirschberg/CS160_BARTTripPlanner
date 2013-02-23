//
//  Step1ViewController.h
//  BART
//
//  Created by Class Account on 3/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Step1ViewController : UIViewController {
	IBOutlet UILabel *tripFareLabel;
	IBOutlet UILabel *roundtripFareLabel;
}
@property (nonatomic, retain) IBOutlet UILabel *tripFareLabel;
@property (nonatomic, retain) IBOutlet UILabel *roundtripFareLabel;
- (IBAction)returnToInfo:(id)sender;
- (void)loadFare;

@end
