//
//  Clue6.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue6.h"

@implementation Clue6

-(NSString *)contentText
{
    NSString *para1 = @"The next clue is at Spirited Wines on Connaught Street. It's firmly in Bayswater, where the architectural traditionalism belies significant cultural diversity: there's a Greek Orthodox church, which attracts a large Greek community; and it's also home to London's biggest Brazilian community.";
    NSString *para2 = @"This area is also full of beautiful squares surrounding large gated gardens. On your way, you'll pass Connaught Square, which is particularly lovely: it was built in the early 1900s as part of the Hyde Park Estate, and is now where Tony Blair keeps his London home.";
    NSString *para3 = @"Maroush Deli, on the corner of the Edgware Road and Connaught Street, is the best place to stop off if you're feeling peckish (don't fill yourself up too much, please).";
    
    return [NSString stringWithFormat:@"%@\r\r%@\r\r%@", para1, para2, para3];
}

-(NSString *)helpText
{    
    NSString *para1 = @"We'd better find something else to drink! I left you a bottle of Umani Ronchi Pecorino 'Golden Fleece' 2013 (sorry fleecey, I couldn't resist), from Abruzzo in Italy.";
    NSString *para2 = @" You also missed one last small clue: 01100001. I won't be giving you any more of these so you'll have to work with what you've got!";
    
    return [NSString stringWithFormat:@"%@\r\r%@", para1, para2];
}

- (NSString *)helpImage
{
    return @"clue6.png";
}

- (NSString *)clueCompleteText
{
    return @"Have you figured it out yet? If not, you can have a bonus clue. Just click the plus button at the top to unlock it.";
}

-(NSString *)titleText
{
    return [NSString stringWithFormat:@"Clue Six"];
}

- (NSString *)navBarImage
{
    return @"six-black.png";
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
