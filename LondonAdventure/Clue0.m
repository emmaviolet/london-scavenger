//
//  Clue0.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue0.h"

@implementation Clue0

-(NSString *)contentText
{
    NSString *para1 = @"Daniel, I'm afraid I lied. I've ventured into a bit of London I don't know very well, and I'm not sure I'll be back in time for supper. Fortunately, it's a nice bit of the city, and worth exploring, but you'll have to find me first. I've dropped a few clues around the area: you have 90 minutes to piece them together and figure out where I am.";
    NSString *para2 = @"There are six clues to pick up, and directions to each clue will be unlocked when you reach the destination before it. A blue eye will appear at the top of the page once you've reached a destination: if you can't pick up a clue, you can click this and I'll show you what you missed.";
    NSString *para3 = @"Don't worry, I want you to reach me! I'll give you a bonus clue and a distance tracker at the end if you're still struggling. In the meantime, I suspect you will need some help from google to figure this out. See you soon!";
    return [NSString stringWithFormat:@"%@\r\r%@\r\r%@", para1, para2, para3];
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:0];
}

-(NSString *)titleText
{
    return [NSString stringWithFormat:@"London Adventure"];
}

- (NSString *)navBarImage
{
    return @"info.png";
}

@end
