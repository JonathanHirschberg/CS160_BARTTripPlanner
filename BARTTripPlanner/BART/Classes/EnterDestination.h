//
//  EnterDestination.h
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EnterDestination : UITableViewController {
	BARTAppDelegate *appDelegate;
//	NSString *stationList;
}
@property (nonatomic, retain) BARTAppDelegate *appDelegate;
//@property (nonatomic, retain) NSString *stationList;

@end