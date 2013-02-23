//
//  MapViewController.h
//  BART
//
//  Created by Class Account on 3/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//  followed this tutorial:
//  http://howtomakeiphoneapps.com/2009/12/how-to-use-uiscrollview-in-your-iphone-app/

#import <UIKit/UIKit.h>


@interface MapViewController : UIViewController<UIScrollViewDelegate> {
	IBOutlet UIScrollView *scrollView;
	UIImageView *imageView;
}
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIImageView *imageView;

@end
