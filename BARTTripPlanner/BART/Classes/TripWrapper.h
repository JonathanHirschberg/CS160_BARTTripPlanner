//
//  TripWrapper.h
//  BART
//
//  Created by Class Account on 2/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TripWrapper : NSObject {
	NSString *originName;
	NSString *originAbbr;
	NSString *destinationName;
	NSString *destinationAbbr;
	NSString *tripFare;
	NSString *tripStartTime;
	NSString *tripEndTime;
	NSString *tripDate;
	NSString *identifier;
}
@property (nonatomic, retain) NSString *originName;
@property (nonatomic, retain) NSString *originAbbr;
@property (nonatomic, retain) NSString *destinationName;
@property (nonatomic, retain) NSString *destinationAbbr;
@property (nonatomic, retain) NSString *tripFare;
@property (nonatomic, retain) NSString *tripStartTime;
@property (nonatomic, retain) NSString *tripEndTime;
@property (nonatomic, retain) NSString *tripDate;
@property (nonatomic, retain) NSString *identifier;

@end
