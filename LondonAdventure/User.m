//
//  User.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "User.h"

@interface User ()

@end

@implementation User

+ (NSArray *)cluesSeen
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults arrayForKey:@"cluesSeen"];
}

+ (NSInteger)cluesSeenCount
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults integerForKey:@"cluesSeenCount"];
}

+ (void)addClueToCluesSeen:(NSNumber *)clue
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *newCluesSeen = [NSMutableArray arrayWithArray:[self cluesSeen]];
    [newCluesSeen addObject:clue];
    NSArray *cluesSeen = [newCluesSeen copy];
    [defaults setObject:cluesSeen forKey:@"cluesSeen"];
    
    NSInteger cluesSeenCount = [defaults integerForKey:@"cluesSeenCount"];
    NSInteger newCluesSeenCount = cluesSeenCount + 1;
    [defaults setInteger:newCluesSeenCount forKey:@"cluesSeenCount"];
    
    [defaults synchronize];
}

+ (void)completeClue:(NSNumber *)clueNumber
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults arrayForKey:@"cluesComplete"])
    {
        NSArray *completeCluesArray = [[NSArray alloc] init];
        [defaults setObject:completeCluesArray forKey:@"cluesComplete"];
    }
    
    NSArray *cluesComplete = [defaults arrayForKey:@"cluesComplete"];
    NSMutableArray *newCluesComplete = [NSMutableArray arrayWithArray:cluesComplete];
    [newCluesComplete addObject:clueNumber];
    NSArray *cluesCompleteTwo = [newCluesComplete copy];
    
    [defaults setObject:cluesCompleteTwo forKey:@"cluesComplete"];
    [defaults synchronize];
}

+ (BOOL)clueCompleted:(NSNumber *)clueNumber
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults arrayForKey:@"cluesComplete"])
    {
        NSArray *completeCluesArray = [[NSArray alloc] init];
        [defaults setObject:completeCluesArray forKey:@"cluesComplete"];
    }
    
    NSArray *cluesComplete = [defaults arrayForKey:@"cluesComplete"];
    NSMutableArray *completeClues = [NSMutableArray arrayWithArray:cluesComplete];
    return [completeClues containsObject:clueNumber];
}

+ (void)addStartTime:(NSDate*)startTime
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:startTime forKey:@"startTime"];
    [defaults synchronize];
}

+ (id)startTime
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"startTime"];
}

+ (BOOL)bonusClueActive
{
    return ([[NSUserDefaults standardUserDefaults] boolForKey:@"bonusClueActive"] || FALSE);
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    return (!![defaults objectForKey:@"bonusClueActive"]);
}

+ (void)activateBonusClue
{
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"bonusClueActive"];
}

@end
