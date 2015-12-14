//
//  AppDelegate.h
//  Lightpainting
//
//  Created by Matt Bettinson on 2015-12-05.
//  Copyright © 2015 self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic, readonly) CMMotionManager *sharedManager;

@end

