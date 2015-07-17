//
//  AdventureViewController.h
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Clue.h"
#import "MarginUILabel.h"

//@class Clue;

@interface AdventureViewController : UIViewController<CLLocationManagerDelegate>

{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}

@property (strong, nonatomic) Clue *model;
@property (nonatomic, strong) UIImageView *checkmark;
@property (nonatomic, strong) UIButton *eyeButton;
@property (nonatomic, strong) MarginUILabel *titleLabel;
@property (strong, nonatomic) IBOutlet MarginUILabel *distanceLabel;

-(void)checkIfCompleted;
-(void)completeClueUI;
-(void)eyeTap:(UIButton *)sender;
-(void)stopLocationTracker;

@end
                                                                                