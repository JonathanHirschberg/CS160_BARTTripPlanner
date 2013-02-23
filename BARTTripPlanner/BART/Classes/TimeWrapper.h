//
//  TimeWrapper.h
//  BART
//
//  Created by Class Account on 3/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TimeWrapper : NSObject {
	NSString *originTime;
	NSString *originDate;
	NSString *destinationTime;
	NSString *destinationDate;
//	NSMutableArray *tripLegs;
}
@property (nonatomic, retain) NSString *originTime;
@property (nonatomic, retain) NSString *originDate;
@property (nonatomic, retain) NSString *destinationTime;
@property (nonatomic, retain) NSString *destinationDate;
//@property (nonatomic, retain) NSMutableArray *tripLegs;

@end
