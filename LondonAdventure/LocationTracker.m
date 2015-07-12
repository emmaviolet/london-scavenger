//
//  LocationTracker.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "LocationTracker.h"
@import GoogleMaps;

@implementation LocationTracker

- (id)initWithViewController:(id)viewController {
    self = [super init];
    self.distanceFilter = kCLDistanceFilterNone;
    self.desiredAccuracy = kCLLocationAccuracyBest;
    
    self.delegate = viewController;
    [self requestWhenInUseAuthorization];
    [self startUpdatingLocation];
    
    return self;
}

- (BOOL)reachedLocationWithLatitude:(float)latitude andLongitude:(float)longitude
{
    CLLocation *location = [self location];
    {
        float locationLng = location.coordinate.longitude;
        float locationLat = location.coordinate.latitude;
        
        float lngDistance = fabsf(locationLng - longitude);
        float latDistance = fabsf(locationLat - latitude);
        
        NSLog(@"logging location, %f, %f", longitude, latitude);
        
        float allowableDifference = 0.0005;
        return (latDistance < allowableDifference && lngDistance < allowableDifference);
    }
}

- (NSInteger)distanceFromMe
{
    CLLocation *location = [self location];
    {
        float locationLng = location.coordinate.longitude;
        float locationLat = location.coordinate.latitude;
        
        CLLocationCoordinate2D myLocation = CLLocationCoordinate2DMake(51.5106952, -0.1755287);
        CLLocationCoordinate2D userLocation = CLLocationCoordinate2DMake(locationLat, locationLng);
        
        return GMSGeometryDistance(userLocation, myLocation);
    }
}

@end
