//
//  AdventureViewController.h
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AdventureViewController : UIViewController<CLLocationManagerDelegate>

{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}

-(NSNumber *)clueNumber;
-(void)checkIfCompleted;
-(BOOL)clueComplete;

@end
