//
//  Clue.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright (c) 2015 Emma Makinson. All rights reserved.
//

#import "Clue.h"

@interface Clue ()
@property (nonatomic, strong) NSString *backgroundImageName;
@property (nonatomic, strong) NSString *helpController;
@property (nonatomic, assign) float locationLat;
@property (nonatomic, assign) float locationLng;

@property (nonatomic, assign) int resetDefaults;
@property (nonatomic, assign) int repeatingClue;

@property (nonatomic, assign) NSNumber *clueNumber;

@property (nonatomic, strong) NSTimer *locationTracker;

@property (strong, nonatomic) NSString *contentText;

@end

@implementation Clue

@end
