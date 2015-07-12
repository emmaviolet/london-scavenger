//
//  ClueHelpAlertView.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright (c) 2015 Emma Makinson. All rights reserved.
//

#import "ClueHelpAlertView.h"

@implementation ClueHelpAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithClueCount:(NSInteger)clueCount andDelegateTo:(id)delegator
{
    if (clueCount == 0)
    {
        self = [super initWithTitle:@"Show Clue" message:@"Are you sure you would like to see this clue? You will only be able to see two." delegate:delegator cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    }
    if (clueCount == 1)
    {
        self = [super initWithTitle:@"Show Clue" message:@"Are you sure you would like to see this clue? You can only see one more." delegate:delegator cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    }
    if (clueCount >= 2)
    {
        self = [super initWithTitle:@"Show Clue" message:@"You have already seen two clues. I won't let you see any more!" delegate:delegator cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
    return self;
}

- (id)initWithClueRepeatedandDelegateTo:(id)delegator
{
    self = [super initWithTitle:@"Show Clue" message:@"You have already seen this clue, and may see it as many times as you like. Would you like to see it again?" delegate:delegator cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    return self;
}

@end
