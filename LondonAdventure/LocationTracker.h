//
//  LocationTracker.h
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface LocationTracker : CLLocationManager

- (id)initWithViewController:(id)viewController;
- (BOOL)reachedLocationWithLatitude:(float)latitude andLongitude:(float)longitude;

@end
