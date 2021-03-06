//
//  Clue3.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue3.h"

@implementation Clue3

-(NSString *)contentText
{
    NSString *para1 = @"Next stop is The Everyman Cinema on Baker Street, where I need you to pick up a couple of tickets in my name, booking reference WJF96K2. The last time I went there, incidentally, was to watch Fifty Shades of Grey with Pier and Sahil. It was terrible and we loved it.";
    NSString *para2 = @"Baker Street was the home of Sherlock Holmes. He lived at Number 221B, which did not exist at the time, but has since been built, and houses the Sherlock Holmes Museum. It's a bit further North, just near Regent's Park.";
    NSString *para3 = @"I'd recommend continuing down Moxon Street and wandering up past Paddington Street Gardens onto Paddington Street, which will take you to Baker Street. But the walk along Crawford Street is lovely too.";
    
    return [NSString stringWithFormat:@"%@\r\r%@\r\r%@", para1, para2, para3];
}

-(NSString *)helpText
{
    NSString *para1 = @"Don't worry, we can pick these up tomorrow. I left two tickets for a showing of Ant-man at 20:50 on Monday evening (no showings of The Minions here, I'm afraid, but this should suit us both). I figured we might feel like a quiet evening by then. I booked seats D1 and D2.";
    NSString *para2 = @"I miss you.";
    
    return [NSString stringWithFormat:@"%@\r\r%@", para1, para2];
}

- (NSString *)helpImage
{
    return @"clue3.png";
}

- (NSString *)clueCompleteText
{
    return @"I can feel you getting closer... :-)";
}

-(NSString *)titleText
{
    return [NSString stringWithFormat:@"Clue Three"];
}

- (NSString *)navBarImage
{
    return @"three-black.png";
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:3];
}

- (float)locationLat
{
    return 51.5204987;
}

- (float)locationLng
{
    return -0.1566289;
}

@end
