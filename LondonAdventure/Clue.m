//
//  Clue.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright (c) 2015 Emma Makinson. All rights reserved.
//

#import "Clue.h"
#import "User.h"
#import "AdventureViewController.h"

@interface Clue ()


@end

@implementation Clue

- (NSString *)backgroundImageName
{
    return @"london-wallpaper.png";
}

//-(void)setupLocationTracker
//{
//    if (self.locationLat && self.locationLng && ![User clueCompleted:self.clueNumber])
//    {
//        self.locationTracker = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                                                target:self
//                                                              selector:@selector(CurrentLocationIdentifier)
//                                                              userInfo:nil
//                                                               repeats:YES];
//    }
//    
//}
//
//-(void)stopLocationTracker
//{
//    [self.locationTracker invalidate];
//    self.locationTracker = nil;
//}
//
//-(void)CurrentLocationIdentifier
//{ self.locationManager = [[LocationTracker alloc] initWithViewController:self]; }
//
//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
//{
//    [self.locationManager stopUpdatingLocation];
//    if ([self.locationManager reachedLocationWithLatitude:self.locationLat andLongitude:self.locationLng])
//    {
//        [self clueCompleteProcess];
//        [self.viewController completeClueUI];
//    }
//    GMSGeometryDistance
//    
//    51.5106952 -0.1755287
//}
//
//- (void)clueCompleteProcess
//{
//    [User completeClue:self.clueNumber];
////    [self stopLocationTracker];
//}

@end
