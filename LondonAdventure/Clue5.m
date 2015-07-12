//
//  Clue5.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue5.h"

@implementation Clue5

-(NSString *)contentText
{
    NSString *para1 = @"Fleecey, I miss you. Have you got any ideas yet? Just a warning, the clues are going to be a bit fewer and farther between from this point in...";
    NSString *para2 = @"Your next clue is waiting for you at The Devonshire Pharmacy, 215 Edgware Road. It's at the top of the Edgware Road, where it crosses with Praed Street - about a ten minute walk.";
    NSString *para3 = @"The Edgware Road, otherwise known as 'Little Cairo' or 'Little Beirut', is one of my favourite places, especially in the evening. It feels lively and real, and a world away from Marylebone.";
    NSString *para4 = @"I dropped a few photos there earlier for you to pick up. They should be expecting you!";
    
    return [NSString stringWithFormat:@"%@\r\r%@\r\r%@\r\r%@", para1, para2, para3, para4];
}

-(NSString *)helpText
{
    NSString *para1 = @"Hey, that's a shame, but don't worry: there's one of the photos you missed below. I hope you can figure it out and come and find me :-)";
    NSString *para2 = @"You also missed one last small clue: 01100001. I won't be giving you any more of these so you'll have to work with what you've got!";
    
    return [NSString stringWithFormat:@"%@\r\r%@", para1, para2];
}

- (NSString *)helpImage
{
    return @"clue5.png";
}

-(NSString *)titleText
{
    return [NSString stringWithFormat:@"Clue Five"];
}

- (NSString *)navBarImage
{
    return @"five-black.png";
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
