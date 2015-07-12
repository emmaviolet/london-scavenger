//
//  Clue3.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue3.h"

@implementation Clue3

- (NSString *)backgroundImageName
{
    return @"map3full.png";
}

- (NSString *)helpController
{
    return [NSString stringWithFormat:@"H3"];
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:3];
}

- (float)locationLat
{
    return 51.5194439;
}

- (float)locationLng
{
    return -0.1523374;
}

@end
