//
//  XMLParser.h
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//  taken from http://www.iphonesdkarticles.com/2008/11/parsing-xml-files.html

#import <UIKit/UIKit.h>

//@class BARTAppDelegate;

@interface XMLParser : NSObject {
	NSMutableString *currentElementValue;
	BARTAppDelegate *appDelegate;
}

@property (nonatomic,retain) BARTAppDelegate *appDelegate;
-(XMLParser *) initXMLParser;

@end
