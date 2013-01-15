//
//  AppDelegate.h
//  TutorialGame
//
//  Created by Patrick Danford on 1/14/13.
//  Copyright IBM 2013. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
