//
//  User.h
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

+ (void)addClueToCluesSeen:(NSNumber *)clue;
+ (NSArray *)cluesSeen;
+ (NSInteger)cluesSeenCount;

+ (BOOL)clueCompleted:(NSNumber *)clueNumber;
+ (void)completeClue:(NSNumber *)clueNumber;

+ (void)addStartTime:(NSDate*)startTime;
+ (id)startTime;

@end
