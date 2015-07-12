//
//  MarginUIImageView.m
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "MarginUIImageView.h"

@implementation MarginUIImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 8.0;
    self.clipsToBounds = YES;
    return self;
}

-(id)initWithImage:(nullable UIImage *)image
{
    return self;
}

@end
