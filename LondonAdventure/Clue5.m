//
//  Clue5.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue5.h"

@implementation Clue5

- (NSString *)backgroundImageName
{
    return @"map5full.png";
}

- (NSString *)helpController
{
    return [NSString stringWithFormat:@"H5"];
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:5];
}

- (float)locationLat
{
    return 51.5190898;
}

- (float)locationLng
{
    return -0.1691343;
}

@end
