//
//  Clue1.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "Clue1.h"

@interface Clue1 ()

@end


@implementation Clue1

-(id)init
{
    self = [super init];
    return self;
}

-(NSString *)contentText
{
    NSString *para1 = @"There is something waiting for you at Daunt Books to help you on your way. Just give them your name at the counter.";
    NSString *para2 = @"Daunt Books is one of London's greatest bookshops, and I think this branch is exceptionally beautiful. There's an amazing gallery in the back with endless travel books.";
    NSString *para3 = @"Marylebone High Street is owned (as is most of Marylebone) by the Howard de Walden Estate, which is controlled in no small part by the four daughters of the Ninth Baron Howard de Walden, who famously like sushi and shoes (there's a lot of both on the High Street).";
    NSString *para4 = @"You'll want to take the scenic route through Manchester Square and past The Wallace Collection.";
    
    return [NSString stringWithFormat:@"%@\r\r%@\r\r%@\r\r%@", para1, para2, para3, para4];
}

- (NSString *)helpController
{
    return [NSString stringWithFormat:@"H1"];
}

- (NSString *)backgroundImageName
{
    return @"map1full.png";
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:1];
}

- (float)locationLat
{
    return 51.5204144;
}

- (float)locationLng
{
    return -0.1520778;
}


@end
