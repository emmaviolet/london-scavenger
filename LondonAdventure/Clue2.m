//
//  Clue2.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue2.h"

@implementation Clue2

- (NSString *)backgroundImageName
{
    return @"map2full.png";
}

- (NSString *)helpController
{
    return [NSString stringWithFormat:@"H2"];
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:2];
}

- (float)locationLat
{
    return 51.5197492;
}

- (float)locationLng
{
    return -0.152225;
}

@end
