//
//  XMLParser.m
//  BART
//
//  Created by Class Account on 2/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//  taken from http://www.iphonesdkarticles.com/2008/11/parsing-xml-files.html

#import "TripWrapper.h"
#import "RootViewController.h"
#import "RoutesViewController.h"
#import "BARTAppDelegate.h"
#import "XMLParser.h"
#import "TimeWrapper.h"
#import "TripLegWrapper.h"

@implementation XMLParser

@synthesize appDelegate;

- (XMLParser *) initXMLParser {
	[super init];
	appDelegate = (BARTAppDelegate *)[[UIApplication sharedApplication] delegate];
//	NSLog(@"initializing appDelegate");
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict {
	
	if([elementName isEqualToString:@"name"]) {
//		appDelegate.stationList 
//		NSLog(@"Processing Element: %@", elementName);
	}
	else if([elementName isEqualToString:@"abbr"]) {
//		NSLog(@"Processing Element: %@", elementName);
	}
	else if([elementName isEqualToString:@"fare"]) {
		NSLog(@"Processing Element: %@", elementName);
	}
	else if([elementName isEqualToString:@"trip"]) {
		//		NSMutableString *fareValue = [[NSMutableString alloc]initWithString:[attributeDict objectForKey:@"fare"]];
		//		appDelegate.tripFare = fareValue;//[fareValue floatValue];
		TimeWrapper *tw = [[TimeWrapper alloc] init];
//		NSLog(@"before");
		tw.originTime = [attributeDict objectForKey:@"origTimeMin"];
		tw.originDate = [attributeDict objectForKey:@"origTimeDate"];
		tw.destinationTime = [attributeDict objectForKey:@"destTimeMin"];
		tw.destinationDate = [attributeDict objectForKey:@"destTimeDate"];
//		NSLog(@"originTime: %@", tw.originTime);
//		NSLog(@"originDate: %@", tw.originDate);
//		NSLog(@"destinationTime: %@", tw.destinationTime);
//		NSLog(@"destinationDate: %@", tw.destinationDate);
		//		[fareValue release];
//		NSLog(@"[appDelegate.ArrivalsAndDepartures count] = %d", [appDelegate.ArrivalsAndDepartures count]);
//		NSLog(@"processing trip data successful");
	
		if(tw.originTime != nil && tw.originDate != nil && tw.destinationTime != nil && tw.destinationDate != nil) {
			[appDelegate.ArrivalsAndDepartures addObject:tw];
		}
		
		[tw release];		
	}
	else if([elementName isEqualToString:@"leg"]) {
		// Trip Legs
		TripLegWrapper *tlw = [[TripLegWrapper alloc] init];
		tlw.torder = [attributeDict objectForKey:@"order"];
		tlw.torigin = [attributeDict objectForKey:@"origin"];
		tlw.tdestination = [attributeDict objectForKey:@"destination"];
		tlw.trainHeadStation = [attributeDict objectForKey:@"trainHeadStation"];
		if(tlw.torder != nil && tlw.torigin != nil && tlw.tdestination != nil && tlw.trainHeadStation != nil) {
			[appDelegate.TripLegs addObject:tlw];
		}
		
		[tlw release];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	if(!currentElementValue)
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
		[currentElementValue appendString:string];
//	NSLog(@"ProcessingValue: %@", currentElementValue);
//	currentElementValue = string;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
//	NSLog(elementName);
	if([elementName isEqualToString:@"name"]) {
		NSMutableString *nameValue = [[NSMutableString alloc]initWithString:currentElementValue];
//		NSLog(@"hello");
		[appDelegate.stationNameList addObject:nameValue];
		[nameValue release];
//		NSLog(@"processed something: %@", currentElementValue);
	}
	if([elementName isEqualToString:@"abbr"]) {
		NSMutableString *abbrValue = [[NSMutableString alloc]initWithString:currentElementValue];
//		NSLog(@"goodbye");
		[appDelegate.stationAbbrList addObject:abbrValue];
		[abbrValue release];
//		NSLog(@"processed something: %@", currentElementValue);
	}
	if([elementName isEqualToString:@"fare"]) {
		NSMutableString *fareValue = [[NSMutableString alloc]initWithString:currentElementValue];
		appDelegate.tripFare = fareValue;//[fareValue floatValue];
//		NSLog(@"fare value %@", fareValue);
//		NSLog(@"trip fare %@", appDelegate.tripFare);
		[fareValue release];
//		NSLog(@"fare processing complete");
	}
	[currentElementValue release];
	currentElementValue = nil;
}

@end
