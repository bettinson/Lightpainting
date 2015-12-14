//
//  ViewController.m
//  Lightpainting
//
//  Created by Matt Bettinson on 2015-12-05.
//  Copyright © 2015 self. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "AppDelegate.h"
#import "SquareView.h"

@interface ViewController ()
@property UIView *myBox;
@property UIImage *testImage;
@property UIImageView *testImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *myBox = [[SquareView alloc] initWithFrame:CGRectMake(180, 25, 10, 10)];
    myBox.backgroundColor = [UIColor lightGrayColor];
    
    
    //Create and display picture
    self.testImage = [UIImage imageNamed:@"test.png"];
    CGSize newSize = CGSizeMake(500, 500);
    UIGraphicsBeginImageContext(newSize);
    self.testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-100, -100, newSize.width, newSize.height)];
    [self.testImageView setImage:self.testImage];
    [self.testImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:self.testImageView];
    
    UIGraphicsEndImageContext();
    //[self.view addSubview:myBox];
    [self startUpdates];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startUpdates
{
    NSTimeInterval delta = 0.005;
    CMMotionManager *mMananager = [(AppDelegate *)[[UIApplication sharedApplication] delegate] sharedManager];
    if ([mMananager isDeviceMotionAvailable] == YES) {
        [mMananager setDeviceMotionUpdateInterval:delta];
        
        [mMananager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue]
                                       withHandler:^(CMDeviceMotion *data, NSError *error) {
                                           double rotation = atan2(data.gravity.x, data.gravity.y) - M_PI;
                                           double xzMovement = data.gravity.x + data.gravity.z;
                                           double yzMovement = data.gravity.y + data.gravity.z;
//                                           self.testImageView.transform = CGAffineTransformMakeScale (data.gravity.z, data.gravity.z);
                                           self.testImageView.transform = CGAffineTransformRotate(CGAffineTransformMakeScale (data.gravity.z , data.gravity.z), rotation);
                                       }];
    }
}

@end