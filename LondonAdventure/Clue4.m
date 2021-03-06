//
//  Clue4.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue4.h"

@implementation Clue4

-(NSString *)contentText
{
    NSString *para1 = @"Don't worry, we can change those tickets if we need to! Next clue: there's a parcel waiting for you at the CollectPlus at Greenfields Supermarket on Crawford Street. You'll need to show them some ID and quote the code 49YTLHC to access it.";
    NSString *para2 = @"The walk will take you up through North Marylebone, over the top of Montagu and Bryanston Squares, which sit around a couple of lovely private gardens. They were built as part of the Portman Estate in the early 1800s, and first leased to the builder David Porter, who named Montagu Square after a mistress he'd had in his time as a chimney sweep.";
    NSString *para3 = @"Ringo Starr, Jimi Hendrix and John Lennon all used to live at number 39 Montagu Square (though not at the same time, unfortunately).";
    
    return [NSString stringWithFormat:@"%@\r\r%@\r\r%@", para1, para2, para3];
}

-(NSString *)helpText
{
    NSString *para1 = @"No problem! I ordered you a copy of J.M. Barrie's 'The Little White Bird'. It's a book for adults, but it was in here that the character of Peter Pan was created. Barrie subsequently published six chapters of this book as a separate book for children, which was a huge success. Might be worth looking up... ;-)";
    NSString *para2 = @"You also missed another small clue: 01111010. Come and find me!";
    
    return [NSString stringWithFormat:@"%@\r\r%@", para1, para2];
}

- (NSString *)helpImage
{
    return @"clue4.png";
}

-(NSString *)titleText
{
    return [NSString stringWithFormat:@"Clue Four"];
}

- (NSString *)clueCompleteText
{
    return @"You've completed another clue :-)";
}

- (NSString *)navBarImage
{
    return @"four-black.png";
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:4];
}

- (float)locationLat
{
    return 51.5196925;
}

- (float)locationLng
{
    return -0.1601189;
}

@end
