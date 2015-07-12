//
//  Clue6.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue6.h"

@implementation Clue6

- (NSString *)backgroundImageName
{
    return @"map6full.png";
}

- (NSString *)helpController
{
    return [NSString stringWithFormat:@"H6"];
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:6];
}

- (float)locationLat
{
    return 51.5140749;
}

- (float)locationLng
{
    return -0.1674053;
}

@end
