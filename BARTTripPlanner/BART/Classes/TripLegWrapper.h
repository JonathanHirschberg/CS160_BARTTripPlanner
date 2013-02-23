//
//  TripLegWrapper.h
//  BART
//
//  Created by Class Account on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TripLegWrapper : NSObject {
	NSString *torder;
	NSString *torigin;
	NSString *tdestination;
	NSString *trainHeadStation;
}
@property (nonatomic, retain) NSString *torder;
@property (nonatomic, retain) NSString *torigin;
@property (nonatomic, retain) NSString *tdestination;
@property (nonatomic, retain) NSString *trainHeadStation;

@end
