//
//  Clue.h
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright (c) 2015 Emma Makinson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationTracker.h"


@class AdventureViewController;

@interface Clue : NSObject

@property (nonatomic, strong) NSString *backgroundImageName;
@property (nonatomic, assign) NSNumber *clueNumber;
@property (strong, nonatomic) NSString *contentText;
@property (strong, nonatomic) NSString *helpText;
@property (strong, nonatomic) NSString *navBarImage;
@property (strong, nonatomic) NSString *titleText;

@property (nonatomic, assign) float locationLat;
@property (nonatomic, assign) float locationLng;

@property (nonatomic, strong) NSString *helpController;
@property (nonatomic, strong) NSTimer *locationTracker;
@property (nonatomic, strong) LocationTracker *locationManager;

@property (nonatomic, strong) AdventureViewController *viewController;

-(void)clueCompleteProcess;
-(void)setupLocationTracker;

@end
