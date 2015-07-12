//
//  Clue7.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue7.h"

@implementation Clue7

-(NSString *)contentText
{
    
    NSString *para1 = @"Have you figured it out yet? If so, come and find me! Otherwise, there is one final clue waiting for you at Pass My Parcel, Spar Stores, on Craven Road. It's another lovely little local road, and the walk will take you through plenty more nice green areas with lots of beautiful buildings.";
    NSString *para2 = @"The clue that's waiting for you there should point me in my direction, but there's no need to pick it up if you already have it figured out. I'd much rather you came and canoodled :-)";
    NSString *para3 = @"As before, you will need to XXXX to get to it: this time with code XXXXX.";
    
    return [NSString stringWithFormat:@"%@\r\r%@\r\r%@", para1, para2, para3];
}

-(NSString *)helpText
{
    NSString *para1 = @"Oh no! I'd ordered you a copy of Monty Don's Italian Gardens, a BBC documentary. I have no idea how good the documentary is, but I'm intrigued...because there aren't very many Italian Gardens in London ;-)";
    NSString *para2 = @"Can you come and find me now?";
    
    return [NSString stringWithFormat:@"%@\r\r%@", para1, para2];
}

-(NSString *)titleText
{
    return [NSString stringWithFormat:@"Clue Seven"];
}

- (NSString *)backgroundImageName
{
    return @"map7full.png";
}

- (NSString *)navBarImage
{
    return @"seven-black.png";
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
