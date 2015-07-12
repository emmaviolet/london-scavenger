//
//  Clue2.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue2.h"

@implementation Clue2

-(NSString *)contentText
{
    NSString *para1 = @"There is another little something waiting for you at Rococo Chocolates on Moxon Street, just around the corner. The chocolates here are really yummy, so please don't eat them all without me :-(";
    NSString *para2 = @"There are a couple of other really great food shops on this road, which it's worth stopping in to if you have time. La Fromagerie is just opposite Rococo, and is one of London's best cheese shops (the other is Neal's Yard Dairy, in Covent Garden). The Ginger Pig is just a little further down Moxon Street, and is a fantastic butcher. I wouldn't mind some goat's cheese or a couple of scotch eggs if you feel like popping in to either ;-) (no worries if not).";
    
    return [NSString stringWithFormat:@"%@\r\r%@", para1, para2];
}

-(NSString *)helpText
{
    NSString *para1 = @"That's a shame: you were going to pick up some yummy chocolates. I left you a Rococo Gusto Italiano Drum, with some roasted almonds and coffee beans covered in chocolate. Don't worry, there is plenty more food where I am.";
    NSString *para2 = @"You also missed one more small clue: 01100001. Missing you.";
    
    return [NSString stringWithFormat:@"%@\r\r%@", para1, para2];
}

-(NSString *)titleText
{
    return [NSString stringWithFormat:@"Clue Two"];
}

- (NSString *)backgroundImageName
{
    return @"map2full.png";
}

- (NSString *)navBarImage
{
    return @"two-black.png";
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
