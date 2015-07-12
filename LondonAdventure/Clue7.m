//
//  Clue7.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue7.h"

@implementation Clue7

- (NSString *)backgroundImageName
{
    return @"map7full.png";
}

- (NSString *)helpController
{
    return [NSString stringWithFormat:@"H7"];
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:7];
}

- (float)locationLat
{
    return 51.5136451;
}

- (float)locationLng
{
    return -0.1794191;
}

@end
