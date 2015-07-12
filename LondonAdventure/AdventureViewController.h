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

//@class Clue;

@interface AdventureViewController : UIViewController<CLLocationManagerDelegate>

{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}

@property (strong, nonatomic) Clue *model;

-(void)checkIfCompleted;
-(void)completeClueUI;

@end
                                                                                