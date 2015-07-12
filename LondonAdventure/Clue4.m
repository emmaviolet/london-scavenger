//
//  Clue4.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue4.h"

@implementation Clue4

- (NSString *)backgroundImageName
{
    return @"map4full.png";
}

- (NSString *)helpController
{
    return [NSString stringWithFormat:@"H4"];
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:4];
}

- (float)locationLat
{
    return 51.5196925;
}

- (float)locationLng
{
    return -0.1601189;
}

@end
