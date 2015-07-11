//
//  MarginUILabel.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "MarginUILabel.h"

@implementation MarginUILabel

- (void)drawTextInRect:(CGRect)rect {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 8.0;
    self.numberOfLines = 0;
    UIEdgeInsets insets = {0, 20, 0, 20};
    
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
    
    self.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    self.adjustsFontSizeToFitWidth = YES;
    self.minimumScaleFactor = 10.0f/12.0f;
    self.clipsToBounds = YES;
    self.textColor = [UIColor blackColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
