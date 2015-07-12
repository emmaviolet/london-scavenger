//
//  ClueHelpAlertView.h
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright (c) 2015 Emma Makinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClueHelpAlertView : UIAlertView

- (id)initWithClueCount:(NSInteger)clueCount andDelegateTo:(id)delegator;
- (id)initWithClueRepeatedandDelegateTo:(id)delegator;

@end
